`timescale 1ns/1ps

module processor_4(rs1, wr_data,Radd_en,Rsub_en,bitrev_en,mul_en,rs2,rd, clk ,rd_wr_en, rs1_rd_en, rs2_rd_en,aluresult_out_4);

input [4:0] rs1;   // address of  rs1
input [4:0] rs2;   // address of rs2
input [4:0] rd;
input [15:0] wr_data;    //  address of rd  // data to write 
input clk;
input  rd_wr_en, rs1_rd_en, rs2_rd_en;
output  [15:0] aluresult_out_4;
input Radd_en, Rsub_en,bitrev_en,mul_en;

wire [15:0] rs1_data_wire;
wire [15:0] rs2_data_wire;

register_file_4  register_file_4(.rs1(rs1),
				. rs2(rs2),
				.rd(rd),
				. wr_data(wr_data),
				. clk(clk) ,
				.rd_wr_en(rd_wr_en),
				. rs1_rd_en(rs1_rd_en),
				. rs2_rd_en(rs2_rd_en),
				.rs1_data(rs1_data_wire),
				.rs2_data(rs2_data_wire));

alu_add   alu_add4(	//.clk(clk),
			//.rst(rst),
			.rs1_data(rs1_data_wire) ,
			. rs2_data(rs2_data_wire),
			. aluresult_out(aluresult_out_4), 
			.Radd_en(Radd_en),
			.Rsub_en(Rsub_en),
			.bitrev_en(bitrev_en),
			.mul_en(mul_en));
 
endmodule
