// Verilog netlist created by S-Edit 2019.2.0
// Written on Mon Sep 18 11:58:28 2023

// Library:               workfiles
// Cell:                  4_vedic
// View name:             schematic
// Design path:           C:\Users\srira\OneDrive\Documents\TannerEDA\workfiles\workfiles
// Control property name(s): VERILOG
// Exclude global pins on subcircuits: <no>



module pmos25(
	D,
	G,
	S
);
inout D;
input G;
inout S;
parameter l=2.5e-07;
parameter m=1;
parameter fw=1.5e-06;
parameter fingers=1;
parameter BulkNode="Vdd";
endmodule // pmos25


module nmos25(
	D,
	G,
	S
);
inout D;
input G;
inout S;
parameter l=2.5e-07;
parameter m=1;
parameter fw=1.5e-06;
parameter fingers=1;
parameter BulkNode="Gnd";
endmodule // nmos25


module cmos_inverter(
	Gnd,
	In,
	Out,
	Vdd
);
inout Gnd;
input In;
output Out;
inout Vdd;

nmos25 Mn1(
	.D(Out),
	.G(In),
	.S(Gnd)
);
pmos25 Mp1(
	.D(Out),
	.G(In),
	.S(Vdd)
);
endmodule // cmos_inverter


module sum(
	A,
	B,
	Gnd,
	Vdd,
	sum
);
input A;
input B;
inout Gnd;
inout Vdd;
output sum;

wire N_1;
wire N_2;
wire N_3;
wire N_4;
wire N_5;
wire N_6;
wire N_7;
wire N_8;

nmos25 Mn1(
	.D(N_4),
	.G(A),
	.S(N_1)
);
nmos25 Mn2(
	.D(N_1),
	.G(N_6),
	.S(Gnd)
);
nmos25 Mn3(
	.D(N_4),
	.G(N_7),
	.S(N_2)
);
nmos25 Mn4(
	.D(N_2),
	.G(B),
	.S(Gnd)
);
pmos25 Mp1(
	.D(N_3),
	.G(A),
	.S(Vdd)
);
pmos25 Mp2(
	.D(N_3),
	.G(N_8),
	.S(Vdd)
);
pmos25 Mp3(
	.D(N_4),
	.G(B),
	.S(N_3)
);
pmos25 Mp4(
	.D(N_4),
	.G(N_5),
	.S(N_3)
);
cmos_inverter cmos_inverter_1(
	.Gnd(Gnd),
	.In(A),
	.Out(N_5),
	.Vdd(Vdd)
);
cmos_inverter cmos_inverter_2(
	.Gnd(Gnd),
	.In(B),
	.Out(N_6),
	.Vdd(Vdd)
);
cmos_inverter cmos_inverter_3(
	.Gnd(Gnd),
	.In(A),
	.Out(N_7),
	.Vdd(Vdd)
);
cmos_inverter cmos_inverter_4(
	.Gnd(Gnd),
	.In(N_4),
	.Out(sum),
	.Vdd(Vdd)
);
cmos_inverter cmos_inverter_5(
	.Gnd(Gnd),
	.In(B),
	.Out(N_8),
	.Vdd(Vdd)
);
endmodule // sum


module cmos_nand(
	A,
	B,
	Gnd,
	Out,
	Vdd
);
input A;
input B;
inout Gnd;
output Out;
inout Vdd;

wire N_1;

nmos25 Mn1(
	.D(Out),
	.G(A),
	.S(N_1)
);
nmos25 Mn2(
	.D(N_1),
	.G(B),
	.S(Gnd)
);
pmos25 Mp1(
	.D(Out),
	.G(A),
	.S(Vdd)
);
pmos25 Mp2(
	.D(Out),
	.G(B),
	.S(Vdd)
);
endmodule // cmos_nand


module carry(
	A,
	B,
	Gnd,
	Vdd,
	carry
);
input A;
input B;
inout Gnd;
inout Vdd;
output carry;

wire N_1;

cmos_inverter cmos_inverter_1(
	.Gnd(Gnd),
	.In(N_1),
	.Out(carry),
	.Vdd(Vdd)
);
cmos_nand cmos_nand_1(
	.A(A),
	.B(B),
	.Gnd(Gnd),
	.Out(N_1),
	.Vdd(Vdd)
);
endmodule // carry


module half_adder(
	A,
	B,
	Gnd,
	Vdd,
	carry,
	sum
);
input A;
input B;
inout Gnd;
inout Vdd;
output carry;
output sum;

carry carry_1(
	.A(A),
	.B(B),
	.Gnd(Gnd),
	.Vdd(Vdd),
	.carry(carry)
);
sum sum_1(
	.A(A),
	.B(B),
	.Gnd(Gnd),
	.Vdd(Vdd),
	.sum(sum)
);
endmodule // half_adder


