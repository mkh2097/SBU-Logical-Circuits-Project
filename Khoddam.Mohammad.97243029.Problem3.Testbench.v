`include "Khoddam.Mohammad.97243029.Problem3.Module.v"
`timescale 1ns/100ps

module test_3();
reg[5:0] A;
reg[5:0] B;
reg[1:0] Select;
wire[5:0] O;

mdd mdd1(O,A,B,Select);

initial
	begin
	$dumpfile("Khoddam.Mohammad.97243029.Problem3.Module.vcd");
	$dumpvars(0,"Khoddam.Mohammad.97243029.Problem3.Testbench");
	
	assign A = 15;
	assign B = 24;
	assign Select = 0;
	#20;

	assign A = 4;
	assign B = 2;
	assign Select = 0;
	#20;

	assign A = 3;
	assign B = 5;
	assign Select = 1;
	#20;

	assign A = 15;
	assign B = 8;
	assign Select = 1;
	#20;

	assign A = 15;
	assign B = 31;
	assign Select = 2;
	#20;

	assign A = 18;
	assign B = -11;
	assign Select = 2;
	#20;

	assign A = 3;
	assign B = 8;
	assign Select = 3;
	#20;

	assign A = 7;
	assign B = 2;
	assign Select = 3;
	#20;

	

	
	
	$finish;
end
endmodule