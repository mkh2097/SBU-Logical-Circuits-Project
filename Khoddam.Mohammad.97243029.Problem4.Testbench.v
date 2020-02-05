`include "Khoddam.Mohammad.97243029.Problem4.Module.v"
`timescale 1ns/100ps

module test_4();


wire[31:0] sum;
wire c_out;

reg[31:0] in_1;
reg[31:0] in_2;
reg c_in;

carry_look_ahead cla0(sum,c_out,c_in,in_1,in_2);


initial
	begin
	$dumpfile("Khoddam.Mohammad.97243029.Problem4.Module.vcd");
	$dumpvars(0,"Khoddam.Mohammad.97243029.Problem4.Testbench");
	assign c_in = 0;
        assign in_1=546546;
        assign in_2=123564;
        #15;
        assign in_1=-345957;
        assign in_2=213568;
        #15;
        assign in_1=-654668;
        assign in_2=889401;
        #15;
        assign in_1=-23132198;
        assign in_2=-46565454;
        #15;
	
	assign c_in = 1;
        assign in_1=686868;
        assign in_2=796521;
        #15;
        assign in_1=-456445123;
        assign in_2=6498423;
        #15;
	assign in_1=546551;
        assign in_2=-1987658;
        #15;
	assign in_1=-9987232;
        assign in_2=-9812312;
        #15;
	
	$finish;
end
endmodule