

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /ROM_39x240_70Vx110V_N20_tb/status
      waveform add -signals /ROM_39x240_70Vx110V_N20_tb/ROM_39x240_70Vx110V_N20_synth_inst/bmg_port/CLKA
      waveform add -signals /ROM_39x240_70Vx110V_N20_tb/ROM_39x240_70Vx110V_N20_synth_inst/bmg_port/ADDRA
      waveform add -signals /ROM_39x240_70Vx110V_N20_tb/ROM_39x240_70Vx110V_N20_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
