

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /ROM_9x210_N0_S13_65Vx85V_tb/status
      waveform add -signals /ROM_9x210_N0_S13_65Vx85V_tb/ROM_9x210_N0_S13_65Vx85V_synth_inst/bmg_port/CLKA
      waveform add -signals /ROM_9x210_N0_S13_65Vx85V_tb/ROM_9x210_N0_S13_65Vx85V_synth_inst/bmg_port/ADDRA
      waveform add -signals /ROM_9x210_N0_S13_65Vx85V_tb/ROM_9x210_N0_S13_65Vx85V_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
