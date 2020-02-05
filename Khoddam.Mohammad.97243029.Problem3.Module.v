module md0(
output[5:0] O,
input[5:0] A,
input[5:0] B
);

assign O = ( A <<< 2'b10 ) + (B >>> 1'b1);
endmodule

module md1(
output[5:0] O,
input[5:0] A,
input[5:0] B
);

assign O = ( A + 3 * B );
endmodule

module md2(
output[5:0] O,
input[5:0] A,
input[5:0] B
);

assign O = (-B);
endmodule

module md3(
output[5:0] O,
input[5:0] A,
input[5:0] B
);
wire[5:0] temp;
wire sign;
assign temp = (2 * A - B);
not(sign,temp[5]);
assign O = sign ? temp : -temp;

endmodule

module mdd(
output[5:0] O,
input[5:0] A,
input[5:0] B,
input[1:0] Select
);

wire[5:0] ot3,ot2,ot1,ot0;


md3 mmmd(ot3,A,B);
md2 mmd(ot2,A,B);
md1 md(ot1,A,B);
md0 d(ot0,A,B);

assign O = (Select[1] ? (Select[0]?ot3:ot2):(Select[0]?ot1:ot0));




endmodule