module and(
	A,
	B,
	Gnd,
	Out,
	Vdd
);
input A;
input B;
inout Gnd;
output Out;
inout Vdd;

wire N_1;

cmos_inverter cmos_inverter_1(
	.Gnd(Gnd),
	.In(N_1),
	.Out(Out),
	.Vdd(Vdd)
);
cmos_nand cmos_nand_1(
	.A(A),
	.B(B),
	.Gnd(Gnd),
	.Out(N_1),
	.Vdd(Vdd)
);
endmodule // and


module \2_bit_vedic (
	Gnd,
	Vdd,
	a0,
	a1,
	b0,
	b1,
	s0,
	s1,
	s2,
	s3
);
inout Gnd;
inout Vdd;
input a0;
input a1;
input b0;
input b1;
output s0;
output s1;
output s2;
output s3;

wire N_1;
wire N_2;
wire N_3;
wire N_4;

and and_1(
	.A(a0),
	.B(b0),
	.Gnd(Gnd),
	.Out(s0),
	.Vdd(Vdd)
);
and and_2(
	.A(a1),
	.B(b0),
	.Gnd(Gnd),
	.Out(N_1),
	.Vdd(Vdd)
);
and and_3(
	.A(a0),
	.B(b1),
	.Gnd(Gnd),
	.Out(N_2),
	.Vdd(Vdd)
);
and and_4(
	.A(a1),
	.B(b1),
	.Gnd(Gnd),
	.Out(N_3),
	.Vdd(Vdd)
);
half_adder half_adder_1(
	.A(N_1),
	.B(N_2),
	.Gnd(Gnd),
	.Vdd(Vdd),
	.carry(N_4),
	.sum(s1)
);
half_adder half_adder_2(
	.A(N_4),
	.B(N_3),
	.Gnd(Gnd),
	.Vdd(Vdd),
	.carry(s3),
	.sum(s2)
);
endmodule // \2_bit_vedic 


module nmos25x(
	B,
	D,
	G,
	S
);
inout B;
inout D;
input G;
inout S;
parameter l=2.5e-07;
parameter m=1;
parameter fw=1.5e-06;
parameter fingers=1;
endmodule // nmos25x


module pmos25x(
	B,
	D,
	G,
	S
);
inout B;
inout D;
input G;
inout S;
parameter l=2.5e-07;
parameter m=1;
parameter fw=1.5e-06;
parameter fingers=1;
endmodule // pmos25x


module fast_multiplier(
	A,
	B,
	C,
	Gnd,
	Vdd,
	Vss,
	cout,
	sum
);
input A;
input B;
input C;
inout Gnd;
inout Vdd;
inout Vss;
output cout;
output sum;

wire N_1;
wire N_2;
wire N_3;

nmos25x Mn1(
	.B(Vss),
	.D(N_2),
	.G(A),
	.S(B)
);
nmos25x Mn2(
	.B(Vss),
	.D(N_2),
	.G(B),
	.S(A)
);
nmos25x Mn3(
	.B(Vss),
	.D(sum),
	.G(C),
	.S(N_2)
);
nmos25x Mn4(
	.B(Vss),
	.D(sum),
	.G(N_2),
	.S(C)
);
nmos25x Mn5(
	.B(Gnd),
	.D(cout),
	.G(N_2),
	.S(A)
);
pmos25x Mp1(
	.B(Vdd),
	.D(N_1),
	.G(A),
	.S(Vdd)
);
pmos25x Mp2(
	.B(Vdd),
	.D(N_2),
	.G(B),
	.S(N_1)
);
pmos25x Mp3(
	.B(Vdd),
	.D(N_3),
	.G(C),
	.S(Vdd)
);
pmos25x Mp4(
	.B(Vdd),
	.D(sum),
	.G(N_2),
	.S(N_3)
);
pmos25x Mp5(
	.B(Vdd),
	.D(cout),
	.G(N_2),
	.S(C)
);
endmodule // fast_multiplier


module ripple_carry_adder(
	Gnd,
	Vdd,
	Vss,
	a0,
	a1,
	a2,
	a3,
	b0,
	b1,
	b2,
	b3,
	cIn,
	cout,
	s0,
	s1,
	s2,
	s3
);
inout Gnd;
inout Vdd;
inout Vss;
input a0;
input a1;
input a2;
input a3;
input b0;
input b1;
input b2;
input b3;
input cIn;
output cout;
output s0;
output s1;
output s2;
output s3;

wire N_1;
wire N_2;
wire N_3;

