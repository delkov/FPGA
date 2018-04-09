function [x,c]=CXCORR(a,b)
	% na=norm(a);
	% nb=norm(b);
	% a=a/na; %normalization
	% b=b/nb;
	b_size=length(b);
	c=zeros(1,b_size);
	for k=1:b_size
	    c(k)=a*b';
	    b=[b(end),b(1:end-1)]; %circular shift
	end
	x=[0:length(b)-1]; %lags
end
