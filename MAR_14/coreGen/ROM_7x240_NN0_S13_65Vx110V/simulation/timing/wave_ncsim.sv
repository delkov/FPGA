
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /ROM_7x240_NN0_S13_65Vx110V_tb/status
      waveform add -signals /ROM_7x240_NN0_S13_65Vx110V_tb/ROM_7x240_NN0_S13_65Vx110V_synth_inst/bmg_port/CLKA
      waveform add -signals /ROM_7x240_NN0_S13_65Vx110V_tb/ROM_7x240_NN0_S13_65Vx110V_synth_inst/bmg_port/ADDRA
      waveform add -signals /ROM_7x240_NN0_S13_65Vx110V_tb/ROM_7x240_NN0_S13_65Vx110V_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
