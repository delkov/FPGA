
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /ROM_9x240_70Vx110V_N0_tb/status
      waveform add -signals /ROM_9x240_70Vx110V_N0_tb/ROM_9x240_70Vx110V_N0_synth_inst/bmg_port/CLKA
      waveform add -signals /ROM_9x240_70Vx110V_N0_tb/ROM_9x240_70Vx110V_N0_synth_inst/bmg_port/ADDRA
      waveform add -signals /ROM_9x240_70Vx110V_N0_tb/ROM_9x240_70Vx110V_N0_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
