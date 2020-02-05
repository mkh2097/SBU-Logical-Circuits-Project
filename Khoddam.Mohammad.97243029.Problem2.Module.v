module full_adder(
	output sum, cout,
	input in1, in2, cin
);
	wire w1,w2,w3;

	xor(w1,in1,in2);
	and(w2,w1,cin);
	and(w3,in1,in2);
	xor(sum,w1,cin);
	or(cout,w2,w3);
endmodule

module eight_bit_sign_adder(
	output[7:0] S,
	output v,
	output lastcout,
	input firstcin,
	input[7:0] A,
	input[7:0] B
);
	genvar count;
	wire c1,c2,c3,c4,c5,c6,c7;
	wire Bp[7:0];
	for (count  = 0; count < 8 ; count = count +1) begin
		xor(Bp[count],B[count],firstcin);
	end

	full_adder full_adder0(S[0],c1,A[0],Bp[0],firstcin);
	full_adder full_adder1(S[1],c2,A[1],Bp[1],c1);
	full_adder full_adder2(S[2],c3,A[2],Bp[2],c2);
	full_adder full_adder3(S[3],c4,A[3],Bp[3],c3);
	full_adder full_adder4(S[4],c5,A[4],Bp[4],c4);	
	full_adder full_adder5(S[5],c6,A[5],Bp[5],c5);
	full_adder full_adder6(S[6],c7,A[6],Bp[6],c6);
	full_adder full_adder7(S[7],lastcout,A[7],Bp[7],c7);

	xor(v,c7,lastcout);
 
	
endmodule