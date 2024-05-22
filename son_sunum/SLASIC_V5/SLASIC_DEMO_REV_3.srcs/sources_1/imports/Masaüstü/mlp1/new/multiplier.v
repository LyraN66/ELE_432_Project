//////////////////////////////////////////////////////////////////////////////////
// Company: Slasic
// Engineer: Cimonk
// 
// Create Date: 02/11/2024 04:12:39 PM
// Design Name: Multplier
// Module Name: multplier
// Project Name: CPU
// Target Devices: nexys3 100T
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module multiplier#(parameter width=23)(
input [width-1:0]rs1_i,
input [width-1:0]rs2_i,
input start,
input clk_i,
input rst_i,
  
output [48:0]result_o,
output reg valid
    );
  reg [width-1:0]rs1_ir;
  reg [width+1:0]rs2_ir;   
    
wire [width+3:0]radix4_decoder = start1 ? {3'b001,rs1_ir,1'b0} : 27'b0;    
reg  [width+1:0]PartialProducts [0:12];    // all partial products that generated via radix4 decoder
wire [width+1:0] rs2_2scomp = ~rs2_ir;

// radix 4 booth decode stage  
reg [25:0]cary; 
reg [12:0]sign,sign1;
genvar k;    
generate
    for(k=0 ;k<13; k=k+1)begin
        always @(*)begin
            case(radix4_decoder[2+2*k:2*k])
                3'b000:begin
                  	PartialProducts[k]=25'b0;
                    cary[2*k]=0;
                    cary[2*k+1]=0;
                  	sign[k]=0;
                end
                3'b001:begin
                  	PartialProducts[k]=rs2_ir;
                    cary[2*k]=0;
                    cary[2*k+1]=0;
                  	sign[k]=0;
                end
                3'b010:begin
                  	PartialProducts[k]=rs2_ir;
                    cary[2*k]=0;
                    cary[2*k+1]=0;
                  	sign[k]=0;
                end
                3'b011:begin
                  	PartialProducts[k]=rs2_ir<<1;
                    cary[2*k]=0;
                    cary[2*k+1]=0;
                  	sign[k]=0;
                end
                3'b100:begin
                    PartialProducts[k]=rs2_2scomp<<1;
                    cary[2*k]=0;
                    cary[2*k+1]=1;
                  	sign[k]=1;
                end
                3'b101:begin
                    PartialProducts[k]=rs2_2scomp;
                    cary[2*k]=1;
                    cary[2*k+1]=0;
                  	sign[k]=1;
                end
                3'b110:begin
                    PartialProducts[k]=rs2_2scomp;
                    cary[2*k]=1;
                    cary[2*k+1]=0;
                  	sign[k]=1;
                end
                3'b111:begin
                  	PartialProducts[k]=25'b0;
                    cary[2*k]=0;
                    cary[2*k+1]=0;
                  	sign[k]=0;
                end
            endcase

        end  
    
    end
    endgenerate
