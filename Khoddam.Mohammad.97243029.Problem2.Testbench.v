`include "Khoddam.Mohammad.97243029.Problem2.Module.v"
`timescale 1ns/100ps

module test_2();
reg firstcin;
reg [7:0] A;
reg [7:0] B;
wire [7:0] S;
wire lastcout,v;

eight_bit_sign_adder ebsa1(S,v,lastcout,firstcin,A,B);

initial
	begin
		$dumpfile("Khoddam.Mohammad.97243029.Problem2.Module.vcd");
		$dumpvars(0,"Khoddam.Mohammad.97243029.Problem2.Testbench");
		
		//Two Positive Number Without OverFlow
		assign firstcin = 0;
		assign A = 15;
		assign B = 26;
		#15;

		//Two Positive Number With OverFlow
		assign firstcin = 0;
		assign A = 99;
		assign B = 45;
		#15;
		
		//Two Negative Number Without OverFlow
		assign firstcin = 0;
		assign A = -45;
		assign B = -83;
		#15;
		
		//Two Negative Number With OverFlow
		assign firstcin = 0;
		assign A = -121;
		assign B = -8;
		#15;


		assign firstcin = 0;
		assign A = 127;
		assign B = 127;
		#15;

		assign firstcin = 0;
		assign A = -64;
		assign B = -64;
		#15;

		assign firstcin = 0;
		assign A = -128;
		assign B = -128;
		#15;

		assign firstcin = 1;
		assign A = -127;
		assign B = 127;
		#15;

		assign firstcin = 0;
		assign A = 15;
		assign B = -15;
		#15;

		assign firstcin = 1;
		assign A = 34;
		assign B = -45;
		#15;


		$finish;
	end
endmodule


		
/*module negativenumbers;
  reg [4:0] x;
  reg  signed [4:0] y;
 
  initial begin
 
    x = 5;   
    $display("x = %5b", x );
 
    y = -x;  
    $display("y = %d", y );
 
    $finish;
  end
endmodule*/
