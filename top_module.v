`timescale 1ns/1ps
module simd( clk, rst ,enable);//adddata_out_1, adddata_out_2,  adddata_out_3, adddata_out_4 
input clk;
input rst;
input enable;

//output [15:0] adddata_out_1;
//output [15:0] adddata_out_2;
//output [15:0] adddata_out_3;
//output [15:0] adddata_out_4;

wire rs1_rd_en_wire;
wire rs2_rd_en_wire;
wire rd_wr_en_wire;
wire Radd_en_wire;
wire Rsub_en_wire;
wire bitrev_wire;
wire mul_en_wire;

wire[4:0] rs1_wire;
wire[4:0] rs2_wire;
wire[4:0] rd_wire;

wire[15:0] adddata_out1_wire , result_out1;
wire[15:0] adddata_out2_wire , result_out2;
wire[15:0] adddata_out3_wire , result_out3;
wire[15:0] adddata_out4_wire , result_out4;

control_unit controller( .clk(clk),
			 . rst(rst),
			 .enable(enable),
			 .rs1_rd_en(rs1_rd_en_wire),
			.rs2_rd_en(rs2_rd_en_wire),
			. rd_wr_en(rd_wr_en_wire),
			. add_en(Radd_en_wire),
			. bitrev_en(bitrev_wire),
			. mul_en(mul_en_wire),
			//. sra_en(),
			//. srl_en(),
			. sub_en(Rsub_en_wire),
			//. swap_en(),
			. rs1(rs1_wire),
			. rs2(rs2_wire),
			.rd(rd_wire));

processor_1 processor1( .rs1(rs1_wire),
			//.rst(rst),
			. Radd_en(Radd_en_wire),
			.Rsub_en(Rsub_en_wire),
			.bitrev_en(bitrev_wire),
			.mul_en(mul_en_wire),
			. rs2(rs2_wire),
			.rd(rd_wire),
			. wr_data(result_out1),
			. clk(clk),
			.rd_wr_en(rd_wr_en_wire),
			. rs1_rd_en(rs1_rd_en_wire),
			. rs2_rd_en(rs2_rd_en_wire),
			.aluresult_out_1(adddata_out1_wire));


processor_2 processor2( .rs1(rs1_wire),
			//.rst(rst),
			. Radd_en(Radd_en_wire),
			.Rsub_en(Rsub_en_wire),
			.bitrev_en(bitrev_wire),
			.mul_en(mul_en_wire),
			. rs2(rs2_wire),
			.rd(rd_wire),
			. wr_data(result_out2),
			. clk(clk),
			.rd_wr_en(rd_wr_en_wire),
			. rs1_rd_en(rs1_rd_en_wire),
			. rs2_rd_en(rs2_rd_en_wire),
			.aluresult_out_2(adddata_out2_wire));


processor_3 processor3( .rs1(rs1_wire),
			//.rst(rst),
			. Radd_en(Radd_en_wire),
			.Rsub_en(Rsub_en_wire),
			.bitrev_en(bitrev_wire),
			.mul_en(mul_en_wire),
			. rs2(rs2_wire),
			.rd(rd_wire),
			. wr_data(result_out3),
			. clk(clk),
			.rd_wr_en(rd_wr_en_wire),
			. rs1_rd_en(rs1_rd_en_wire),
			. rs2_rd_en(rs2_rd_en_wire),
			.aluresult_out_3(adddata_out3_wire));



processor_4 processor4( .rs1(rs1_wire),
			//.rst(rst),
			. Radd_en(Radd_en_wire),
			.Rsub_en(Rsub_en_wire),
			.bitrev_en(bitrev_wire),
			.mul_en(mul_en_wire),
			. rs2(rs2_wire),
			.rd(rd_wire),
			. wr_data(result_out4),
			. clk(clk),
			.rd_wr_en(rd_wr_en_wire),
			. rs1_rd_en(rs1_rd_en_wire),
			. rs2_rd_en(rs2_rd_en_wire),
			.aluresult_out_4(adddata_out4_wire));




memory data_memory1(    .select_line(enable), 
		 	.a(adddata_out1_wire),
			. wd(),
			.clk(clk),
			.rst(rst),
			.we(enable),
			.result(result_out1));

memory data_memory2(    .select_line(enable), 
		 	.a(adddata_out2_wire),
			. wd(),
			.clk(clk),
			.rst(rst),
			.we(enable),
			.result(result_out2));

memory data_memory3(    .select_line(enable), 
		 	.a(adddata_out3_wire),
			. wd(),
			.clk(clk),
			.rst(rst),
			.we(enable),
			.result(result_out3));

memory data_memory4 (    .select_line(enable), 
		 	.a(adddata_out4_wire),
			. wd(),
			.clk(clk),
			.rst(rst),
			.we(enable),
			.result(result_out4));


//assign adddata_out_1 = result_out1;
//assign adddata_out_2 = result_out2;
//assign adddata_out_3 = result_out3;
//assign adddata_out_4 = result_out4;




endmodule

			
