library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FFT_Module is
    Port (
        clk    : in std_logic;
        rst    : in std_logic;
        start  : in std_logic;
        real   : in std_logic_vector(9 downto 0) array (0 to 255);
        busy   : out std_logic;
        valid  : out std_logic;
        bar    : out std_logic_vector(13 downto 0) array (0 to 127);
        ibar   : out std_logic_vector(13 downto 0) array (0 to 127)
    );
end FFT_Module;

architecture Behavioral of FFT_Module is

-- State Definitions
    type state_type is (idle, load, first_dragon, second_dragon, third_dragon, fourth, finish);
    signal state : state_type;
    signal stage : std_logic_vector(3 downto 0);

-- Array Declarations
    type signed_array is array (0 to 255) of signed(12 downto 0);
    signal InputReal_Shift : signed_array;
    signal InputImag_Shift : signed_array;

-- Counters and Offsets
    signal counter, counter1, add_to, offset : std_logic_vector(7 downto 0);

-- Index Calculations
    signal index0, index1, index2, index3 : std_logic_vector(7 downto 0);
    signal index1_multiply, index2_multiply, index3_multiply : std_logic_vector(7 downto 0);

-- Index Registers
    signal index0_reg, index1_reg, index2_reg, index3_reg : std_logic_vector(7 downto 0);
    signal index0_MultiplyReg, index1_MultiplyReg, index2_MultiplyReg, index3_MultiplyReg : std_logic_vector(7 downto 0);
    signal index0_regN, index1_regN, index2_regN, index3_regN : std_logic_vector(7 downto 0);


-- Inputs for the adders
    signal Real_Input1, Real_Input2, Real_Input3, Real_Input4 : signed(13 downto 0);
    signal Imag_Input1, Imag_Input2, Imag_Input3, Imag_Input4 : signed(13 downto 0);

-- Outputs for the adders
    signal Real_Out1 , Real_Out2, Real_Out3, Real_Out4 : signed(13 downto 0);
    signal Imag_Out1 , Imag_Out2, Imag_Out3, Imag_Out4 : signed(13 downto 0);
    
-- Twiddle ROM signals
    signal adr2, adr3, adr4 : std_logic_vector(7 downto 0);
    signal out_real2, out_imag2, out_real3, out_imag3, out_real4, out_imag4 : signed(11 downto 0);

-- Component declaration for the Twiddle ROM
    component Twiddle_ROM
        Port (
            adr2 : in std_logic_vector(7 downto 0);
            adr3 : in std_logic_vector(7 downto 0);
            adr4 : in std_logic_vector(7 downto 0);
            out_real2 : out signed(11 downto 0);
            out_imag2 : out signed(11 downto 0);
            out_real3 : out signed(11 downto 0);
            out_imag3 : out signed(11 downto 0);
            out_real4 : out signed(11 downto 0);
            out_imag4 : out signed(11 downto 0)
        );
    end component;

-- Temporary storage for results from the dragonfly adder
    signal Temp_Real2, Temp_Real3, Temp_Real4 : signed(13 downto 0);
    signal Temp_Imag2, Temp_Imag3, Temp_Imag4 : signed(13 downto 0);
    -- Intermediate signals for complex multiplication results
    signal Mult_RealOut2, Mult_ImagOut2, Mult_RealOut3, Mult_ImagOut3, Mult_RealOut4, Mult_ImagOut4 : signed(25 downto 0);
    signal Mult16bit_RealOut2 ,Mult16bit_RealOut3 ,Mult16bit_RealOut4  : signed(25 downto 0);
    signal Mult16bit_ImagOut2 ,Mult16bit_ImagOut3 ,Mult16bit_ImagOut4 : signed(25 downto 0);