fast_multiplier fast_multiplier_1(
	.A(a0),
	.B(b0),
	.C(cIn),
	.Gnd(Gnd),
	.Vdd(Vdd),
	.Vss(Vss),
	.cout(N_1),
	.sum(s0)
);
fast_multiplier fast_multiplier_2(
	.A(a1),
	.B(b1),
	.C(N_1),
	.Gnd(Gnd),
	.Vdd(Vdd),
	.Vss(Vss),
	.cout(N_2),
	.sum(s1)
);
fast_multiplier fast_multiplier_3(
	.A(a2),
	.B(b2),
	.C(N_2),
	.Gnd(Gnd),
	.Vdd(Vdd),
	.Vss(Vss),
	.cout(N_3),
	.sum(s2)
);
fast_multiplier fast_multiplier_4(
	.A(a3),
	.B(b3),
	.C(N_3),
	.Gnd(Gnd),
	.Vdd(Vdd),
	.Vss(Vss),
	.cout(cout),
	.sum(s3)
);
endmodule // ripple_carry_adder


module \4_vedic (
	Gnd,
	Vdd,
	Vss,
	a0,
	a1,
	a2,
	a3,
	b0,
	b1,
	b2,
	b3,
	ca1,
	ca2,
	ca3,
	s0,
	s1,
	s2,
	s3,
	s4,
	s5,
	s6,
	s7
);
inout Gnd;
inout Vdd;
inout Vss;
input a0;
input a1;
input a2;
input a3;
input b0;
input b1;
input b2;
input b3;
output ca1;
output ca2;
output ca3;
output s0;
output s1;
output s2;
output s3;
output s4;
output s5;
output s6;
output s7;

wire N_1;
wire N_2;
wire N_3;
wire N_4;
wire N_5;
wire N_6;
wire N_7;
wire N_8;
wire N_9;
wire N_10;
wire N_11;
wire N_12;
wire N_13;
wire N_14;
wire N_15;
wire N_16;
wire N_17;
wire N_18;
wire N_19;
wire N_20;

\2_bit_vedic  \2_bit_vedic_1 (
	.Gnd(Gnd),
	.Vdd(Vdd),
	.a0(a0),
	.a1(a1),
	.b0(b0),
	.b1(b1),
	.s0(s0),
	.s1(s1),
	.s2(N_2),
	.s3(N_7)
);
\2_bit_vedic  \2_bit_vedic_2 (
	.Gnd(Gnd),
	.Vdd(Vdd),
	.a0(a0),
	.a1(a1),
	.b0(b2),
	.b1(b3),
	.s0(N_1),
	.s1(N_6),
	.s2(N_11),
	.s3(N_16)
);
\2_bit_vedic  \2_bit_vedic_3 (
	.Gnd(Gnd),
	.Vdd(Vdd),
	.a0(a2),
	.a1(a3),
	.b0(b0),
	.b1(b1),
	.s0(N_3),
	.s1(N_8),
	.s2(N_12),
	.s3(N_17)
);
\2_bit_vedic  \2_bit_vedic_4 (
	.Gnd(Gnd),
	.Vdd(Vdd),
	.a0(a2),
	.a1(a3),
	.b0(b2),
	.b1(b3),
	.s0(N_4),
	.s1(N_9),
	.s2(N_13),
	.s3(N_18)
);
ripple_carry_adder ripple_carry_adder_1(
	.Gnd(Gnd),
	.Vdd(Vdd),
	.Vss(Vss),
	.a0(N_1),
	.a1(N_6),
	.a2(N_11),
	.a3(N_16),
	.b0(N_3),
	.b1(N_8),
	.b2(N_12),
	.b3(N_17),
	.cIn(Gnd),
	.cout(ca1),
	.s0(N_5),
	.s1(N_10),
	.s2(N_14),
	.s3(N_19)
);
ripple_carry_adder ripple_carry_adder_2(
	.Gnd(Gnd),
	.Vdd(Vdd),
	.Vss(Vss),
	.a0(N_2),
	.a1(N_7),
	.a2(Gnd),
	.a3(Gnd),
	.b0(N_5),
	.b1(N_10),
	.b2(N_14),
	.b3(N_19),
	.cIn(Gnd),
	.cout(ca2),
	.s0(s2),
	.s1(s3),
	.s2(N_15),
	.s3(N_20)
);
ripple_carry_adder ripple_carry_adder_3(
	.Gnd(Gnd),
	.Vdd(Vdd),
	.Vss(Vss),
	.a0(N_15),
	.a1(N_20),
	.a2(Gnd),
	.a3(ca1),
	.b0(N_4),
	.b1(N_9),
	.b2(N_13),
	.b3(N_18),
	.cIn(Gnd),
	.cout(ca3),
	.s0(s4),
	.s1(s5),
	.s2(s6),
	.s3(s7)
);
endmodule // \4_vedic 

