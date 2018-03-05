
 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"


      waveform add -signals /CUT_9x240_N_25_tb/status
      waveform add -signals /CUT_9x240_N_25_tb/CUT_9x240_N_25_synth_inst/bmg_port/CLKA
      waveform add -signals /CUT_9x240_N_25_tb/CUT_9x240_N_25_synth_inst/bmg_port/ADDRA
      waveform add -signals /CUT_9x240_N_25_tb/CUT_9x240_N_25_synth_inst/bmg_port/DOUTA
console submit -using simulator -wait no "run"
