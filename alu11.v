`timescale 1ns/1ps
module alu_add( Radd_en, Rsub_en, bitrev_en,mul_en, rs1_data , rs2_data, aluresult_out);

//input clk, rst;
input Radd_en,Rsub_en,bitrev_en,mul_en;
input [15:0] rs1_data;
input [15:0] rs2_data;
output reg [15:0] aluresult_out;

always@(*)
begin
	case({Radd_en , Rsub_en, bitrev_en,mul_en})
	 4'b1000 : aluresult_out = rs1_data + rs2_data;
	 4'b0100 : aluresult_out = rs1_data - rs2_data;
	 4'b0010 : aluresult_out = { rs1_data[0], rs1_data[1],rs1_data[2], rs1_data[3],rs1_data[4],rs1_data[5],
				  rs1_data[6],rs1_data[7],rs1_data[8],rs1_data[9],rs1_data[10],rs1_data[11],
				 rs1_data[12],rs1_data[13],rs1_data[14]};
	 4'b0001 : aluresult_out = rs1_data * rs2_data;
	default : aluresult_out = 0;
	endcase
end 
endmodule
