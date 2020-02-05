module inverter(
	output na,
	input a
);
	supply1 vdd;
	supply0 gnd;

	pmos(na,vdd,a);
	nmos(na,gnd,a);
endmodule


module fto(
	output out,
	input A,B,C,D
);


/*not(nA ,A);
not(nB ,B);
not(nC ,C);
not(nD ,D);*/

wire nA,nB,nC,nD;
inverter inv0(nA,A);
inverter inv1(nB,B);
inverter inv2(nC,C);
inverter inv3(nD,D);

supply1 vdd;
supply0 gnd;



wire[8:0] temp;

pmos(temp[0],vdd,nA);
pmos(out,temp[0],nD);


pmos(temp[1],vdd,nA);
pmos(temp[2],temp[1],B);
pmos(out,temp[2],nC);

pmos(temp[3],vdd,nB);
pmos(out,temp[3],D);

pmos(temp[4],vdd,A);
pmos(temp[5],temp[4],C);
pmos(out,temp[5],D);


nmos(temp[6],gnd,nA);
nmos(temp[6],gnd,nD);

nmos(temp[7],temp[6],nA);
nmos(temp[7],temp[6],B);
nmos(temp[7],temp[6],nC);

nmos(temp[8],temp[7],nB);
nmos(temp[8],temp[7],D);

nmos(out,temp[8],A);
nmos(out,temp[8],C);
nmos(out,temp[8],D);

endmodule
