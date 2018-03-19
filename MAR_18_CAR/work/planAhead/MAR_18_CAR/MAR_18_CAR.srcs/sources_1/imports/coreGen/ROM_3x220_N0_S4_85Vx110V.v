////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: ROM_3x220_N0_S4_85Vx110V.v
// /___/   /\     Timestamp: Wed Mar  7 14:05:49 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/delkov/Documents/MOJO/_cg/ROM_3x220_N0_S4_85Vx110V.ngc /home/delkov/Documents/MOJO/_cg/ROM_3x220_N0_S4_85Vx110V.v 
// Device	: 6slx9tqg144-2
// Input file	: /home/delkov/Documents/MOJO/_cg/ROM_3x220_N0_S4_85Vx110V.ngc
// Output file	: /home/delkov/Documents/MOJO/_cg/ROM_3x220_N0_S4_85Vx110V.v
// # of Modules	: 1
// Design Name	: ROM_3x220_N0_S4_85Vx110V
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

module ROM_3x220_N0_S4_85Vx110V (
  clka, addra, douta
)/* synthesis syn_black_box syn_noprune=1 */;
  input clka;
  input [10 : 0] addra;
  output [15 : 0] douta;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
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
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED ;
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED ;
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
  wire \NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED ;
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
  VCC   XST_VCC (
    .P(N0)
  );
  GND   XST_GND (
    .G(N1)
  );
  RAMB16BWER #(
    .DATA_WIDTH_A ( 9 ),
    .DATA_WIDTH_B ( 9 ),
    .DOA_REG ( 0 ),
    .DOB_REG ( 0 ),
    .EN_RSTRAM_A ( "FALSE" ),
    .EN_RSTRAM_B ( "FALSE" ),
    .INITP_00 ( 256'h1F5A0A57D282F5E0A1D78A2DD622778A1FE03FC29D7227DC22DF4A297D7A0A08 ),
    .INITP_01 ( 256'hDD229F5E287D7A0B5F4283D782875E28B77889768AD5005F0A77223748A7D70A ),
    .INITP_02 ( 256'h56A2DD227DCA3DF082D7C282D5D7D7F5F0A097DA28D76237DA0FF02BD6897622 ),
    .INITP_03 ( 256'h9D6287F80FF0A7D889D628F7C20B5F0A87D680B5F4A0F5D28B75C88DD8A1F401 ),
    .INITP_04 ( 256'hD68A35D889DDA0F54017E29D622DDA29F58287D68295F0A0FD7828F5E28D7788 ),
    .INITP_05 ( 256'h000000000000000000000000000000000000000000000000000003D5F4A0A0F5 ),
    .INITP_06 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INITP_07 ( 256'h0000000000000000000000000000000000000000000000000000000000000000 ),
    .INIT_00 ( 256'h8FCA0FA18E790B52872C02077BE4F3C16AA0E1805763CC47412DB6162A020000 ),
    .INIT_01 ( 256'hFCAEB47B67491518BDE662B602869E573628CBFA5DCDECA078740148881D0CF3 ),
    .INIT_02 ( 256'h0A375FFAA5BDDD810946270B3AD14397405E34261FEE01B7DB81AE4B79163DE2 ),
    .INIT_03 ( 256'h5C0DD3D238958A59CB1CF8DE11A018620B23EAE5B7A67167182EAEF032B2A674 ),
    .INIT_04 ( 256'hAA78E145101238DF57AB6E767A417D0B75D5629E4267162FDBF693BD3B83D448 ),
    .INIT_05 ( 256'h967111438A1600E873B9E48B515CBB2D21FE83CFE19F3B6F903EDF0D29DC6DAA ),
    .INIT_06 ( 256'h2A3CB50F41E3CCB6578AE25E6C31F6057ED806AC8D7F1252962619F99ACB199E ),
    .INIT_07 ( 256'hCC1348E4C5B54587C659482BCDFD52D0D9A26175E948731BFDEE88C213959E68 ),
    .INIT_08 ( 256'hDB3417FF58CAA095ED613F2E96FBF2C85296B6641D338902F7D268A2DC725342 ),
    .INIT_09 ( 256'h22DCAE9D4A60F522AFE577A94B6D2D3119F611BC14822049351053D979A1A66B ),
    .INIT_0A ( 256'h19B38078F83D82021CC6CA89894C5C0E43D03C9249536A159DD6E3973C59A61A ),
    .INIT_0B ( 256'h2B0CE7DAAAA8737644421C0FFDDBE7A6DA71D73BDF05F2CE12973F5F7926C1ED ),
    .INIT_0C ( 256'hBAFC3BCEBEA14373CA465418E1EA70BB038C995E332ED1FF73CF199FC56E753D ),
    .INIT_0D ( 256'h41C5B6982A6C9F3F131388E7FDBA728EE8615E35D6084EDCC7AF4282BE563B29 ),
    .INIT_0E ( 256'h78A2017288430D148FE610B78F890C5B882D02007BD2F3A56B78E14B571ECCF2 ),
    .INIT_0F ( 256'hDBD1AE9B79643E2FFCFAB4C56791155EBE2B62F802C69E943763CC325D02ECD2 ),
    .INIT_10 ( 256'h1888AE4A330CA6CD0A905F52A515DDD9099D28613B2643EC41B235791F410109 ),
    .INIT_11 ( 256'hDB53931A3BE1D4A65C6BD23038F48AB7CA7AF83D11FF18C10B82EA44B70571C6 ),
    .INIT_12 ( 256'h8F93DF6429336C02AAD1E19F106C383957066DD17A9D7D67753161FB42C4158C ),
    .INIT_13 ( 256'h9644191F99F919D296AA11818957002C7301E3D551A9BB7C214E8320E1F23BC3 ),
    .INIT_14 ( 256'h721FFD44886713889FA6B5C241DACCED57FAE2FA6CEDF5DA7EC206A68C881267 ),
    .INIT_15 ( 256'h7164E19354C3CBF24320BE4E3B7CBBA93BD5BE01422CC8574E81D6AA5FD2E8F9 ),
    .INIT_16 ( 256'hE71AFD531C8C44C473FBAA31E8672B9D75D1C5061939736CD19F33D199020333 ),
    .INIT_17 ( 256'h5C4A8A88CAC61C058244F88280C119FFC13D797A3FB712F4F330DF6BD7A6DAE1 ),
    .INIT_18 ( 256'h2C9B4BD17709AF41F5794AB2AEEC2126A6613C9DE3D99D156A5249903CCD430C ),
    .INIT_19 ( 256'hF27296A23FD2ED02A03258631694DBC6A6F8792B535E35911FC513FA112F1964 ),
    .INIT_1A ( 256'h5298CCC548F2C51E444BC57847A5CCD25300DC2D685BF78988B71DE6B6145243 ),
    .INIT_1B ( 256'hF6CE6CFCE2295756CC8241AFB5DC2A089E351361888EFDBA73E7E913613FD96C ),
    .INIT_1C ( 256'hBBDA510CE43D736E009F8ACF11FF962E195E9A8C19BB96EA12188D4606737EA1 ),
    .INIT_1D ( 256'h7D787AB36DED5726385F1097E1CEAA056D3B2971DFA68FDB3B0FE142837621A8 ),
    .INIT_1E ( 256'h189D11DCF81ACB598A9738D6D2155C53D4923BD0930EDB4C158942C66202753D ),
    .INIT_1F ( 256'h43FF3B34276B09A1DDD9A5105F490A82A6BC32F6AE31186D71A9B7E5EA220B60 ),
    .INIT_20 ( 256'h9EE402136242BE7215A267D2B402FC333D647996AEC8DBFB012E1F61349540CA ),
    .INIT_21 ( 256'hF30F7B3C026887950CC28EEE0F1B8F480C7588A201D078FDEC2B5D59CB8737B5 ),
    .INIT_22 ( 256'h4E43D6715E9EE8CB72F9FD268852137F9FAC2AD8B6054131CC5E578AE1B66BE3 ),
    .INIT_23 ( 256'hD145337899AA03DC700DE13E546FCA9F43CFBEFE3B2DBA5C3B8BBEB942E8C716 ),
    .INIT_24 ( 256'hF2D2DF0DD748DA83E6BDFDF61C2F4467739EAAD5E70B2B417576C4AB19DF7312 ),
    .INIT_25 ( 256'h6AFA49373C7443B25CF0892ECA671CA681E5F823806219A0C1DE791C3E591295 ),
    .INIT_26 ( 256'h207B14AE11E21A162D4B4B8177B7AFEEF5264A5EAE9722D1A60B3C46E3819DBD ),
    .INIT_27 ( 256'h89A11ECAB6F3521DF24897743FA0EDCDA0FA58281757DB86A6B679E653183549 ),
    .INIT_28 ( 256'h73DEEAE661F2D9025216CD2D4947C6634580C5A048C1CCE45307DC2C6852F779 ),
    .INIT_29 ( 256'h000000000000000000000000000000000000000000002AF29EE613DE88DDFDDD ),
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
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram  (
    .REGCEA(N1),
    .CLKA(clka),
    .ENB(N1),
    .RSTB(N1),
    .CLKB(N1),
    .REGCEB(N1),
    .RSTA(N1),
    .ENA(N0),
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
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<8>_UNCONNECTED , douta[7]
, douta[6], douta[5], douta[4], douta[3], douta[2], douta[1], douta[0]}),
    .ADDRA({addra[10], addra[9], addra[8], addra[7], addra[6], addra[5], addra[4], addra[3], addra[2], addra[1], addra[0], N1, N1, N1}),
    .ADDRB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DIB({N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1, N1}),
    .DOPA({
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<3>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<2>_UNCONNECTED , 
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[0].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOPA<1>_UNCONNECTED , 
douta[8]}),
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
    .INIT_00 ( 256'h391F381F371F371F361F351F341F331F331F321F311F301F301F2F1F2E1F0000 ),
    .INIT_01 ( 256'h44214321432142214120412040203F203F203E203D203C203C203B203A203A1F ),
    .INIT_02 ( 256'h4C234C224B224B224B224A224A22492249224822482147214621462145214521 ),
    .INIT_03 ( 256'h4D254D244D244D244D244D244E244E244E244D234D234D234D234D234D234C23 ),
    .INIT_04 ( 256'h452646264726472648264826492649264A254A254B254B254B254C254C254C25 ),
    .INIT_05 ( 256'h3A283B283C283D273D273E273F273F2740274127412742274327432744264526 ),
    .INIT_06 ( 256'h2E292F2930293029312932293329332934283528362837283728382839283A28 ),
    .INIT_07 ( 256'h222B232A232A242A252A262A262A272A282A292A292A2A2A2B292C292D292D29 ),
    .INIT_08 ( 256'h172C182C182C192C192C1A2C1B2B1B2B1C2B1D2B1E2B1E2B1F2B202B202B212B ),
    .INIT_09 ( 256'h102E102E102E102E112D112D122D122D132D132D142D142D152D152C162C162C ),
    .INIT_0A ( 256'h103010300F300F300F2F0F2F0F2F0F2F0F2F0F2F0F2F0F2F0F2E0F2E0F2E0F2E ),
    .INIT_0B ( 256'h1832173117311631163115311431143113311331123112301230113011301030 ),
    .INIT_0C ( 256'h2333233322332133203320331F321E321E321D321C321B321B321A3219321932 ),
    .INIT_0D ( 256'h30342F342E342D342D342C342B342A3429342934283427332633263325332433 ),
    .INIT_0E ( 256'h3C363B363A363A36393538353735373536353535343533353335323531353034 ),
    .INIT_0F ( 256'h463746374537453744374337433742374137413640363F363F363E363D363C36 ),
    .INIT_10 ( 256'h4D394D394D394C394C394C394B394B384B384A384A3849384938483848384738 ),
    .INIT_11 ( 256'h4B3B4C3B4C3B4C3B4D3B4D3B4D3A4D3A4D3A4D3A4E3A4E3A4E3A4D3A4D3A4D39 ),
    .INIT_12 ( 256'h433D433D443D453D453C463C473C473C483C483C493C493C4A3C4A3B4B3B4B3B ),
    .INIT_13 ( 256'h373E383E393E3A3E3A3E3B3E3C3E3D3E3D3E3E3D3F3D3F3D403D413D413D423D ),
    .INIT_14 ( 256'h2A3E2B3E2C3E2D3E2D3E2F3E303E303E313E323E333E333E343E353E363E373E ),
    .INIT_15 ( 256'h1E3D1F3D203D203D213D223D233D233D243D253E263E263E273E283E293E293E ),
    .INIT_16 ( 256'h143B143B153B163B163B173C173C183C193C193C1A3C1B3C1B3C1C3C1D3D1E3D ),
    .INIT_17 ( 256'h0F390F390F390F3A0F3A0F3A103A103A103A113A113A123A123B123B133B133B ),
    .INIT_18 ( 256'h123712371138113810381038103810380F380F380F380F390F390F390F390F39 ),
    .INIT_19 ( 256'h1B361B361A361936193618361836173616361637153715371437143713371337 ),
    .INIT_1A ( 256'h273426342634253524352335233522352135203520351F351E351E351D361C36 ),
    .INIT_1B ( 256'h3333333332333133303330332F332E342D342D342C342B342A34293429342834 ),
    .INIT_1C ( 256'h3F313F323E323D323D323C323B323A323A323932383237323733363335333433 ),
    .INIT_1D ( 256'h4930493048304830473047304630453145314431433143314231413141314031 ),
    .INIT_1E ( 256'h4E2E4E2E4D2E4D2E4D2E4D2E4D2F4D2F4C2F4C2F4C2F4B2F4B2F4B2F4A304A30 ),
    .INIT_1F ( 256'h492C4A2C4A2C4B2C4B2C4B2D4C2D4C2D4C2D4D2D4D2D4D2D4D2D4D2D4D2E4E2E ),
    .INIT_20 ( 256'h3F2A402B412B412B422B432B432B442B452B452B462B462B472C482C482C492C ),
    .INIT_21 ( 256'h332934293529362937293729382A392A3A2A3A2A3B2A3C2A3C2A3D2A3E2A3F2A ),
    .INIT_22 ( 256'h27282828292829282A282B282C282D282D282E282F2930293029312932293329 ),
    .INIT_23 ( 256'h1B261C261D261E261E271F272027202721272227232723272427252726272628 ),
    .INIT_24 ( 256'h122412251325132514251425152516251625172517261826192619261A261B26 ),
    .INIT_25 ( 256'h0F220F230F230F230F230F230F230F230F230F24102410241024112411241224 ),
    .INIT_26 ( 256'h1421142113211321122112211121112110221022102210220F220F220F220F22 ),
    .INIT_27 ( 256'h1E1F1E1F1D1F1C201B201B201A20192019201820182017201620162015211521 ),
    .INIT_28 ( 256'h2A1E291E291E281F271F261F261F251F241F231F231F221F211F201F201F1F1F ),
    .INIT_29 ( 256'h000000000000000000000000000000000000000000002E1E2D1E2D1E2C1E2B1E ),
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
  \U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram  (
    .REGCEA(N1),
    .CLKA(clka),
    .ENB(N1),
    .RSTB(N1),
    .CLKB(N1),
    .REGCEB(N1),
    .RSTA(N1),
    .ENA(N0),
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
\NLW_U0/xst_blk_mem_generator/gnativebmg.native_blk_mem_gen/valid.cstr/ramloop[1].ram.r/s6_init.ram/SP.SIMPLE_PRIM18.ram_DOA<7>_UNCONNECTED , 
douta[15], douta[14], douta[13], douta[12], douta[11], douta[10], douta[9]}),
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
