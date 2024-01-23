module fastadder(sum,c_out,a,b,c_in);
	output sum,c_out;
 	input a,b,c_in;
	wire [4:0]w;
	supply1 vdd;
	supply0 gnd;
   
	pmos m1(w[0],vdd,a), m2(w[4],w[0],b), m3(w[1],vdd,c_in), m4(sum,w[1],w[4]), m5(c_out,c_in,w[4]);
	nmos m6(w[4],b,a), m7(w[4],a,b), m8(sum,w[4],c_in), m9(sum,c_in,w[4]), m10(c_out,a,w[4]);
endmodule

module rca(sum,c_out,a,b,c_in);
	output [3:0]sum;
	output c_out;
 	input [3:0]a,b;
	input c_in;
	wire  [2:0]c;

    fastadder f1(sum[0],c[0],a[0],b[0],c_in);
    fastadder f2(sum[1],c[1],a[1],b[1],c[0]);
    fastadder f3(sum[2],c[2],a[2],b[2],c[1]);
    fastadder f4(sum[3],c_out,a[3],b[3],c[2]);
endmodule

module bit2_vedic(p,a,b);
	output [3:0]p;
	input [1:0]a,b;
	wire [3:0]c;
	
	and g1(p[0],a[0],b[0]);
	and g2(c[0],a[1],b[0]);
	and g3(c[1],a[0],b[1]);
	and g4(c[2],a[1],b[1]);

	fastadder h1(p[1],c[3],c[0],c[1],0);
	fastadder h2(p[2],p[3],c[3],c[2],0);
endmodule

module bit4_vedic(s,ca,a,b);
	output [7:0]s;
    output [2:0]ca;
	input [3:0]a,b;
    wire [32:0]w;
	
	
	bit2_vedic v1(w[3:0],a[1:0],b[1:0]);
	bit2_vedic v2(w[7:4],a[1:0],b[3:2]);
	bit2_vedic v3(w[11:8],a[3:2],b[1:0]);
	bit2_vedic v4(w[15:12],a[3:2],b[3:2]);

    rca r1(w[19:16],ca[0],w[7:4],w[11:8],1'b0);
    rca r2(w[23:20],ca[1],{w[3],w[2],1'b0,1'b0},w[19:16],1'b0);
    rca r3(s[7:4],ca[2],{w[22],w[23],1'b0,ca[0]},w[15:12],1'b0);

    assign s[3:0]={w[0],w[1],w[22],w[23]};
endmodule