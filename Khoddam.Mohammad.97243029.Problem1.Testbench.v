`include "Khoddam.Mohammad.97243029.Problem1.Module.v"
`timescale 1ns/100ps

module test_1();
reg A,B,C,D;
wire out;

fto fto1(out,A,B,C,D);

initial
	begin
	$dumpfile("Khoddam.Mohammad.97243029.Problem1.Module.vcd");
	$dumpvars(0,"Khoddam.Mohammad.97243029.Problem1.Testbench");
	

	A=0;
	B=0;
	C=0;
	D=0;
	#15;

	A=0;
	B=0;
	C=0;
	D=1;
	#15;

	A=0;
	B=0;
	C=1;
	D=0;
	#15;

	A=0;
	B=0;
	C=1;
	D=1;
	#15;

	A=0;
	B=1;
	C=0;
	D=0;
	#15;

	A=0;
	B=1;
	C=0;
	D=1;
	#15;

	A=0;
	B=1;
	C=1;
	D=0;
	#15;

	A=0;
	B=1;
	C=1;
	D=1;
	#15;

	A=1;
	B=0;
	C=0;
	D=0;
	#15;

	A=1;
	B=0;
	C=0;
	D=1;
	#15;

	A=1;
	B=0;
	C=1;
	D=0;
	#15;

	A=1;
	B=0;
	C=1;
	D=1;
	#15;

	A=1;
	B=1;
	C=0;
	D=0;
	#15;

	A=1;
	B=1;
	C=0;
	D=1;
	#15;

	A=1;
	B=1;
	C=1;
	D=0;
	#15;

	A=1;
	B=1;
	C=1;
	D=1;
	#15;



	$finish;
end
endmodule
