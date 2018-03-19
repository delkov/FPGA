

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /ROM_7x200_NN0_S13_65Vx100V_tb/status
      waveform add -signals /ROM_7x200_NN0_S13_65Vx100V_tb/ROM_7x200_NN0_S13_65Vx100V_synth_inst/bmg_port/CLKA
      waveform add -signals /ROM_7x200_NN0_S13_65Vx100V_tb/ROM_7x200_NN0_S13_65Vx100V_synth_inst/bmg_port/ADDRA
      waveform add -signals /ROM_7x200_NN0_S13_65Vx100V_tb/ROM_7x200_NN0_S13_65Vx100V_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