begin


     -- Dragonfly adder calculations
    Real_Out1 <= Real_Input1 + Real_Input2 + Real_Input3 + Real_Input4;
    Imag_Out1 <= Imag_Input1 + Imag_Input2 + Imag_Input3 + Imag_Input4;

    Real_Out2 <= Real_Input1 + Imag_Input2 - Real_Input3 - Imag_Input4;
    Imag_Out2 <= Imag_Input1 - Real_Input2 - Imag_Input3 + Real_Input4;

    Real_Out3 <= Real_Input1 - Real_Input2 + Real_Input3 - Real_Input4;
    Imag_Out3 <= Imag_Input1 - Imag_Input2 + Imag_Input3 - Imag_Input4;

    Real_Out4 <= Real_Input1 - Imag_Input2 - Real_Input3 + Imag_Input4;
    Imag_Out4 <= Imag_Input1 + Real_Input2 - Imag_Input3 - Real_Input4;

    -- Twiddle ROM instantiation
    Twiddle_ROM_inst : Twiddle_ROM
        port map (
            adr2 => adr2,
            adr3 => adr3,
            adr4 => adr4,
            out_real2 => out_real2,
            out_imag2 => out_imag2,
            out_real3 => out_real3,
            out_imag3 => out_imag3,
            out_real4 => out_real4,
            out_imag4 => out_imag4
        );
	
-- Complex multiplication operations
    Mult_RealOut2 <= ((Temp_Real2 * out_real2 - Temp_Imag2 * out_imag2)) srl 10;
    Mult_ImagOut2 <= ((Temp_Real2 * out_imag2 + Temp_Imag2 * out_real2)) srl 10;

    Mult_RealOut3 <= ((Temp_Real3 * out_real3 - Temp_Imag3 * out_imag3)) srl 10;
    Mult_ImagOut3 <= ((Temp_Real3 * out_imag3 + Temp_Imag3 * out_real3)) srl 10;

    Mult_RealOut4 <= ((Temp_Real4 * out_real4 - Temp_Imag4 * out_imag4)) srl 10;
    Mult_ImagOut4 <= ((Temp_Real4 * out_imag4 + Temp_Imag4 * out_real4)) srl 10;

    -- Assigning the lower 14 bits of the multiplication results to outputs
    Mult16bit_RealOut2 <= Mult_RealOut2(13 downto 0);
    Mult16bit_RealOut3 <= Mult_RealOut3(13 downto 0);
    Mult16bit_RealOut4 <= Mult_RealOut4(13 downto 0);

    Mult16bit_ImagOut2 <= Mult_ImagOut2(13 downto 0);
    Mult16bit_ImagOut3 <= Mult_ImagOut3(13 downto 0);
    Mult16bit_ImagOut4 <= Mult_ImagOut4(13 downto 0);


    Gen_Real: for a in 0 to 3 generate
        Gen_Real_B: for b in 0 to 3 generate
            Gen_Real_C: for c in 0 to 3 generate
                -- Combinatorial process for sorting outputs
                process(InputReal_Shift, InputImag_Shift)
                begin
                    sort_real(4*c + b*16 + a*64) <= InputReal_Shift(c*16 + b*16 + a);
                    sort_real(4*c + b*16 + a*64 + 1) <= InputReal_Shift(c*16 + b*16 + a + 64);
                    sort_real(4*c + b*16 + a*64 + 2) <= InputReal_Shift(c*16 + b*16 + a + 128);
                    sort_real(4*c + b*16 + a*64 + 3) <= InputReal_Shift(c*16 + b*16 + a + 192);

                    sort_imag(4*c + b*16 + a*64) <= InputImag_Shift(c*16 + b*16 + a);
                    sort_imag(4*c + b*16 + a*64 + 1) <= InputImag_Shift(c*16 + b*16 + a + 64);
                    sort_imag(4*c + b*16 + a*64 + 2) <= InputImag_Shift(c*16 + b*16 + a + 128);
                    sort_imag(4*c + b*16 + a*64 + 3) <= InputImag_Shift(c*16 + b*16 + a + 192);
                end process;
            end generate;
        end generate;
    end generate;
end Behavioral;
	