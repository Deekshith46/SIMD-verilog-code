`timescale 1ns/1ps
module testbench;

reg clk;
reg rst;
reg enable;

/*wire [15:0]  adddata_out_1;
wire [15:0]  adddata_out_2;
wire [15:0]  adddata_out_3;
wire [15:0]  adddata_out_4;
*/




simd simd1( .clk(clk),
	     .rst(rst),
	     .enable(enable)
	    // . adddata_out_1(adddata_out_1)
	/*.adddata_out_2(adddata_out_2),
	.adddata_out_3(adddata_out_3),
	.adddata_out_4(adddata_out_4)*/);


initial begin
$shm_open("wave.shm");
$shm_probe("ACTMF");
end


always begin
clk=0;
forever #5 clk=~clk;
end

initial begin

#20 clk=0;
    rst=1;
	enable=0;

#20

 clk=1;
 rst=0;
 enable=1;

#100 $finish;
end
endmodule


