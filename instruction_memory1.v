`timescale 1ns/1ps

module instruction_memory1( address,rd,read_en);//,clk);// write_data, clk, write_en, read_en , rd);
input [31:0] address;
//input [31:0] write_data;
//input clk; //write_en, read_en;
input read_en;
output [31:0] rd;

reg [31:0] instruction_mem [31:0];

initial begin

instruction_mem[1] = 32'b0100000_00100_00111_000_01001_1110111;
instruction_mem[2] = 32'b0100001_00100_00111_000_01000_1110111;
instruction_mem[3] = 32'b1110011_00100_00111_000_00001_1110111;
instruction_mem[4] = 32'b1010000_00100_00111_000_00010_1110111;

end

/*always@(posedge clk) begin
	if(write_en)
	 begin
	 instruction_mem[address] <= write_data;
	 end
end*/
assign  rd = (read_en) ? instruction_mem[address] : 32'h00000000;

endmodule
