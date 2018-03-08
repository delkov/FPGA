

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /ROM_39x120_16b_tb/status
      waveform add -signals /ROM_39x120_16b_tb/ROM_39x120_16b_synth_inst/bmg_port/CLKA
      waveform add -signals /ROM_39x120_16b_tb/ROM_39x120_16b_synth_inst/bmg_port/ADDRA
      waveform add -signals /ROM_39x120_16b_tb/ROM_39x120_16b_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
