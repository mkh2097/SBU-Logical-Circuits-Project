module behavioral_full_adder(
	output sum , cout,
	input in1 , in2 , cin

);
	wire[1:0] calc;


	assign calc =  in1 +  in2 + cin;

	
	assign {cout , sum} = calc;
	//assign cout = calc[1];
endmodule

module carry_look_ahead_logic_4bit(
	output[4:1] C,
	output[3:0] P,
	output[3:0] G,
	input C0,
	input[3:0] A,
	input[3:0] B
);
	wire[3:0] S;
	wire[3:0] temp;

	behavioral_full_adder bfa0(S[0],temp[0],A[0],B[0],C0);
	behavioral_full_adder bfa1(S[1],temp[1],A[1],B[1],C[1]);
	behavioral_full_adder bfa2(S[2],temp[2],A[2],B[2],C[2]);
	behavioral_full_adder bfa3(S[3],temp[3],A[3],B[3],C[3]);
	//Gi=Ai.Bi
	assign G[0] = A[0] & B[0];
	assign G[1] = A[1] & B[1];
	assign G[2] = A[2] & B[2];
	assign G[3] = A[3] & B[3];
	//Pi=Ai+Bi or Pi=(Ai xor Bi) or version is faster 
	assign P[0] = A[0] | B[0];
	assign P[1] = A[1] | B[1];
	assign P[2] = A[2] | B[2];
	assign P[3] = A[3] | B[3];
	//Ci+1=Gi+Pi.Ci
	assign C[1] = G[0] | ( P[0] & C0 );
	assign C[2] = G[1] | ( P[1] & C[1] );
	assign C[3] = G[2] | ( P[2] & C[2] );
	assign C[4] = G[3] | ( P[3] & C[3] );	
endmodule



module carry_lookahead_32bit(
	output c8,
	output[31:0] sum,
	input[31:0] in_1,
	input[31:0] in_2,
	//32/4 = 8
	input c0

);
	wire[7:1] c;
	wire[7:0] p,g;
	/*
	carry_look_ahead_logic_4bit alu0(sum[3:0],p[0],g[0],c0,in_1[3:0],in_2[3:0]);
	assign c[1] = g[0]|(p[0]&c0);
	carry_look_ahead_logic_4bit alu1(sum[7:4],p[1],g[1],c[1],in_1[7:4],in_2[7:4]);	
	assign c[2] = g[1]|(g[0]&p[1])|(p[0]&p[1]&c0);
	carry_look_ahead_logic_4bit alu2(sum[11:8],p[2],g[2],c[2],in_1[11:8],in_2[11:8]);
	assign c[3] = g[2]|(g[1]&p[2])|(g[0]&p[1]&p[2])|(p[0]&p[1]&p[2]&c0);
	carry_look_ahead_logic_4bit alu3(sum[15:12],p[3],g[3],c[3],in_1[15:12],in_2[15:12]);	
	assign c[4] = g[3]|(g[2]&p[3])|(g[1]&p[2]&p[3])|(g[0]&p[1]&p[2]&p[3])|(p[0]&p[1]&p[2]&p[3]&c0);
	carry_look_ahead_logic_4bit alu4(sum[19:16],p[4],g[4],c[4],in_1[19:16],in_2[19:16]);	
	assign c[5] = g[4]|(g[3]&p[4])|(g[2]&p[3]&p[4])|(g[1]&p[2]&p[3]&p[4])|(g[0]&p[1]&p[2]&p[3]&p[4])|(p[0]&p[1]&p[2]&p[3]&p[4]&c0);
	carry_look_ahead_logic_4bit alu5(sum[23:20],p[5],g[5],c[5],in_1[23:20],in_2[23:20]);	
	assign c[6] = g[5]|(g[4]&p[5])|(g[3]&p[4]&p[5])|(g[2]&p[3]&p[4]&p[5])|(g[1]&p[2]&p[3]&p[4]&p[5])|(g[0]&p[1]&p[2]&p[3]&p[4]&p[5])|(p[0]&p[1]&p[2]&p[3]&p[4]&p[5]&c0);
	carry_look_ahead_logic_4bit alu6(sum[27:24],p[6],g[6],c[6],in_1[27:24],in_2[27:24]);
	assign c[7] = g[6]|(g[5]&p[6])|(g[4]&p[5]&p[6])|(g[3]&p[4]&p[5]&p[6])|(g[2]&p[3]&p[4]&p[5]&p[6])|(g[1]&p[2]&p[3]&p[4]&p[5]&p[6])|(g[0]&p[1]&p[2]&p[3]&p[4]&p[5]&p[6])|(p[0]&p[1]&p[2]&p[3]&p[4]&p[5]&p[6]&c0);
	carry_look_ahead_logic_4bit alu7(sum[31:28],p[7],g[7],c[7],in_1[31:28],in_2[31:28]);		
	assign c8 = g[7]|(g[6]&p[7])|(g[5]&p[6]&p[7])|(g[4]&p[5]&p[6]&p[7])|(g[3]&p[4]&p[5]&p[6]&p[7])|(g[2]&p[3]&p[4]&p[5]&p[6]&p[7])|(g[1]&p[2]&p[3]&p[4]&p[5]&p[6]&p[7])|(g[0]&p[1]&p[2]&p[3]&p[4]&p[5]&p[6]&p[7])|(p[0]&p[1]&p[2]&p[3]&p[4]&p[5]&p[6]&p[7]&c0);
*/

