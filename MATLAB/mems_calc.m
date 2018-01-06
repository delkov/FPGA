clear all
clc

m=4;
n = 120; % how many points

t = 0:2*pi/(n/m-1):2*pi;

vmax=140;
vbias=80;
phase_shift=pi; % in radians

delta = vmax-vbias;

X_plus = repmat( round(vbias+sin(t) * delta), 1, m)
X_minus = repmat(round(vbias+sin(t+phase_shift) * delta), 1, m);

Y_plus=round(   linspace(vbias-delta,vbias+delta,n) )
Y_minus=round(  linspace(vbias+delta,vbias-delta,n) )

for i=1:length(X_plus)
    x_plus(i)=strcat('rom_data[',num2str(4*i-2),']={8''b00000000,8''b', strjoin(string(fliplr(de2bi(X_plus(i),8))),''),',8''b00000000};');
end

for i=1:length(X_minus)
    x_minus(i)=strcat('rom_data[',num2str(4*i-1),']={8''b00000001,8''b', strjoin(string(fliplr(de2bi(X_minus(i),8))),''),',8''b00000000};');
end

for i=1:length(Y_plus)
    y_plus(i)=strcat('rom_data[',num2str(4*i),']={8''b00000010,8''b', strjoin(string(fliplr(de2bi(Y_plus(i),8))),''),',8''b00000000};');
end

for i=1:length(Y_minus)
    y_minus(i)=strcat('rom_data[',num2str(4*i+1),']={8''b00010011,8''b', strjoin(string(fliplr(de2bi(Y_minus(i),8))),''),',8''b00000000};');
end



disp([x_plus'; x_minus'; y_plus'; y_minus';]);

