////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: FFF_COMBO.v
// /___/   /\     Timestamp: Thu Mar  8 03:59:35 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/delkov/Documents/MOJO/_cg/FFF_COMBO.ngc /home/delkov/Documents/MOJO/_cg/FFF_COMBO.v 
// Device	: 6slx9tqg144-2
// Input file	: /home/delkov/Documents/MOJO/_cg/FFF_COMBO.ngc
// Output file	: /home/delkov/Documents/MOJO/_cg/FFF_COMBO.v
// # of Modules	: 1
// Design Name	: FFF_COMBO
// Xilinx        : /opt/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module FFF_COMBO (
  clka, addra, douta
)/* synthesis syn_black_box syn_noprune=1 */;
  input clka;
  input [12 : 0] addra;
  output [15 : 0] douta;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_ena ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_ena ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<8> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<9> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<10> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<11> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<12> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<13> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<14> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<15> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<3> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<4> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<5> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<6> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<7> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<0> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<1> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<2> ;
  wire \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<3> ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED ;
  wire [2 : 0] \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe ;
  wire [6 : 6] \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array ;
  VCC   XST_VCC (
    .P(N0)
  );
  GND   XST_GND (
    .G(N1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe_0  (
    .C(clka),
    .CE(N0),
    .D(addra[10]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe_1  (
    .C(clka),
    .CE(N0),
    .D(addra[11]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe_2  (
    .C(clka),
    .CE(N0),
    .D(addra[12]),
    .Q(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux17  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<0> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<0> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<0> ),
    .O(douta[0])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux21  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<2> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<10> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<2> ),
    .O(douta[10])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux31  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<3> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<11> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<3> ),
    .O(douta[11])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux41  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<4> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<12> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<0> ),
    .O(douta[12])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux51  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<5> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<13> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<1> ),
    .O(douta[13])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux61  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<6> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<14> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<2> ),
    .O(douta[14])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux71  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<7> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<15> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<3> ),
    .O(douta[15])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux81  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<1> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<1> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<1> ),
    .O(douta[1])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux91  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<2> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<2> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<2> ),
    .O(douta[2])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux101  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<3> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<3> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<3> ),
    .O(douta[3])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux111  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<4> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<4> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<0> ),
    .O(douta[4])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux121  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<5> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<5> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<1> ),
    .O(douta[5])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux131  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<6> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<6> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<2> ),
    .O(douta[6])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux141  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<7> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<7> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<3> ),
    .O(douta[7])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux151  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<0> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<8> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<0> ),
    .O(douta[8])
  );
  LUT6 #(
    .INIT ( 64'h75FD757520A82020 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/Mmux_dout_mux161  (
    .I0(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [2]),
    .I1(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [1]),
    .I2(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<1> ),
    .I3(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/has_mux_a.A/sel_pipe [0]),
    .I4(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<9> ),
    .I5(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<1> ),
    .O(douta[9])
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/out31  (
    .I0(addra[12]),
    .I1(addra[11]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_ena )
  );
  LUT3 #(
    .INIT ( 8'h08 ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/bindec_a.bindec_inst_a/ADDR[2]_PWR_16_o_equal_7_o<2>1  (
    .I0(addra[12]),
    .I1(addra[11]),
    .I2(addra[10]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [6])
  );
  RAMB16BWER #(
    .DATA_WIDTH_A ( 4 ),
    .DATA_WIDTH_B ( 4 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "FALSE" ),
    .EN_RSTRAM_B ( "FALSE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'hEB6AD958C737A71777E747A80869BA1B6DCF1163B5085B9EE2358ACE1358AE00 ),
    .INIT_01 ( 256'hA6E23D79A5C1ED0915121E1B07E4D1AE8B5815D3905E0CA957F59322B04FDD6C ),
    .INIT_02 ( 256'h2B638C949D754E07BF48D24BA40E47719BA4BEA9836D37F2AD58E37EF974EF4B ),
    .INIT_03 ( 256'h065C82886E1399FF253B21E78E045A91A79E642BB22980B7DEE5CD944CE46BD3 ),
    .INIT_04 ( 256'h6980783FD64D84AB8148DF255C5228CE347B81671C92E80EF4B94FB5EAF0D58B ),
    .INIT_05 ( 256'hE9F3EEC8823CD650BA043D57402AF39C258ED7F008E1BA52DA226A625A12BA21 ),
    .INIT_06 ( 256'h5824F0BD6915B15EEA66D24DA9F5317C98B4CFCBB6A17C38E38E19940E59A4DE ),
    .INIT_07 ( 256'hFA7805921F9D1A87F471DE4BA80553A0FC4986C3F02D5A7683A0ADB9B6A29F7B ),
    .INIT_08 ( 256'h611ECB8836F3A05D1BC88533E0AD5B08B56310CD7B28C57310BD5BF89533C05D ),
    .INIT_09 ( 256'hF854B02D890572EE6BE774F18D1AA733D06D0AA744E19E3BE88532EF9C49F6B3 ),
    .INIT_0A ( 256'hA1FB65DF5AD46F09A45F19D4AF8A65413C37333E495571ACC8F4307CB8F440AC ),
    .INIT_0B ( 256'h7F668DB50C63EB732AE2CAB2BAD20B439C047D06AF4801DAB3AD96A0C9E31D57 ),
    .INIT_0C ( 256'h5F950A90655B71C64CF2C7CDE338BE542A1F256BC147FEB4AAB0E72D942BC198 ),
    .INIT_0D ( 256'h752EE6EEF63D952DE4CCD31A7108CFA6CD037A20F7FD238A10D6CCE238BE6349 ),
    .INIT_0E ( 256'h6EC934BF4AF4AF7A645E6983CD1771FB954F18F20B255EB720C9725B446C95FD ),
    .INIT_0F ( 256'hCEABA89491AEBAD7F32F5C98E4319DF975E17D09A5501CD8B39F8A8691BCD813 ),
    .INIT_10 ( 256'h3B99F653B01E8BF866D340BD3BB835C25FEC7A07A441FEAB5805C28E5B2805D2 ),
    .INIT_11 ( 256'h63C01D6AB70452AFEC3986C4116EABF93683C11E6BA8F64390EE3B89D62381DE ),
    .INIT_12 ( 256'h835F1BD7935F0BA753FF9C28C451DD6AE663DF5CC935A21F8CE845A20F6CB916 ),
    .INIT_13 ( 256'h9EA8B1AB956E38F2AC56E07BF57FEA45AFFA3570ABC6E10C17121E1905F0DCA8 ),
    .INIT_14 ( 256'hA59C6229BF268DB4DBE2C99047EF66DE266D859D957E460EB75FD841AA034C75 ),
    .INIT_15 ( 256'h3A70866C1298ED03F9BF44BAE0F5DB81065D82886E1499FF253B21E78D03599F ),
    .INIT_16 ( 256'h2881DAF30CE4BD55DE266E665E16AE166D857C33DA4188AF864DC32A50572DC3 ),
    .INIT_17 ( 256'h94BFCBC7B39F7A36E18C17930E5994DEE9F4EEC9833DD751BB053F59422CF59F ),
    .INIT_18 ( 256'hF94887C5F422417F8DABA9B6B4A29F7C5A27F4B16E1BB854D16EDA47A3FF3B78 ),
    .INIT_19 ( 256'hB0671DC2721DC77018B056FC9136CA5DE0730597199A1B8CFC6DDD4CAC0C5BAA ),
    .INIT_1A ( 256'h1FB152F49537D8893ADB8C3CEC9D4DFCBC6B1AD98735F3501DCA7631EC965008 ),
    .INIT_1B ( 256'hA69A9FA3A7CBDF04285B8FC3075AAEF144A80B7EE154C73ABC3FB244D669FB8D ),
    .INIT_1C ( 256'hF54DB43CC36A11D8BF958C8299BFD51B51A70D73E97EF4993EE4995E23F7DCB1 ),
    .INIT_1D ( 256'h33FDE8E22C76F09A634D5770CA23BD562F08F11A439CF57D16CE866E566E76BE ),
    .INIT_1E ( 256'h546D960F99524C65BF39E3CDD7118B25FFF9248E08C2ADC6017B15D0CAE43FA9 ),
    .INIT_1F ( 256'h6208BE856B7198CE259C23EAB1A8BFF74EC66E251D255DB63EE6CFC7F049C27B ),
    .INIT_20 ( 256'hD75BDF63F7AB5F13E8BCA095A9BED2074CA1067BF0954A0FD5BABFC5EB2076EC ),
    .INIT_21 ( 256'hFF8224B75AFDA043F6B97C3FF2C5A87C5F4235393C3F43668AADD11458AC0F63 ),
    .INIT_22 ( 256'hE83B8EC01366A9FB4E91E33689EB3E90E346A80B6EC133A6198BFE71E466E97C ),
    .INIT_23 ( 256'h971A9E0174E85BCE3295F85BBE1275C82B7EC11467BA0C5FA2E5388BCD1053A6 ),
    .INIT_24 ( 256'h1A6FB4FA2F54799EA3B8BCA1A68A7F4328FCC08549FDA15509AD41D468FC8F13 ),
    .INIT_25 ( 256'h3D85CDE6FEE6DEA55D059C148BE2397097BEC5CBB2987F35FBA147DD63D95EB4 ),
    .INIT_26 ( 256'h46D13B75806A25BF19536E6822DC56B0EA03FDD7802A93FD264F58310AB35CD4 ),
    .INIT_27 ( 256'h136B838C550D86DFF8E1BB44BDF700EA941E67817B35CF2A545E28D34D87A28C ),
    .INIT_28 ( 256'h799F948A6F25DB61E74D93C9E0D6BD832AB1286F96AD945C038BE22A322AF29A ),
    .INIT_29 ( 256'hCEA27539FDA044E87CF074E85CA0F4386C81A5B9AE93774C01A54ADF44B90F44 ),
    .INIT_2A ( 256'h3DC053D668EB6ED143C6299CFF52A5085B9ED114578AADD0F3071A1D111407EB ),
    .INIT_2B ( 256'hA76A1DCF8235F8AA5D10C38538EB9D5003B5681BCD6013B5680BAD40E37518AB ),
    .INIT_2C ( 256'h4EA10579DD50C438BB3FB246D95DF08316BA5DF09336D98C20D38538EB9E41F4 ),
    .INIT_2D ( 256'h50A60C72E86EF3993EE4995E24F9DEB3A89C91A6ABCFD4F82C5185C90D52A6FA ),
    .INIT_2E ( 256'h2B04FD164F98F07911CA826A526A72AAF24AB138C0671ED5AC938A8097BDD41A ),
    .INIT_2F ( 256'hFFF9237E08C2ACC60B7510DAC5EF29943EF8E2EC2771FB946E48527CC52FB851 ),
    .INIT_30 ( 256'h47CE652D142C53BB33EBC4CCF44DC57E576099029B544E67B13AE4CED7118B25 ),
    .INIT_31 ( 256'h49AD0175099D4206DBBFB4C9EE2378ED6207BD83697E94CB21972EE4BBA2B8FF ),
    .INIT_32 ( 256'h6747373738394A6B8CADDF1062A30567D95CDE60F3A5581BEEC1A497ABBED205 ),
    .INIT_33 ( 256'hE94EA40B62DA32AB148EF873EE6AE5720E9B28B553F1AF4DFBBA7938F8C7A777 ),
    .INIT_34 ( 256'h08E5C2803EDC6AE968D73696F657A8A4FB328AC21B64BEF94491EE3C8CEE3194 ),
    .INIT_35 ( 256'hF339DFE55C42B9B0374E055D45ED464E0780BAB38D1872BDB8935EEA56A2EFFB ),
    .INIT_36 ( 256'hBE39348F4A449E28E2DCE52E67B01971D92188D0276EB41B71E77E34192F751B ),
    .INIT_37 ( 256'h74D22F6D8A98957330ED6BC8051300CD4AA7C4A14DAAC783002CF85450ECF793 ),
    .INIT_38 ( 256'h98B2FD68F39E6945406C88C4107DE965E27F1BA855F2AF4CFAA744E17F0C9A07 ),
    .INIT_39 ( 256'hDC62D81E342AD0365B11776DF30A90971DF44CF30B530B034BC48D86C03AC39E ),
    .INIT_3A ( 256'h4A2753FFFB6652BE99141FCA040FB9236D776029E29B33DC742BC37A22E89F36 ),
    .INIT_3B ( 256'h54B20F6CDA47C442DF7D2AE8C5B3B0DD1B68E683403D4B8805A28FAB08A581CE ),
    .INIT_3C ( 256'h068FC8C18B248EB8C39D58E35EB9E4000BF7C38F3BD764F06DDA46A3F05DAA07 ),
    .INIT_3D ( 256'hDE268ED52C63BA1177ED73391F257B10F63CD2E85E44BBB1385F065E55FD454E ),
    .INIT_3E ( 256'h4FACB9A643A0BC890521FE5A55E1FD98A43F3A854F4A942EE8D1EB146DB61E76 ),
    .INIT_3F ( 256'hE87401AE4BF89542FF9C3AD774028F0D7AD72552809D9B7836D360CE0B1805B2 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RSTTYPE ( "SYNC" ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram  (
    .REGCEA(N1),
    .CLKA(clka),
    .ENB(N1),
    .RSTB(N1),
    .CLKB(N1),
    .REGCEB(N1),
    .RSTA(N1),
    .ENA(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_ena ),
    .DIPA({N1, N1, N1, N1}),
    .WEA({N1, N1, N1, N1}),
    .DOA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<4>_UNCONNECTED , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<3> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_douta<0> }),
    .ADDRA({addra[11], addra[10], addra[9], addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1}),
    .ADDRB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DIB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DOPA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED }),
    .DIPB({N1, N1, N1, N1}),
    .DOPB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED }),
    .DOB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED }),
    .WEB({N1, N1, N1, N1}),
    .DIA({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1})
  );
  RAMB16BWER #(
    .DATA_WIDTH_A ( 4 ),
    .DATA_WIDTH_B ( 4 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "FALSE" ),
    .EN_RSTRAM_B ( "FALSE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h37A60574D342A1107FDE4DAC1B7AD948A70676D534A30261C1309FFE6ECD2C00 ),
    .INIT_01 ( 256'h8DFC7AE958C735B42392007FEE4DBC2A990877D645B32281F05FCE3D9C0A69D8 ),
    .INIT_02 ( 256'h39C856E57302902FAD3CBB49C856D554D251DF5EDD5BDA49C746B533A2219F1E ),
    .INIT_03 ( 256'hFCCA99673504C2805F1DDC8A4807B56412C07F2DCC7A19B755F49231DF6E0C9B ),
    .INIT_04 ( 256'h4F7EACDAF927466483A1BFDEECFB0907161413111F0EFCFAD9C7B59472513F1D ),
    .INIT_05 ( 256'h8DFC6AD948B61584E251BF1E7DDB2A88E73584D33170CE1D5BAAE82765A4D211 ),
    .INIT_06 ( 256'h66F574029120AF3DBC4BCA58D756E563E261EF6EED6CEA69D856D544C231A01E ),
    .INIT_07 ( 256'hDC7B1AA947D675049332C06FFE9D2CBB49E877069533C251E07F0D9C2BBA48D7 ),
    .INIT_08 ( 256'h8220BF5EFD8C2BC968F79635C46201A03FDE7D0BAA49D87716A443D27110AF4D ),
    .INIT_09 ( 256'h58F78624B352E17F1EAD4CDB7918A746D57312A140DF7D1CAB4AE97716B544E3 ),
    .INIT_0A ( 256'h82009F1DAC2BB948C755E463F1801FAE3CCB5AE877069523B241E07E0D9C3BC9 ),
    .INIT_0B ( 256'hF05FBD1C8AE947B62483F160DE4DCB3AA8279514820180FE7DFB7AF977F68403 ),
    .INIT_0C ( 256'h7483A1B0DEFC1B396786B4E2115F8DCC0A4887C5045290EF3D8CDA3887E53492 ),
    .INIT_0D ( 256'hF7B56422E1BF7E4C0BD9A886553301E0CEBD9B8A6856554342303E3D4B495866 ),
    .INIT_0E ( 256'h73F2810F9E1DAB3AC957E67503A231CF6E0CAB3AE88725C47311C07E2DDB8A38 ),
    .INIT_0F ( 256'h6BDA49B827950473E260DF4EBD3CAA199807850473F270EF6EEC6BEA69E766F5 ),
    .INIT_10 ( 256'h41A00F7EDD4BAA0978D746A41372E140BE1D8CFB5AC927960574D341B02F9EFD ),
    .INIT_11 ( 256'hA70674D332A1006ECD3C9BFA69C72685F453B2208FEE4DBC1B79E847A61574D2 ),
    .INIT_12 ( 256'h9E0C7BDA49B72685F452C1309F0E6CDB3AA90776D544A31170DF4EAD1B7AD948 ),
    .INIT_13 ( 256'hD857D654D351D04FCD4CBB39A826951482F170EF5DCC3BB928970574E342B02F ),
    .INIT_14 ( 256'h19C77624C2711FBE5CFB9938D664039130CE5DEB7A089725A432B140CE5DDB5A ),
    .INIT_15 ( 256'h1D1C1A181705F3F2D0CEBD9B7A583615F3C1906E3C0BC9875614D3814F0EBC6A ),
    .INIT_16 ( 256'hEE3D8BDA3877C51452A1EF2E6CABD9184675A3D2F02F4D6B8AA8B7D5E4F2000F ),
    .INIT_17 ( 256'hE967E665E462E160DF5DDC4BC938A71584F361D04FBD1C8BE958B61574D2218F ),
    .INIT_18 ( 256'h4EED7C0B9A39C856E574039221B04EDD6CFB7A099726A534B341C05FDE5CEB6A ),
    .INIT_19 ( 256'h34D47405A544D47413A342D17110AF4EDE7D1CAB4AD978079635C463F29120BF ),
    .INIT_1A ( 256'h46D8790AAB4CDD7E1FA041E27314B546E78829BA5BFC8DCE6EFF9031C16203A3 ),
    .INIT_1B ( 256'h9021B244D566F7992ABB4CDE7F009123C455F68719BA4BEC7D1EA041D27304A5 ),
    .INIT_1C ( 256'h14950788FA7BFD6EEF61E264E566E879FB7C0D8F009113A435B748D96BEC7D0F ),
    .INIT_1D ( 256'hB2E32567B8FA3C8DDF2072C41577C82A8BED3FA00263C536A8097BEC5ECF31A2 ),
    .INIT_1E ( 256'hFEDFB1A2847667594A4C3E3F3143445657698B9CBEC0E103355688AADB0D4E70 ),
    .INIT_1F ( 256'hEF8011B354F69738EA8B3DDE8031E2945507C88A4B0DCE805113E4B688693B1C ),
    .INIT_20 ( 256'h25A617990A8B0C8EFF70F273F475F788098B1C9D1FA031C244D566F8892BBC4D ),
    .INIT_21 ( 256'h4EB02182F354C63798097AEB4DBE2F900173E455C637A91A8BFC6EEF50C142B4 ),
    .INIT_22 ( 256'h89FA5BBD2E8FE041B21475E647A8197BDC4DAE1F70D243A41576D749AA1B7CED ),
    .INIT_23 ( 256'hD344A51778D94AAB1D7EDF40A11374D546A7097ADB3CAD0E60C13293F466C728 ),
    .INIT_24 ( 256'h2A9B0D7EFF61D243B52697097AEB5CCE3F900273E445B72899FA6CCD3E9F0072 ),
    .INIT_25 ( 256'hBC4EDF61F28415A738CA4BDD5ED061E364E567E86AEB6CEE5FD152C345B637A9 ),
    .INIT_26 ( 256'h29FBDCAE704113D4A66829EBAD5E10C27335D6883AEB8D2ED07113B556E8891B ),
    .INIT_27 ( 256'h0637699ACCFD1F30527495B7C8DAFCFD0F1012141517080AFCEDDFB1A2846647 ),
    .INIT_28 ( 256'h0879EB5CCD3F900263D43697F95ABB1D7EC02172C41567B80A4B8DDE105183C4 ),
    .INIT_29 ( 256'hCF51E273F486179829AB3CBD4EC041D253D556D758DA5BDC5ECF40B133A42597 ),
    .INIT_2A ( 256'h49DB7C0DAE3FD062039435C657F98A2BBC4DDF70019223B546E778099B2CBD3E ),
    .INIT_2B ( 256'hE48526B759FA8B2CCD6FF09132C36406A738D97A0BAD4EDF7011A244D57617A8 ),
    .INIT_2C ( 256'hCD5FF08112B445E67718AA4BDC7D0FA041D27305A647D8791BAC4DEE7F10B243 ),
    .INIT_2D ( 256'hF4750688099A1CAD3EB041D264E57608992ABC4DDE6FF18223B546D7780A9B2C ),
    .INIT_2E ( 256'h84E637A90A6CCE3FA10274E557C83AAB1D9E0081F374F567E86AEB6DEE6FE172 ),
    .INIT_2F ( 256'h50628495B7C9EA0C3D5F81A2D4054779BAEC2E6FB1F33486D7297BCC1E7FC123 ),
    .INIT_30 ( 256'h5F00C2834506C8895B1CEEBF81623415F7D9BAAC8D7F6052444537383A4C4D5F ),
    .INIT_31 ( 256'h0485179829AA3CCD4EDF61F28325B647E98A1BBD5EFF9132E48536D8893BEC9D ),
    .INIT_32 ( 256'h0071E253C435A61788F96AEC5DCE4FB021A2139506870889FA7CFD7EFF70F283 ),
    .INIT_33 ( 256'hD848A9197ADA4BAB1C7CDD4EAE1F70E151B22384F556C63798097AEB4CBD2E9F ),
    .INIT_34 ( 256'hD1600FAE4CDB7A09A837D665F493222C8BFB5ABA2989E848B81877E747A71878 ),
    .INIT_35 ( 256'h2F6D8BAAC8D7D5D4D2C0BF9D7C4A29F7C6854302C08F3EEC9B4AF89746E58322 ),
    .INIT_36 ( 256'hFEEDCC9A6928D68514A221AF0E5DABDAF8171504F2C08F4DEC7A0887F553A2F0 ),
    .INIT_37 ( 256'h45A41271D03F9EFD5CAA0958B7065593E22160AFED1C4B7AA9C7D6F504020100 ),
    .INIT_38 ( 256'hBC0B59B80765C42382E04FAE1D7BDA49A81685E453B2209FFE6DDC3BA91877E6 ),
    .INIT_39 ( 256'h6DDC4AD86705A46220FFCDAB8A8877758382A0BFED0C3A6997C6044382D01F6D ),
    .INIT_3A ( 256'hBA99785645444341507F9DBCFB3978D735A423B140FEBD7B5A4837456482C01F ),
    .INIT_3B ( 256'h50EF8D1CAB4AD97806A544D37211B05E0DAC4BFAA95706B57423E1A07F3E0DDB ),
    .INIT_3C ( 256'hC9874605C38230EF9E4CFB9A48E78635D36201AF4EDD7C0BA938D766F59322C1 ),
    .INIT_3D ( 256'hFB1A1807F5C48241EF7D0C8AF857A5F422608FADCBDAD8D7D5C3B2907F4D2CFA ),
    .INIT_3E ( 256'hE52463A2E1104E7DACCBD9F807060403F2E0CF9E6C2BDA8817A624A30150AEDD ),
    .INIT_3F ( 256'hAB1A89E756B52493F160DF3EAD1C7AE948A71675D43291F05FAE0D5BBA095897 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RSTTYPE ( "SYNC" ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram  (
    .REGCEA(N1),
    .CLKA(clka),
    .ENB(N1),
    .RSTB(N1),
    .CLKB(N1),
    .REGCEB(N1),
    .RSTA(N1),
    .ENA(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_ena ),
    .DIPA({N1, N1, N1, N1}),
    .WEA({N1, N1, N1, N1}),
    .DOA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<4>_UNCONNECTED , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<3> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.ram_douta<0> }),
    .ADDRA({addra[11], addra[10], addra[9], addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1}),
    .ADDRB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DIB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DOPA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED }),
    .DIPB({N1, N1, N1, N1}),
    .DOPB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED }),
    .DOB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[3].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED }),
    .WEB({N1, N1, N1, N1}),
    .DIA({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1})
  );
  RAMB16BWER #(
    .DATA_WIDTH_A ( 4 ),
    .DATA_WIDTH_B ( 4 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "FALSE" ),
    .EN_RSTRAM_B ( "FALSE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'hFDEDEDDDCDCDBDBDAC9C9C8C8C7C6C6C5C5C4C3C3C2C2C1C0C0CFBEBEBDBDB00 ),
    .INIT_01 ( 256'h1F0F0FFFFFEFEFDFDFCFCFBEAEAE9E9E8E8E7E6E6E5E5E4E3E3D2D2D1D1D0DFD ),
    .INIT_02 ( 256'h120202F2F2F2E2E1D1D1C1C1B1B1A1A191918080707060605050404030302F2F ),
    .INIT_03 ( 256'hA5A5A5A5A5A59595949484848484747474646363535353434333333322222212 ),
    .INIT_04 ( 256'hA8A8A8A8A8B8B8B8B8B8B7B7B7B7C7C7C7C7C7C7C6C6B6B6B6B6B6B6B6B6B5B5 ),
    .INIT_05 ( 256'hFBFB0B0B1B1B2B2B2B3B3A4A4A4A5A5A5A6A6A6A7A7A798989898999999999A9 ),
    .INIT_06 ( 256'hFEFE0E1E1E2E2D3D3D4D4D5D5D6D6D7D7D8D8C9C9CACACBCBCCCCCDCDCECECFB ),
    .INIT_07 ( 256'hC0D0E0E0F0F000101020203F3F4F5F5F6F6F7F8F8F9F9FAFAFBECECEDEDEEEEE ),
    .INIT_08 ( 256'h93A3A2B2B2C2D2D2E2E2F20202122222313141515161617181819191A1B1B0C0 ),
    .INIT_09 ( 256'h65657585859595A4B4B4C4C4D4E4E4F4F4041414242333434353536373738383 ),
    .INIT_0A ( 256'h4858576767777787879797A7A7B7C6C6D6D6E6E6F60606161626263545455555 ),
    .INIT_0B ( 256'h5B6A6A7A7A7A8A8A9A9A9AAAA9B9B9C9C9D9D9E9E9F9F9F80808181828283848 ),
    .INIT_0C ( 256'hEEEEEEEEEDEDFDFDFDFDFDFD0D0C0C0C1C1C1C1C2C2C2C2B3B3B3B4B4B4B5B5B ),
    .INIT_0D ( 256'h111111110100000000F0F0F0F0F0F0E0EFEFEFEFEFEFEFEFEFEFEEEEEEEEEEEE ),
    .INIT_0E ( 256'hE4D4D4D3C3C3B3B3A3A393939383837272726262525252424242323131212121 ),
    .INIT_0F ( 256'hF6E6E6D6D6C6C6B6A6A695958585757565655555453535242414140404F4F4E4 ),
    .INIT_10 ( 256'h29191808F8F8E8E8D8C8C8B8B8A89898878777676757574747372727171606F6 ),
    .INIT_11 ( 256'h5B5B4B3B3B2B2B1A0A0AFAEAEADADACABABAAAAA998989797969595949493929 ),
    .INIT_12 ( 256'h8D8D7D6D6D5D5D4D3D3D2D2D1C1C0CFCFCECECDCCCCCBCBCAC9B9B8B8B7B6B6B ),
    .INIT_13 ( 256'h909080807070606F5F5F4F4F3F3F2F2F1F0F0FFEFEEEEEDEDECECEBEAEAE9E9D ),
    .INIT_14 ( 256'h73636363535352424232323222222212120101F1F1F1E1E1D1D1C1C1B0B0A0A0 ),
    .INIT_15 ( 256'hC6C6C6C6C6C6B6B6B6B5B5B5B5B5B5B5A5A5A5A4A4A494949494848483837373 ),
    .INIT_16 ( 256'h596969697979798989898898989898A8A8A8A8A8A8B7B7B7B7B7B7B7B7B7C7C6 ),
    .INIT_17 ( 256'h7C8C8C9C9CACACBCBBCBCBDBDBEBEBFBFBFB0B0B1A1A2A2A2A3A3A4A4A4A5A59 ),
    .INIT_18 ( 256'h6E6E7E8E8E9E9EAEAEBECECEDEDEEDEDFDFD0D1D1D2D2D3D3D4D4D5C5C6C6C7C ),
    .INIT_19 ( 256'h303040505060607080809090A0B0BFCFCFDFEFEFFFFF0F1F1F2F2F3F3F4F5F5E ),
    .INIT_1A ( 256'hFEFE0E1E1E2E2E3E4E4F5F5F6F7F7F8F8F9FAFAFBFBFCFDFEFEFF00000102020 ),
    .INIT_1B ( 256'hCCDCDCECECFCFC0C1C1C2C2C3C4D4D5D5D6D6D7D8D8D9D9DADBDBECECEDEEEEE ),
    .INIT_1C ( 256'hC9C9D9D9D9E9E9F9F90A0A1A1A2A2A3A3A4A5A5A6B6B7B7B8B8B9B9BABABBBCB ),
    .INIT_1D ( 256'h06061616161626262637373747474757575767687878788888989898A8A8B9B9 ),
    .INIT_1E ( 256'hE2E2E3E3E3E3E3E3E3E3E3E3E4E4E4E4E4E4E4E4E4E5E5F5F5F5F5F5F5050506 ),
    .INIT_1F ( 256'h7F70706060505050404040303131212121211111111101020202F2F2F2F2F2F2 ),
    .INIT_20 ( 256'h7D6D6D5D5D4D4D3D2D2E1E1E0E0EFEFEFEEEEEDEDECFCFBFBFAFAF9F9F9F8F8F ),
    .INIT_21 ( 256'h9A8B8B7B6B6B5B5B4B4B3B2B2B1B1B0C0CFCECECDCDCCCCCBCACAC9C9D8D8D7D ),
    .INIT_22 ( 256'hC8B8B8A8A89889897979695959494939292919190AFAFAEAEADACACABABAAA9A ),
    .INIT_23 ( 256'hF6F6E6E6D6C6C6B6B6A69697878777676757574737372727180808F8E8E8D8D8 ),
    .INIT_24 ( 256'h23131303F3F4E4E4D4D4C4C4B4A4A49494858575656555554535352525151606 ),
    .INIT_25 ( 256'h10100001F1F1F1E1E1D1D1C1C1B2B2A2A2929282827272626253534343333323 ),
    .INIT_26 ( 256'hBDADADADAEAEAE9E9E9E9E8E8E8E8F7F7F7F6F6F6F5F5F5F4040403030202020 ),
    .INIT_27 ( 256'hAAAAAAAAAAAABABBBBBBBBBBBBBBBBBBCBCCCCCCCCCCCCCCBCBCBCBDBDBDBDBD ),
    .INIT_28 ( 256'hF7F7F7070717182828283838384848585859696969797979898989899A9A9A9A ),
    .INIT_29 ( 256'hE4F5F505051525253535454555566666767686869696A6A6B6B6C7C7D7D7E7E7 ),
    .INIT_2A ( 256'hC2C2D2E2E2F2F30313132323333343535363637484849494A4A4B4C4C4D4D4E4 ),
    .INIT_2B ( 256'h8090A0A0B0B0C0D0D0E0E1F10101112121313141515161617282829292A2B2B2 ),
    .INIT_2C ( 256'h5D6D6E7E8E8E9E9EAEBEBECECEDEEEEFFFFF0F1F1F2F2F3F4F4F5F5F6F707080 ),
    .INIT_2D ( 256'h3B4B5B5B6B6B7B7B8B8C9C9CACACBCCCCCDCDCECECFCFD0D1D1D2D2D3D4D4D5D ),
    .INIT_2E ( 256'h585868687878788889999999A9A9B9B9C9C9DADADAEAEAFAFA0A0A1A1A2A2B3B ),
    .INIT_2F ( 256'hE5E5E5E5E5E5E5F5F5F5F6F6F606060606061616171727272737373747474858 ),
    .INIT_30 ( 256'h21221212121202020202F2F2F3F3F3F3E3E3E3E3E3E3E4E4E4E4E4E4E4E4E4E4 ),
    .INIT_31 ( 256'hFFEFEFDFDFCFCFBFBFAFA0909090808070707060605051514141413131312121 ),
    .INIT_32 ( 256'h0DFDEDEDDDDDCDCDBDADAD9D9D8D8D7E7E6E6E5E5E4E4E3E2E2E1E1E0E0FFFFF ),
    .INIT_33 ( 256'h2B2B1B1B0BFBFBEBEBDBCBCBBBBBAC9C9C8C8C7C6C6C5C5C4C4C3C2C2C1C1C0C ),
    .INIT_34 ( 256'h0CFCEBCBBB9B8B7B5B4B2B1BFBEBDBDBCBBBBBABAB9B8B8B7B7B6B5B5B4B4B3B ),
    .INIT_35 ( 256'h6E5E4E3E2E1E0EFEEEDECDBDAD9D8D6D5D4D3D2D0DFCECCCBCAC8C7C6C4C3C2C ),
    .INIT_36 ( 256'h21314151617171819191A1A0B0B0B0B0B0C0C0C0B0B0BFBFAFAFAF9F8F8F7F6F ),
    .INIT_37 ( 256'hB4C4E4F404233343637393A3B3D3E3F30323334252728292A2B2C2D2F2021222 ),
    .INIT_38 ( 256'hE60616264656668696A6C5D5F505153545657585A5B5D5E4F414244454748494 ),
    .INIT_39 ( 256'hF9F909091929293949485868788898A8B8C8D8E7F71727374757778797A7C6D6 ),
    .INIT_3A ( 256'hFCECDCCCBCAC9C8C7C6B5B4B3B3B2B1B1B0B0BFBFBEAEAEAEAEAEAEAEAEAEAF9 ),
    .INIT_3B ( 256'hAF8E7E6E4E3E1E0EFEDECEAE9E8E6E5D4D2D1DFDEDDDCDAD9D8D6D5D4C3C2C0C ),
    .INIT_3C ( 256'h5141312101F1E1C0B0A080706040302000F0E0CFBF9F8F7F5F4F2F1FFFEFDFBF ),
    .INIT_3D ( 256'hB4C4C4C4B4B4B4B4A3A3A3938383736363534232221202F2E2D2C2B2A1918161 ),
    .INIT_3E ( 256'h0727374757778696A6B6C6D6F606162626364555657575859595A5A5B5B5B4B4 ),
    .INIT_3F ( 256'h49697989A9B9D9E9F919284858788898B8C8E8F808283848677797A7B7D7E7F7 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RSTTYPE ( "SYNC" ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram  (
    .REGCEA(N1),
    .CLKA(clka),
    .ENB(N1),
    .RSTB(N1),
    .CLKB(N1),
    .REGCEB(N1),
    .RSTA(N1),
    .ENA(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_ena ),
    .DIPA({N1, N1, N1, N1}),
    .WEA({N1, N1, N1, N1}),
    .DOA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<4>_UNCONNECTED , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<3> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.ram_douta<0> }),
    .ADDRA({addra[11], addra[10], addra[9], addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1}),
    .ADDRB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DIB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DOPA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED }),
    .DIPB({N1, N1, N1, N1}),
    .DOPB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED }),
    .DOB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[4].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED }),
    .WEB({N1, N1, N1, N1}),
    .DIA({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1})
  );
  RAMB16BWER #(
    .DATA_WIDTH_A ( 4 ),
    .DATA_WIDTH_B ( 4 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "FALSE" ),
    .EN_RSTRAM_B ( "FALSE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h6363636363636363636363636363636363636363636363636363535353535300 ),
    .INIT_01 ( 256'h8383837373737373737373737373737373737373737373737373737373737363 ),
    .INIT_02 ( 256'h9494948484848484848484848484848484848484848484848484848484848383 ),
    .INIT_03 ( 256'h9494949494949494949494949494949494949494949494949494949494949494 ),
    .INIT_04 ( 256'h9494949494949494949494949494949494949494949494949494949494949494 ),
    .INIT_05 ( 256'h8484949494949494949494949494949494949494949494949494949494949494 ),
    .INIT_06 ( 256'h7474848484848484848484848484848484848484848484848484848484848484 ),
    .INIT_07 ( 256'h6565656565657575757575747474747474747474747474747474747474747474 ),
    .INIT_08 ( 256'h5555555555555555555555656565656565656565656565656565656565656565 ),
    .INIT_09 ( 256'h4545454545454545454545454545454545555555555555555555555555555555 ),
    .INIT_0A ( 256'h3535353535353535353535353535353535353535354545454545454545454545 ),
    .INIT_0B ( 256'h2525252525252525252525252525252525252525252525253535353535353535 ),
    .INIT_0C ( 256'h1515151515151515151515152525252525252525252525252525252525252525 ),
    .INIT_0D ( 256'h2626262626262626261616161616161615151515151515151515151515151515 ),
    .INIT_0E ( 256'h2626262626262626262626262626262626262626262626262626262626262626 ),
    .INIT_0F ( 256'h3636363636363636363636363636363636363636363636363636363636262626 ),
    .INIT_10 ( 256'h5656565646464646464646464646464646464646464646464646464646464636 ),
    .INIT_11 ( 256'h6666666666666666666656565656565656565656565656565656565656565656 ),
    .INIT_12 ( 256'h7676767676767676767676767676766666666666666666666666666666666666 ),
    .INIT_13 ( 256'h8787878787878786868686868686868686868676767676767676767676767676 ),
    .INIT_14 ( 256'h9797979797979797979797979797979797979787878787878787878787878787 ),
    .INIT_15 ( 256'h9797979797979797979797979797979797979797979797979797979797979797 ),
    .INIT_16 ( 256'h9797979797979797979797979797979797979797979797979797979797979797 ),
    .INIT_17 ( 256'h8787878787878787878787878787878787879797979797979797979797979797 ),
    .INIT_18 ( 256'h7777777777777777777777777777777777778787878787878787878787878787 ),
    .INIT_19 ( 256'h6868686868686868686868686868676767676767676777777777777777777777 ),
    .INIT_1A ( 256'h4747575757575757575757575757575757575757575757575757586868686868 ),
    .INIT_1B ( 256'h3737373737373747474747474747474747474747474747474747474747474747 ),
    .INIT_1C ( 256'h2727272727272727273737373737373737373737373737373737373737373737 ),
    .INIT_1D ( 256'h2727272727272727272727272727272727272727272727272727272727272727 ),
    .INIT_1E ( 256'h1717171717171717171717171717171717171717171717171717171717272727 ),
    .INIT_1F ( 256'h2627272727272727272727272727272727272727272727272727171717171717 ),
    .INIT_20 ( 256'h3636363636363636363636363636262626262626262626262626262626262626 ),
    .INIT_21 ( 256'h4646464646464646464646464646464646363636363636363636363636363636 ),
    .INIT_22 ( 256'h5656565656565656565656565656565656565656564646464646464646464646 ),
    .INIT_23 ( 256'h6666666666666666666666666666666666666666666666666666665656565656 ),
    .INIT_24 ( 256'h8686868676767676767676767676767676767676767676767676767676767676 ),
    .INIT_25 ( 256'h9696969686868686868686868686868686868686868686868686868686868686 ),
    .INIT_26 ( 256'h9595959595959595959595959595959595959595959595959696969696969696 ),
    .INIT_27 ( 256'h9595959595959595959595959595959595959595959595959595959595959595 ),
    .INIT_28 ( 256'h8585859595959595959595959595959595959595959595959595959595959595 ),
    .INIT_29 ( 256'h7575758585858585858585858585858585858585858585858585858585858585 ),
    .INIT_2A ( 256'h6565656565656575757575757575757575757575757575757575757575757575 ),
    .INIT_2B ( 256'h5555555555555555555555556565656565656565656565656565656565656565 ),
    .INIT_2C ( 256'h4444444444444444444444444444444444445454545454545454545454555555 ),
    .INIT_2D ( 256'h3434343434343434343434343434343434343434343434444444444444444444 ),
    .INIT_2E ( 256'h2424242424242424242424242424242424242424242424242434343434343434 ),
    .INIT_2F ( 256'h1414141414141414141414141424242424242424242424242424242424242424 ),
    .INIT_30 ( 256'h2424242424242424242414141414141414141414141414141414141414141414 ),
    .INIT_31 ( 256'h2323232323232323232324242424242424242424242424242424242424242424 ),
    .INIT_32 ( 256'h4333333333333333333333333333333333333333333333333333333333332323 ),
    .INIT_33 ( 256'h5353535353434343434343434343434343434343434343434343434343434343 ),
    .INIT_34 ( 256'h7363636363636363636363635353535353535353535353535353535353535353 ),
    .INIT_35 ( 256'h9393939393939383838383838383838383838383837373737373737373737373 ),
    .INIT_36 ( 256'h9494949494949494949494949494949494949494949493939393939393939393 ),
    .INIT_37 ( 256'h6464646474747474747474747474747484848484848484848484848484949494 ),
    .INIT_38 ( 256'h3444444444444444444444444454545454545454545454545464646464646464 ),
    .INIT_39 ( 256'h1414242424242424242424242424242424242424243434343434343434343434 ),
    .INIT_3A ( 256'h2424242424242424242424242424242424242414141414141414141414141414 ),
    .INIT_3B ( 256'h5454545454545454444444444444444444444434343434343434343434343434 ),
    .INIT_3C ( 256'h8585858585757575757575757575757575656564646464646464646454545454 ),
    .INIT_3D ( 256'h9595959595959595959595959595959595959595959595858585858585858585 ),
    .INIT_3E ( 256'h8585858585858585858585858595959595959595959595959595959595959595 ),
    .INIT_3F ( 256'h5555555555555555556565656565656565656565757575757575757575757575 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RSTTYPE ( "SYNC" ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram  (
    .REGCEA(N1),
    .CLKA(clka),
    .ENB(N1),
    .RSTB(N1),
    .CLKB(N1),
    .REGCEB(N1),
    .RSTA(N1),
    .ENA(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_ena ),
    .DIPA({N1, N1, N1, N1}),
    .WEA({N1, N1, N1, N1}),
    .DOA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<4>_UNCONNECTED , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<3> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.ram_douta<0> }),
    .ADDRA({addra[11], addra[10], addra[9], addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1}),
    .ADDRB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DIB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DOPA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED }),
    .DIPB({N1, N1, N1, N1}),
    .DOPB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED }),
    .DOB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[6].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED }),
    .WEB({N1, N1, N1, N1}),
    .DIA({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1})
  );
  INV   \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/out21_INV_0  (
    .I(addra[12]),
    .O(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.ram_ena )
  );
  RAMB16BWER #(
    .DATA_WIDTH_A ( 9 ),
    .DATA_WIDTH_B ( 9 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "FALSE" ),
    .EN_RSTRAM_B ( "FALSE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h3E5A405A415A425A445A455A465A485A495A4A5A4C5A4D5A4F5A505951595359 ),
    .INIT_01 ( 256'h2B5C2C5C2D5C2E5C2F5C315B325B335B345B355B375B385B395B3A5B3C5B3D5B ),
    .INIT_02 ( 256'h1F5E1F5D205D205D215D225D225D235D245D245D255D265C275C285C295C2A5C ),
    .INIT_03 ( 256'h215F205F205F1F5F1F5F1E5F1E5F1E5E1E5E1E5E1E5E1E5E1E5E1E5E1E5E1F5E ),
    .INIT_04 ( 256'h2F602E602D602C602B602A6029602860276026602560245F235F235F225F215F ),
    .INIT_05 ( 256'h4462426141613F613E613D613C613A6139613861366135613461336132613060 ),
    .INIT_06 ( 256'h5A6358635763566354625362516250624F624D624C624A624962486246624562 ),
    .INIT_07 ( 256'h70646F646E646C646B64696468636763656364636263616360635E635D635B63 ),
    .INIT_08 ( 256'h856584658365826580657F657E657C657B657A65786477647664746473647264 ),
    .INIT_09 ( 256'h96679567946793679266916690668F668E668D668C668B668A66896688658665 ),
    .INIT_0A ( 256'h9B689C689C689C689B689B689B689B689A689A689A6799679867986797679667 ),
    .INIT_0B ( 256'h926A936A946A956A966A976997699869996999699A699A699B699B699B699B69 ),
    .INIT_0C ( 256'h806B826B836B846B856B876B886B896B8A6A8B6A8C6A8D6A8F6A906A916A926A ),
    .INIT_0D ( 256'h6B6C6C6C6E6C6F6C706C726C736C746C766C776C796C7A6B7B6B7D6B7E6B7F6B ),
    .INIT_0E ( 256'h546D566D576D586D5A6D5B6D5D6D5E6D5F6D616D626D646D656D676C686C696C ),
    .INIT_0F ( 256'h3E6F406F416F426E446E456E466E486E496E4A6E4C6E4D6E4F6E506E516E536E ),
    .INIT_10 ( 256'h2B702C702D702E702F7031703270336F346F356F376F386F396F3A6F3C6F3D6F ),
    .INIT_11 ( 256'h1F721F7220722071217122712271237124712471257126712771287029702A70 ),
    .INIT_12 ( 256'h2173207320731F731F731E731E731E731E731E721E721E721E721E721E721F72 ),
    .INIT_13 ( 256'h2F752E752D742C742B742A742974287427742674257424742374237422732173 ),
    .INIT_14 ( 256'h4476427641763F763E753D753C753A7539753875367535753475337532753075 ),
    .INIT_15 ( 256'h5A7758775777567754775377517750764F764D764C764A764976487646764576 ),
    .INIT_16 ( 256'h70786F786E786C786B78697868786778657864776277617760775E775D775B77 ),
    .INIT_17 ( 256'h857A84798379827980797F797E797C797B797A79787977797678747873787278 ),
    .INIT_18 ( 256'h967B957B947B937B927B917B907A8F7A8E7A8D7A8C7A8B7A8A7A897A887A867A ),
    .INIT_19 ( 256'h9B7D9C7D9C7C9C7C9B7C9B7C9B7C9B7C9A7C9A7C9A7C997C987B987B977B967B ),
    .INIT_1A ( 256'h927E937E947E957E967E977E977E987D997D997D9A7D9A7D9B7D9B7D9B7D9B7D ),
    .INIT_1B ( 256'h807F827F837F847F857F877F887F897F8A7F8B7F8C7F8D7E8F7E907E917E927E ),
    .INIT_1C ( 256'h6B806C806E806F8070807280738074807680778079807A807B7F7D7F7E7F7F7F ),
    .INIT_1D ( 256'h537F547F567F577F587F5A7F5B7F5E7F5F7F617F627F647F6580678068806980 ),
    .INIT_1E ( 256'h3D7D3E7E3F7E417E427E447E457E467E487E497E4A7E4C7E4D7E4F7F507F517F ),
    .INIT_1F ( 256'h2A7C2B7C2C7C2D7C2E7C2F7C307D327D337D347D357D367D387D397D3A7D3C7D ),
    .INIT_20 ( 256'h1E7A1F7A1F7B207B207B217B217B227B237B237B247B257B267C277C287C297C ),
    .INIT_21 ( 256'h22792179207920791F791F791F791E7A1E7A1E7A1E7A1E7A1E7A1E7A1E7A1E7A ),
    .INIT_22 ( 256'h31782F782E782D782C782B782A78297828782778267825782479247923792279 ),
    .INIT_23 ( 256'h457644774277417740773E773D773C773A773977387737773577347733773278 ),
    .INIT_24 ( 256'h5B755A7558755775567654765376517650764F764D764C764A76497648764676 ),
    .INIT_25 ( 256'h727470746F746E746C746B7469756875677565756475627561755F755E755D75 ),
    .INIT_26 ( 256'h8773857384738373827380737F737E737D737B737A7479747774767474747374 ),
    .INIT_27 ( 256'h9771967195719471937192729272917290728F728D728C728B728A7289728873 ),
    .INIT_28 ( 256'h9B6F9B709C709C709C709B709B709B709B709B709A709A719971997198719771 ),
    .INIT_29 ( 256'h916E926E936E946E956E966F966F976F986F986F996F9A6F9A6F9A6F9B6F9B6F ),
    .INIT_2A ( 256'h7F6D806D826D836D846D856D866D886D896E8A6E8B6E8C6E8D6E8E6E8F6E906E ),
    .INIT_2B ( 256'h696C6B6C6C6C6E6C6F6C706C726C736C746C766C776C786D7A6D7B6D7C6D7E6D ),
    .INIT_2C ( 256'h536B546B566B576B586B5A6B5B6B5D6B5E6B606B616B626B646B656C676C686C ),
    .INIT_2D ( 256'h3D693E693F69416A426A446A456A466A486A496A4A6A4C6A4D6A4F6A506A516A ),
    .INIT_2E ( 256'h2A682B682C682D682E682F68306832683369346935693669386939693A693C69 ),
    .INIT_2F ( 256'h1E661F661F662066206721672167226723672367246725672667276728682968 ),
    .INIT_30 ( 256'h22652165206520651F651F651F651E651E651E651E661E661E661E661E661E66 ),
    .INIT_31 ( 256'h31632F632E642D642C642B642A64296428642764266425642464246423652265 ),
    .INIT_32 ( 256'h456244624262416240633E633D633C633A633963386337633563346333633263 ),
    .INIT_33 ( 256'h5B615A6158615761566154615361516250624F624D624C624A62496248624662 ),
    .INIT_34 ( 256'h726070606F606E606C606B6069606860676065616461626161615F615E615D61 ),
    .INIT_35 ( 256'h875E855F845F835F825F805F7F5F7E5F7D5F7B5F7A5F795F775F766074607360 ),
    .INIT_36 ( 256'h975D965D955D945D935D925D925D915E905E8F5E8D5E8C5E8B5E8A5E895E885E ),
    .INIT_37 ( 256'h9B5B9B5B9C5B9C5C9C5C9B5C9B5C9B5C9B5C9B5C9A5C9A5C995C995D985D975D ),
    .INIT_38 ( 256'h915A925A935A945A955A965A965A975A985B985B995B9A5B9A5B9A5B9B5B9B5B ),
    .INIT_39 ( 256'h7F59805982598359845985598659885989598A598B598C5A8D5A8E5A8F5A905A ),
    .INIT_3A ( 256'h69586B586C586E586F5870587258735874587658775878587A587B587C597E59 ),
    .INIT_3B ( 256'h535654565657575758575A575B575D575E576057615762576457655767576857 ),
    .INIT_3C ( 256'h3D553E553F5541554255445545564656485649564A564C564D564F5650565156 ),
    .INIT_3D ( 256'h2A542B542C542D542E542F54305432543354345435553655385539553A553C55 ),
    .INIT_3E ( 256'h1E521F521F522052205221522153225323532353245325532653275328532953 ),
    .INIT_3F ( 256'h22502151205120511F511F511F511E511E511E511E511E511E521E521E521E52 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RSTTYPE ( "SYNC" ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram  (
    .REGCEA(N1),
    .CLKA(clka),
    .ENB(N1),
    .RSTB(N1),
    .CLKB(N1),
    .REGCEB(N1),
    .RSTA(N1),
    .ENA(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_ena ),
    .DIPA({N1, N1, N1, N1}),
    .WEA({N1, N1, N1, N1}),
    .DOA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<7> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<5> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<3> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.ram_douta<0> }),
    .ADDRA({addra[10], addra[9], addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1}),
    .ADDRB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DIB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DOPA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED }),
    .DIPB({N1, N1, N1, N1}),
    .DOPB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED }),
    .DOB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[5].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED }),
    .WEB({N1, N1, N1, N1}),
    .DIA({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1})
  );
  RAMB16BWER #(
    .DATA_WIDTH_A ( 18 ),
    .DATA_WIDTH_B ( 18 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "FALSE" ),
    .EN_RSTRAM_B ( "FALSE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h28805050278F506426A6507925C7508E24F150A3242550B8236350CD22AD50E3 ),
    .INIT_01 ( 256'h31054FB02FDF4FC42EBF4FD72DA44FEB2C8F4FFF2B8150132A7950272979503B ),
    .INIT_02 ( 256'h3AD24F17398C4F2A38484F3D37084F5035CC4F6334944F7633604F8A32304F9D ),
    .INIT_03 ( 256'h45694E82440F4E9442B64EA7415F4EBA400B4ECC3EB84EDF3D694EF23C1C4F04 ),
    .INIT_04 ( 256'h50774DED4F114E004DAC4E134C484E254AE54E3849844E4A48244E5D46C64E6F ),
    .INIT_05 ( 256'h5BBF4D585A554D6B58EA4D7D57804D9056174DA354AE4DB653454DC851DE4DDB ),
    .INIT_06 ( 256'h67104CBE65A74CD1643E4CE562D44CF861694D0B5FFF4D1F5E944D325D2A4D45 ),
    .INIT_07 ( 256'h72394C1E70D84C326F764C466E124C5B6CAD4C6F6B474C8369E04C9768784CAA ),
    .INIT_08 ( 256'h7D014B737BB04B897A5C4B9F79064BB477AE4BCA76534BDF74F74BF473994C09 ),
    .INIT_09 ( 256'h871A4ABC85E44AD384AA4AEB836C4B02822A4B1980E44B307F9C4B477E504B5D ),
    .INIT_0A ( 256'h900E49F68F054A0F8DF54A288CDF4A428BC24A5A8AA04A7389784A8B884C4AA4 ),
    .INIT_0B ( 256'h97244926966449409598495A94C3497493E3498E92FB49A8920949C2910F49DC ),
    .INIT_0C ( 256'h9B5B48579B0648709AA2488A9A2E48A399AD48BD991E48D7988248F197D9490B ),
    .INIT_0D ( 256'h9BC647939BF247AB9C0D47C39C1847DB9C1247F39BFD480C9BD748249BA1483D ),
    .INIT_0E ( 256'h985246DE98F146F39983470A9A0747209A7E47369AE7474D9B4147649B8B477B ),
    .INIT_0F ( 256'h91D4463592C5464993AE465E948D467395634688962F469D96F146B297A746C8 ),
    .INIT_10 ( 256'h894F45958A7445A98B9545BD8CB045D08DC545E48ED345F88FDB460C90DB4620 ),
    .INIT_11 ( 256'h7F8144FC80C8450F820C4522834C45358488454885C0455B86F4456F88244582 ),
    .INIT_12 ( 256'h74EB44677645447A779E448C78F5449F7A4944B17B9B44C47CEB44D77E3844EA ),
    .INIT_13 ( 256'h69DD43D36B4343E56CA843F86E0C440A6F6E441D70D0442F72304442738E4454 ),
    .INIT_14 ( 256'h5E95433D5FFF4350616A436362D34375643D438865A6439B670E43AD687643C0 ),
    .INIT_15 ( 256'h534442A354AD42B7561642CA578042DD58EA42F15A5543045BC043175D2A432A ),
    .INIT_16 ( 256'h481B4203497C42174ADE422C4C4242404DA742544F0D42685074427C51DB4290 ),
    .INIT_17 ( 256'h3D5341583EA4416E3FF84184414E419A42A641AF440141C4455D41D946BB41EE ),
    .INIT_18 ( 256'h333A40A1347040B935AA40D036E840E7382A40FE397041153AB8412C3C044142 ),
    .INIT_19 ( 256'h2A463FDB2B4F3FF42C5F400E2D7540272E9240402FB4405830DC407132084089 ),
    .INIT_1A ( 256'h23303F0B23F03F2524BC3F3F25913F5926713F7427593F8E284B3FA729453FC1 ),
    .INIT_1B ( 256'h1EF93E401F4E3E591FB23E7220263E8C20A73EA521363EBF21D23ED9227B3EF3 ),
    .INIT_1C ( 256'h1E8E3D7E1E623D961E473DAD1E3C3DC51E423DDD1E573DF51E7D3E0E1EB33E27 ),
    .INIT_1D ( 256'h22023CCD21633CE220D13CF8204D3D0D1FD63D231F6D3D3A1F133D501EC93D67 ),
    .INIT_1E ( 256'h28803C2B278F3C3F26A63C5225C73C6624F13C7A24253C8E23633CA322AD3CB8 ),
    .INIT_1F ( 256'h31063B992FE03BAA2EBF3BBC2DA43BCE2C903BE02B813BF22A793C0529793C18 ),
    .INIT_20 ( 256'h3AD33B1A398C3B2838493B3737093B4635CC3B5634943B6633603B7732303B88 ),
    .INIT_21 ( 256'h456A3ABF440F3AC742B63AD0415F3ADB400B3AE63EB93AF23D693AFE3C1D3B0C ),
    .INIT_22 ( 256'h50773AB94F113AB44DAC3AB14C483AB04AE63AB049843AB148253AB446C63AB9 ),
    .INIT_23 ( 256'h5BBF3B0C5A553AFE58EB3AF257813AE656173ADB54AE3AD053463AC751DE3ABF ),
    .INIT_24 ( 256'h000000000000000000000000000000000000000000000000000000005D2A3B1A ),
    .INIT_25 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_26 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_27 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_28 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_29 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_2F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_30 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_31 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_32 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_33 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_34 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_35 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_36 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_37 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_38 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_39 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3A ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3B ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3C ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3D ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3E ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_3F ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RSTTYPE ( "SYNC" ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram  (
    .REGCEA(N1),
    .CLKA(clka),
    .ENB(N1),
    .RSTB(N1),
    .CLKB(N1),
    .REGCEB(N1),
    .RSTA(N1),
    .ENA(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ena_array [6]),
    .DIPA({N1, N1, N1, N1}),
    .WEA({N1, N1, N1, N1}),
    .DOA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<15> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<14> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<13> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<12> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<11> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<10> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<9> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<8> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<7> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<5> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<3> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.ram_douta<0> }),
    .ADDRA({addra[9], addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1, N1}),
    .ADDRB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DIB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DOPA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED }),
    .DIPB({N1, N1, N1, N1}),
    .DOPB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED }),
    .DOB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[2].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED }),
    .WEB({N1, N1, N1, N1}),
    .DIA({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1})
  );
  RAMB16BWER #(
    .DATA_WIDTH_A ( 9 ),
    .DATA_WIDTH_B ( 9 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "FALSE" ),
    .EN_RSTRAM_B ( "FALSE" ),
    .INITP_00 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_01 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_02 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_03 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_04 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_05 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'hB8FD0AE85FD3B6BD0EA86994C67F246A8456E542482EAC1A110677F2DEDF45CB ),
    .INIT_01 ( 256'h81738F5AA441BF29DF1005F830E060C994B1CC9A0883486C8B56D23F1C296913 ),
    .INIT_02 ( 256'h6D12D6F84DDED1C463AA0290AD75635B2441F127C70DA6F38FD97FBF78A6798C ),
    .INIT_03 ( 256'h3693A77C2666B34F4E38F921B3097DF157D942C13CA9479062778E5EC945132B ),
    .INIT_04 ( 256'hB4E092CC76B85FA44F90477C45684B535A3E712A9115BCFFF1EA30D47BBFD2A9 ),
    .INIT_05 ( 256'h0110A7FE4EEBF8D8A4C653B304A0B98D707A2B67E954AB41702E3A1B0907DCF4 ),
    .INIT_06 ( 256'h553AEB2781151702ADEF44DDDCCA74B70DA5A7924380DF6D7C5B1B48BB365D23 ),
    .INIT_07 ( 256'hD0716F5D0C48A8354321DD0D77F90FE6A7D23EBFD4AC6A99008695732B60C04D ),
    .INIT_08 ( 256'hC1CC88B54C9E0C87C970825A3844EB2E9C184A03F5ED9FD846C3EBAE8E9A3085 ),
    .INIT_09 ( 256'h305C64428E28AE0EC6F4D5DADCC0DBA7D38EC575B05C9543752B4F1324FBF5E3 ),
    .INIT_0A ( 256'hFDF412DC18C30DABF292C6798B604146E72C7E1308F983DFF1C552AAA890F176 ),
    .INIT_0B ( 256'hFA59E344C22F981A630524EFD9DA82C41EADAD972E80A16A06535B3BA124D70C ),
    .INIT_0C ( 256'hE49529826B6FA95CE4491A354B22780EA0FBC2E7DED3F5BF04AB0D970F82096E ),
    .INIT_0D ( 256'h46C0ACAD119B7588D87539639850F63E532BAD1905065CF3AFE101CE4FBB9BA8 ),
    .INIT_0E ( 256'hADED16DA80C7EAB454A0BE8D297B9468FE556942D32F3D1DA70A10F778E5E0D2 ),
    .INIT_0F ( 256'hB8330A1E5F08B5F30EDE69C9C5B424A0848CE5774863AB4F103B7628DD144501 ),
    .INIT_10 ( 256'h80A98F90A477BF5EDF46052E30165FFE93E7CCCF08B848A28B8BD2751C5F6949 ),
    .INIT_11 ( 256'h6D47D62E4C14D1FA63DF02C5ACAB63912477F05DC642A6288E0F7FF578DB79C2 ),
    .INIT_12 ( 256'h36C8A7B2269BB3844E6DF956B33F7D27570F42F73CDE47C662AD8E94C97A1361 ),
    .INIT_13 ( 256'hB516920276EE60DA50C647B2459D4B895A74715F924ABC35F120300A7BF4D3DE ),
    .INIT_14 ( 256'h0246A7334F21F90EA5FB53E905D6B9C370B02B9DE98AAB7771633B50093DDC29 ),
    .INIT_15 ( 256'h5670EB5D814A1737AE254512DC0075ED0EDAA8C843B5DFA37D901C7EBC6B5E59 ),
    .INIT_16 ( 256'hD1A66F920D7EA96A4456DE43772F0F1BA7083EF5D4E16ACE00BB96A82B95C082 ),
    .INIT_17 ( 256'hC10189EA4CD30CBCC9A682903879EC649C4E4A38F6239F0E46F9EBE48FCF30BB ),
    .INIT_18 ( 256'h309164778E5DAE43C629D510DCF6DBDDD4C3C5AAB092967975614F492431F519 ),
    .INIT_19 ( 256'hFD29121018F80DDFF2C7C6AE8B94417BE7617E48082E8314F1FA53E0A8C5F1AB ),
    .INIT_1A ( 256'hFA8BE376C262984D63382422D90D81F71EE1ADCB2EB4A19E06875B70A158D740 ),
    .INIT_1B ( 256'hE3B929A86B96A985E37319604B4E783B9F28C115DE02F4EF04DB0DC70FB3089F ),
    .INIT_1C ( 256'h463BAC45114D7552D752384D9845F63B5230AD2405175B08AFF900EA4FDA9BCA ),
    .INIT_1D ( 256'h453BAE4E17608173EC855696C1A893B9FECA68DAD3EA3DF9A6080F177824DF30 ),
    .INIT_1E ( 256'h54F7A50DF9224F38A74D02625E76BC8B1C9F7DB3DFC743DBA8EF0E027515DC28 ),
    .INIT_1F ( 256'h477B509460AE76C793DFB5F8DC1009293B407158AB70E9872B9E71B4B9CB05E1 ),
    .INIT_20 ( 256'hF9DD4EF6B3102629A743365DD3777B9130ABF1C5BCE092FA71145A2E4C484561 ),
    .INIT_21 ( 256'h01646379D1904CA6D6BC6DD313EAC9018E19623147493C61427957927DAAB3C3 ),
    .INIT_22 ( 256'h051BDF2FBE43A4568F6A807E799278A67FBB8ECFA6E4C6F9F00E24236338AC4E ),
    .INIT_23 ( 256'h69ED0E00B5125E250A37B84A685D1C70D2828B9548A808BBCBCE93E15FF53008 ),
    .INIT_24 ( 256'hBEC354D6EAE980FB160EAD214533DD467659106BAB7E4790E5A383B524C8C5DA ),
    .INIT_25 ( 256'h3889D79D75B211C6ACDA46EEDF0278160F29A63D3D50D3636977FE8A949D29B0 ),
    .INIT_26 ( 256'h1927E33FA9566B6D2984E49B9BB24FC801DEAFF45B0A0520AD35524AF65F9874 ),
    .INIT_27 ( 256'h249163AB98C5C2DFE3FAFA14092E0F470D61047AF494DEADC2C69FDE78F74B0F ),
    .INIT_28 ( 256'hC6FEF2160D2E1846125EFD77D790A1A95BC206DBA1F52E0FAD281E42815DD977 ),
    .INIT_29 ( 256'hD5A0C6B4AEC98EDE64F33008F11EA8335249F15F8375088B7EA2E7B841CF8BE7 ),
    .INIT_2A ( 256'h8268C97B0C8D4CA088B4C1C7F5DA24ED4F0175149528B03BC54FD463DB77DC8C ),
    .INIT_2B ( 256'hDE3E4450A9630C756F88D09B30AD8FC0EBD246E59FF7F50A4A1D9C2FEB423855 ),
    .INIT_2C ( 256'h440EAD2217358149EB5C566FC0822B9596A800BB6ACED4E13EF3A7060F19772B ),
    .INIT_2D ( 256'h53C4A5DAF8EF4F05A71A012F5E44BC591B6E7C82DF9743ABA8BF0ED374E7DCFB ),
    .INIT_2E ( 256'h474650605F79769292ABB4C3DCDC09F43A0C7024AB3BE9532B6A7080B99705AD ),
    .INIT_2F ( 256'hF9A74EC0B3DA26F4A70E3628D2427B5C3076F190BCAA92C571DF5AF94B13452C ),
    .INIT_30 ( 256'h022E6344D15A4C70D6876D9E13B5C9CC8EE362FB47133C2B4243575C7D75B38E ),
    .INIT_31 ( 256'h05E6DFF9BF0DA4218F358148795D78717F858E9AA6AEC6C3F0D824ED6303AC18 ),
    .INIT_32 ( 256'h69B70ECAB5DD5FEF0A02B81569271C3AD24D8B6048730886CC9993AC5FBF30D2 ),
    .INIT_33 ( 256'hBF8D54A0EAB380C616D8ADEB45FEDD1077231136AC48485BE56D84802492C6A5 ),
    .INIT_34 ( 256'h3953D868757C1190ADA447B8E0CC78E010F4A7073D1BD32E6941FF549467297A ),
    .INIT_35 ( 256'h1AF1E409A9216B38294FE4669B7C509301A9B0BF5CD406EAADFF5315F72A993E ),
    .INIT_36 ( 256'h245B63759890C3AAE3C4FADE09F80F120D2B0545F55EDE77C290A0A978C14BD9 ),
    .INIT_37 ( 256'hC6C9F2E00DF818101229FD41D75AA1735B8C06A6A1BF2ED9ADF31E0D8227D941 ),
    .INIT_38 ( 256'hD56AC57FAE948DA863BD30D3F1E8A7FD5213F129833F07567E6CE783419A8BB1 ),
    .INIT_39 ( 256'h8232C9450C584C6B887EC091F4A424B84FCB75DF95F2B006C51AD32EDB42DC56 ),
    .INIT_3A ( 256'hDD08431BA82D0C406F52D06530778E8AEB9D46AF9EC2F5D44AE79CFAEB0C381F ),
    .INIT_3B ( 256'h44D9ADEC17008113EB265539C04C2B5F957200856A98D4AB3DBEA6D00FE376F6 ),
    .INIT_3C ( 256'h538EA4A4F8BA4ECFA7E501FA5D0FBB241B387C4DDF614275A78A0D9E74B1DCC5 ),
    .INIT_3D ( 256'h46114F2A5F43755C9275B48EDCA609BE3AD670EEAA06E91D2A34704BB9610478 ),
    .INIT_3E ( 256'hF9714E8BB3A426BEA7D836F2D20C7B263040F05BBC75918F71A95AC34BDD45F7 ),
    .INIT_3F ( 256'h02F8630ED1244D3BD6516D68137FC9968EAE62C547DD3CF5420E57267D3FB358 ),
    .INIT_A ( 36'h000000000 ),
    .INIT_B ( 36'h000000000 ),
    .INIT_FILE ( "NONE" ),
    .RSTTYPE ( "SYNC" ),
    .RST_PRIORITY_A ( "CE" ),
    .RST_PRIORITY_B ( "CE" ),
    .SIM_COLLISION_CHECK ( "ALL" ),
    .SIM_DEVICE ( "SPARTAN6" ),
    .SRVAL_A ( 36'h000000000 ),
    .SRVAL_B ( 36'h000000000 ),
    .WRITE_MODE_A ( "WRITE_FIRST" ),
    .WRITE_MODE_B ( "WRITE_FIRST" ))
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram  (
    .REGCEA(N1),
    .CLKA(clka),
    .ENB(N1),
    .RSTB(N1),
    .CLKB(N1),
    .REGCEB(N1),
    .RSTA(N1),
    .ENA(\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_ena ),
    .DIPA({N1, N1, N1, N1}),
    .WEA({N1, N1, N1, N1}),
    .DOA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<7> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<6> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<5> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<4> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<3> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<2> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<1> , 
\U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.ram_douta<0> }),
    .ADDRA({addra[10], addra[9], addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1}),
    .ADDRB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DIB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DOPA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<0>_UNCONNECTED }),
    .DIPB({N1, N1, N1, N1}),
    .DOPB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPB<0>_UNCONNECTED }),
    .DOB({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<31>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<30>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<29>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<28>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<27>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<26>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<25>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<24>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<23>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<22>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<21>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<20>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<19>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<18>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<17>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<16>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<15>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<14>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<13>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<12>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<11>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<10>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<9>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<8>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<7>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<6>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<5>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<4>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<1>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOB<0>_UNCONNECTED }),
    .WEB({N1, N1, N1, N1}),
    .DIA({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1})
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