endmodule

module carry_look_ahead(
	output[31:0] S,
	output C32,

	input C0,
	input[31:0] A,
	input[31:0] B
);
	wire[31:0] P;
	wire[31:0] G;
	wire[32:1] C;
	wire[31:0] temp;

	
	
	genvar counter;

	for (counter = 0;counter < 32 ; counter = counter +1) begin
		//Gi=Ai.Bi
		assign G[counter] = A[counter] & B[counter];
		//Pi=Ai+Bi
		assign P[counter] = A[counter] | B[counter];
	end
	//Ci+1=Gi+Pi.Ci
	assign C[1] = G[0] | ( P[0] & C0 );
	for (counter = 1;counter < 32;counter = counter +1) begin
		assign C[counter+1] = G[counter] | ( P[counter] & C[counter] );
	end

	behavioral_full_adder bfa0(S[0],temp[0],A[0],B[0],C0);
	behavioral_full_adder bfa1(S[1],temp[1],A[1],B[1],C[1]);
	behavioral_full_adder bfa2(S[2],temp[2],A[2],B[2],C[2]);
	behavioral_full_adder bfa3(S[3],temp[3],A[3],B[3],C[3]);
	behavioral_full_adder bfa4(S[4],temp[4],A[4],B[4],C[4]);
	behavioral_full_adder bfa5(S[5],temp[5],A[5],B[5],C[5]);
	behavioral_full_adder bfa6(S[6],temp[6],A[6],B[6],C[6]);
	behavioral_full_adder bfa7(S[7],temp[7],A[7],B[7],C[7]);
	behavioral_full_adder bfa8(S[8],temp[8],A[8],B[8],C[8]);
	behavioral_full_adder bfa9(S[9],temp[9],A[9],B[9],C[9]);
	behavioral_full_adder bfa10(S[10],temp[10],A[10],B[10],C[10]);
	behavioral_full_adder bfa11(S[11],temp[11],A[11],B[11],C[11]);
	behavioral_full_adder bfa12(S[12],temp[12],A[12],B[12],C[12]);
	behavioral_full_adder bfa13(S[13],temp[13],A[13],B[13],C[13]);
	behavioral_full_adder bfa14(S[14],temp[14],A[14],B[14],C[14]);
	behavioral_full_adder bfa15(S[15],temp[15],A[15],B[15],C[15]);
	behavioral_full_adder bfa16(S[16],temp[16],A[16],B[16],C[16]);
	behavioral_full_adder bfa17(S[17],temp[17],A[17],B[17],C[17]);
	behavioral_full_adder bfa18(S[18],temp[18],A[18],B[18],C[18]);
	behavioral_full_adder bfa19(S[19],temp[19],A[19],B[19],C[19]);
	behavioral_full_adder bfa20(S[20],temp[20],A[20],B[20],C[20]);
	behavioral_full_adder bfa21(S[21],temp[21],A[21],B[21],C[21]);
	behavioral_full_adder bfa22(S[22],temp[22],A[22],B[22],C[22]);
	behavioral_full_adder bfa23(S[23],temp[23],A[23],B[23],C[23]);
	behavioral_full_adder bfa24(S[24],temp[24],A[24],B[24],C[24]);
	behavioral_full_adder bfa25(S[25],temp[25],A[25],B[25],C[25]);
	behavioral_full_adder bfa26(S[26],temp[26],A[26],B[26],C[26]);
	behavioral_full_adder bfa27(S[27],temp[27],A[27],B[27],C[27]);
	behavioral_full_adder bfa28(S[28],temp[28],A[28],B[28],C[28]);
	behavioral_full_adder bfa29(S[29],temp[29],A[29],B[29],C[29]);
	behavioral_full_adder bfa30(S[30],temp[30],A[30],B[30],C[30]);
	behavioral_full_adder bfa31(S[31],temp[31],A[31],B[31],C[31]);
	
	assign C32 = C[32];

endmodule