clear all
clc

n =200000000;
global M_1
M_1=randn(1,n);


delay_ms(1000)
tic

while j<2
	M_1=check();
	j=j+1;
end

toc
delay_ms(1000)
clear all




function M_1 = check()
	global M_1
	M_1 = M_1.^2;
end


function delay_ms(seconds)
    tic;
    while toc < seconds/1000
    end
end

