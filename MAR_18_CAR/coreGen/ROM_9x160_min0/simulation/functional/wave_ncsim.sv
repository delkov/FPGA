

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /ROM_9x160_min0_tb/status
      waveform add -signals /ROM_9x160_min0_tb/ROM_9x160_min0_synth_inst/bmg_port/CLKA
      waveform add -signals /ROM_9x160_min0_tb/ROM_9x160_min0_synth_inst/bmg_port/ADDRA
      waveform add -signals /ROM_9x160_min0_tb/ROM_9x160_min0_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
