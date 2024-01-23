* SPICE export by:  S-Edit 2019.2.0
* Export time:      Tue Jan 23 13:22:39 2024
* Design path:      C:\Users\srira\OneDrive\Documents\TannerEDA\workfiles\lib.defs
* Library:          workfiles
* Cell:             test_2_bit_vedic
* Testbench:        Spice
* View:             schematic
* Export as:        top-level cell
* Export mode:      hierarchical
* Exclude empty:    yes
* Exclude .model:   no
* Exclude .hdl:     no
* Exclude .end:     no
* Expand paths:     yes
* Wrap lines:       no
* Exclude simulator commands:  no
* Exclude global pins:         no
* Exclude instance locations:  no
* Control property name(s):    SPICE

********* Simulation Settings - General Section *********
.probe
.option probev
.lib "C:\Users\srira\OneDrive\Documents\TannerEDA\TannerTools_v2019.2\Process\Generic_250nm\Models\Generic_250nm.lib" tt

*************** Subcircuits *****************
.subckt cmos_inverter In Out Gnd Vdd 
MMn1 Out In Gnd Gnd NMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=4800 $y=2700 $w=400 $h=600
MMp1 Out In Vdd Vdd PMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=4800 $y=3700 $w=400 $h=600
.ends

.subckt sum A B sum Gnd Vdd 
Xcmos_inverter_1 A N_5 Gnd Vdd cmos_inverter $ $x=2100 $y=3900 $w=1800 $h=1000
Xcmos_inverter_2 B N_6 Gnd Vdd cmos_inverter $ $x=2700 $y=1500 $w=1800 $h=1000
Xcmos_inverter_3 A N_7 Gnd Vdd cmos_inverter $ $x=7000 $y=1900 $w=1800 $h=1000 $m
Xcmos_inverter_4 N_4 sum Gnd Vdd cmos_inverter $ $x=7500 $y=3100 $w=1800 $h=1000
Xcmos_inverter_5 B N_8 Gnd Vdd cmos_inverter $ $x=6300 $y=4600 $w=1800 $h=1000 $m
MMn1 N_4 A N_1 Gnd NMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=3800 $y=2700 $w=400 $h=600
MMn2 N_1 N_6 Gnd Gnd NMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=3800 $y=1600 $w=400 $h=600
MMn3 N_4 N_7 N_2 Gnd NMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=5200 $y=2700 $w=400 $h=600 $m
MMn4 N_2 B Gnd Gnd NMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=5200 $y=1600 $w=400 $h=600 $m
MMp1 N_3 A Vdd Vdd PMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=3800 $y=4700 $w=400 $h=600
MMp2 N_3 N_8 Vdd Vdd PMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=5200 $y=4700 $w=400 $h=600 $m
MMp3 N_4 B N_3 Vdd PMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=5200 $y=3700 $w=400 $h=600 $m
MMp4 N_4 N_5 N_3 Vdd PMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=3800 $y=3700 $w=400 $h=600
.ends

.subckt cmos_nand A B Out Gnd Vdd 
MMn1 Out A N_1 Gnd NMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=4800 $y=2700 $w=400 $h=600
MMn2 N_1 B Gnd Gnd NMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=5200 $y=1700 $w=400 $h=600 $m
MMp1 Out A Vdd Vdd PMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=3800 $y=3700 $w=400 $h=600
MMp2 Out B Vdd Vdd PMOS25 w=1.5u l=250n m=1 ad=975f pd=4.3u as=975f ps=4.3u nrd=433.33333m nrs=433.33333m $ $x=6200 $y=3700 $w=400 $h=600 $m
.ends

.subckt carry A B carry Gnd Vdd 
Xcmos_inverter_1 N_1 carry Gnd Vdd cmos_inverter $ $x=6000 $y=3900 $w=1800 $h=1000
Xcmos_nand_1 A B N_1 Gnd Vdd cmos_nand $ $x=4200 $y=3900 $w=1800 $h=1000
.ends

.subckt half_adder A B carry sum Gnd Vdd 
Xcarry_1 A B carry Gnd Vdd carry $ $x=4500 $y=3100 $w=1800 $h=1000
Xsum_1 A B sum Gnd Vdd sum $ $x=4500 $y=4500 $w=1800 $h=1000
.ends

.subckt and A B Out Gnd Vdd 
Xcmos_inverter_1 N_1 Out Gnd Vdd cmos_inverter $ $x=6400 $y=4500 $w=1800 $h=1000
Xcmos_nand_1 A B N_1 Gnd Vdd cmos_nand $ $x=4600 $y=4500 $w=1800 $h=1000
.ends

.subckt 2_bit_vedic a0 a1 b0 b1 s0 s1 s2 s3 Gnd Vdd 
Xand_1 a0 b0 s0 Gnd Vdd and $ $x=3100 $y=5900 $w=1800 $h=1000
Xand_2 a1 b0 N_1 Gnd Vdd and $ $x=3100 $y=4700 $w=1800 $h=1000
Xand_3 a0 b1 N_2 Gnd Vdd and $ $x=3100 $y=3500 $w=1800 $h=1000
Xand_4 a1 b1 N_3 Gnd Vdd and $ $x=3100 $y=2300 $w=1800 $h=1000
Xhalf_adder_1 N_1 N_2 N_4 s1 Gnd Vdd half_adder $ $x=5500 $y=4500 $w=1800 $h=1000
Xhalf_adder_2 N_4 N_3 s3 s2 Gnd Vdd half_adder $ $x=5500 $y=2500 $w=1800 $h=1000
.ends


********* Simulation Settings - Parameters *********
.param VDC = 5v
***** Top Level *****
X2_bit_vedic_1 A0 A1 B0 B1 so s1 s2 s3 Gnd Vdd 2_bit_vedic $ $x=5000 $y=3600 $w=1800 $h=1400
VV1 Vdd Gnd  DC VDC $ $x=9400 $y=5900 $w=400 $h=600
VV2 A0 Gnd  PULSE(0 5 0 5n 5n 45n 100n) $ $x=1200 $y=5100 $w=600 $h=400 $r=90
VV3 A1 Gnd  PULSE(0 5 0 5n 5n 95n 200n) $ $x=1200 $y=4200 $w=600 $h=400 $r=90
VV4 B0 Gnd  PULSE(0 5 0 5n 5n 195n 400n) $ $x=1100 $y=3300 $w=600 $h=400 $r=90
VV5 B1 Gnd  PULSE(0 5 0 5n 5n 395n 800n) $ $x=1500 $y=2500 $w=600 $h=400 $r=90
.PLOT   V(s1) $ $x=6650 $y=3550 $w=1500 $h=300
.PLOT   V(s2) $ $x=6650 $y=3350 $w=1500 $h=300
.PLOT   V(s3) $ $x=6650 $y=3150 $w=1500 $h=300
.PLOT   V(so) $ $x=6650 $y=3750 $w=1500 $h=300

********* Simulation Settings - Analysis Section *********
.tran .5n 1600n

********* Simulation Settings - Additional SPICE Commands *********

.end

