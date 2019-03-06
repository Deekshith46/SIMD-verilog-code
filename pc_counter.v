`timescale 1ns/1ps

module program_cntr
(
input clk,
input rst,
input enable,
output  [31:0] instr_read_addr,
output read_valid
);

reg [9:0] prg_cntr;

reg rd_valid;

always@(posedge clk )
begin
if(rst)
begin
	prg_cntr <= 'd0;
end
else
begin
	if(enable)
		begin
			prg_cntr <= prg_cntr + 'd4;
			rd_valid <= 1'b1;
		end

end
end

assign instr_read_addr = prg_cntr >> 2;
assign read_valid = rd_valid;

endmodule
