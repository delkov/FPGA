clear; clc

baud_rate=500000;

buffer_size=10000;
% seriallisrt()



s = serial('/dev/ttyACM0','BaudRate',baud_rate,'DataBits',8,'InputBufferSize',buffer_size); 
fopen(s);


fread(s, 1000,'uint8')