a=100*rand(1,300);
b=100*rand(1,300);
j=1;
tic
while j<10000
	[x,c]=CXCORR(a,b);
	j=j+1;
end
toc

function [x,c]=CXCORR(a,b)
	na=norm(a);
	nb=norm(b);
	a=a/na; %normalization
	b=b/nb;
	b_size=length(b);
	c=zeros(1,b_size);
	for k=1:b_size
	    c(k)=a*b';
	    b=[b(end),b(1:end-1)]; %circular shift
	end
	x=[0:length(b)-1]; %lags
end