reg  [width+1:0] PartialProducts1 [0:12];
wire [48:0] partialproducts46bit [0:12];    
  assign partialproducts46bit[0] =sign1[0] ? {{24{1'b1}},PartialProducts1[0]}       :{24'b0,PartialProducts1[0]}  ;     
  assign partialproducts46bit[1] =sign1[1] ? {{22{1'b1}},PartialProducts1[1],2'h0}  :{22'b0,PartialProducts1[1],2'h0}  ;   
  assign partialproducts46bit[2] =sign1[2] ? {{20{1'b1}},PartialProducts1[2],4'h0}  :{20'b0,PartialProducts1[2],4'h0}  ;   
  assign partialproducts46bit[3] =sign1[3] ? {{18{1'b1}},PartialProducts1[3],6'h0}  :{18'b0,PartialProducts1[3],6'h0}  ;   
  assign partialproducts46bit[4] =sign1[4] ? {{16{1'b1}},PartialProducts1[4],8'h0}  :{16'b0,PartialProducts1[4],8'h0}  ;   
  assign partialproducts46bit[5] =sign1[5] ? {{14{1'b1}},PartialProducts1[5],10'h0} :{14'b0,PartialProducts1[5],10'h0}  ;   
  assign partialproducts46bit[6] =sign1[6] ? {{12{1'b1}},PartialProducts1[6],12'h0} :{12'b0,PartialProducts1[6],12'h0}  ;   
  assign partialproducts46bit[7] =sign1[7] ? {{10{1'b1}},PartialProducts1[7],14'h0}  :{10'b0,PartialProducts1[7],14'h0}  ;   
  assign partialproducts46bit[8] =sign1[8] ? {{8{1'b1}},PartialProducts1[8],16'h0}  :{8'b0,PartialProducts1[8],16'h0}  ;   
  assign partialproducts46bit[9] =sign1[9] ? {{6{1'b1}},PartialProducts1[9],18'h0}  :{6'b0,PartialProducts1[9],18'h0}  ;   
  assign partialproducts46bit[10]=sign1[10]? {{4{1'b1}},PartialProducts1[10],20'h0} :{4'b0,PartialProducts1[10],20'h0} ;  
  assign partialproducts46bit[11]=sign1[11]? {{2{1'b1}},PartialProducts1[11],22'h0} :{2'b0,PartialProducts1[11],22'h0} ;     
  assign partialproducts46bit[12]=sign1[12]? {PartialProducts1[12],24'h0} :{PartialProducts1[12],24'h0} ;    
// wallace tree adder  

//First Adders
reg  [48:0]pipeline1[0:7],pipeline2[0:4],pipeline3[0:1];
wire [48:0] comp1_out1,comp1_out2,comp1_out3;
comparasor_46bit  first1(.x1(partialproducts46bit[0]),.x2(partialproducts46bit[1]),.x3(partialproducts46bit[2]),.x4(partialproducts46bit[3]),.x5(partialproducts46bit[4]),.out1(comp1_out1),.out2(comp1_out2),.out3(comp1_out3));

wire [48:0] comp2_out1,comp2_out2,comp2_out3;
comparasor_46bit  first2(.x1(partialproducts46bit[5]),.x2(partialproducts46bit[6]),.x3(partialproducts46bit[7]),.x4(partialproducts46bit[8]),.x5(partialproducts46bit[9]),.out1(comp2_out1),.out2(comp2_out2),.out3(comp2_out3));

wire [48:0] comp3_out1,comp3_out2;
fulladder_46bit uut0(.x1_i(partialproducts46bit[10]),.x2_i(partialproducts46bit[11]),.x3_i({partialproducts46bit[12]}),.out_o(comp3_out1),.cary_o(comp3_out2));


//Second Adders
wire [48:0] comp2_1_out1,comp2_1_out2,comp2_1_out3;
comparasor_46bit  second1(.x1(pipeline1[0]),.x2(pipeline1[1]),.x3(pipeline1[2]),.x4(pipeline1[3]),.x5(pipeline1[4]),.out1(comp2_1_out1),.out2(comp2_1_out2),.out3(comp2_1_out3));

wire [48:0] comp2_2_out1,comp2_2_out2;
fulladder_46bit uut1(.x1_i(pipeline1[5]),.x2_i(pipeline1[6]),.x3_i(pipeline1[7]),.out_o(comp2_2_out1),.cary_o(comp2_2_out2));


//Third Adders
wire [48:0] comp3_1_out1,comp3_1_out2,comp3_1_out3;
comparasor_46bit  third(.x1(pipeline2[0]),.x2(pipeline2[1]),.x3(pipeline2[2]),.x4(pipeline2[3]),.x5(pipeline2[4]),.out1(comp3_1_out1),.out2(comp3_1_out2),.out3(comp3_1_out3));

wire [48:0] comp3_2_out1,comp3_2_out2;
fulladder_46bit uut2(.x1_i(comp3_1_out1),.x2_i(comp3_1_out2),.x3_i(comp3_1_out3),.out_o(comp3_2_out1),.cary_o(comp3_2_out2));


//Fourth Adders

wire [48:0] comp4_1_out1,comp4_1_out2;
fulladder_46bit uut3(.x1_i(pipeline3[0]),.x2_i(pipeline3[1]),.x3_i({24'b0,cary4}),.out_o(comp4_1_out1),.cary_o(comp4_1_out2));

wire [48:0] resul48bit= comp4_1_out1+comp4_1_out2;
assign result_o=comp4_1_out1+comp4_1_out2;

reg start1,start2,start3,start4;  
reg [25:0] cary1,cary2,cary3,cary4;
integer i;
	generate
		always @(posedge clk_i)begin
			if(rst_i)begin
				for(i=0; i<13; i=i+1)begin
				PartialProducts1[i]<=0;
				end
			end
			else begin
				for(i=0; i<13; i=i+1)begin
					PartialProducts1[i]<=PartialProducts[i];
				end
			end
		end
	endgenerate


always @(posedge clk_i)begin
    if(rst_i)begin     
        pipeline1[0]<=0 ;
        pipeline1[1]<=0 ;
        pipeline1[2]<=0 ;
        pipeline1[3]<=0 ;
        pipeline1[4]<=0 ;
        pipeline1[5]<=0 ;             
        pipeline1[6]<=0 ;
        pipeline1[7]<=0 ;      
        pipeline2[0]<=0 ;
        pipeline2[1]<=0 ;
        pipeline2[2]<=0 ;
        pipeline2[3]<=0 ;
        pipeline2[4]<=0 ;    
        pipeline3[0]<=0 ;
        pipeline3[1]<=0 ;
        sign1<=0;
        cary1<=0;cary2<=0;cary3<=0;cary4<=0;
      	start1<=0;start2<=0;start3<=0;start4<=0;
      	rs1_ir<=0;rs2_ir<=0;
    end
    else begin
      	if(start)begin
        	rs1_ir <= rs1_i;
          	rs2_ir <= {2'b01,rs2_i};
          	start1 <= 1;
      	end
      	else begin
        	start1<=0;  
        end
//     	start1<= start;
		start2<= start1;
        start3<= start2;
      	start4<= start3;
      	valid<= start4;

        sign1<=sign;
        
        cary1<=cary;
        pipeline1[0]<= comp1_out1;
        pipeline1[1]<= comp1_out2;
        pipeline1[2]<= comp1_out3;
        
        pipeline1[3]<= comp2_out1;
        pipeline1[4]<= comp2_out2;
        pipeline1[5]<= comp2_out3;
        
        pipeline1[6]<= comp3_out1;
        pipeline1[7]<= comp3_out2;
        cary2<=cary1;
        
        pipeline2[0]<=comp2_1_out1;
        pipeline2[1]<=comp2_1_out2;
        pipeline2[2]<=comp2_1_out3;
        pipeline2[3]<=comp2_2_out1;
        pipeline2[4]<=comp2_2_out2;
        cary3<=cary2;
        
        pipeline3[0]<=comp3_2_out1;
        pipeline3[1]<=comp3_2_out2;
        cary4<=cary3;
        
        
    end
end 
endmodule