module Instruction_Memory_1#(parameter width = 32)(
    input [width-1:0] address,
    output [width-1:0] instruction
    );
    
    reg [width-1:0] memory_big [0:1920];
    
    initial begin
        $readmemh("instruction_memory_file.mem",memory_big);
    end
    
    wire [11:0] indexed_value = address[30:0] / 4;
    assign instruction = memory_big [indexed_value];
endmodule
