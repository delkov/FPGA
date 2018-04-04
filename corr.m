% clear; clc

% M=dlmread('real_corr_test.txt');
% down_limit=1;
% up_limit=130;

% color_limit=15;

% M=M(:,down_limit:up_limit);
% % M_2=zeros(size(M));

% a=M(5,:);
% M(5,:)=circshift(M(5,:), 10);
% figure
% imagesc(M,[0 color_limit]);

% [c,lags]=xcorr(a,M(5,:));
% [maxC,I]=max(c);
% lag=lags(I)
% disp('aa')
% M(5,:)=circshift(M(5,:), [0 lag]);

% figure
% imagesc(M,[0 color_limit]);



clear; clc
M=dlmread('20_Mar_2018_17_05_58.txt');
[size_y, size_x]=size(M);
from_limit=1;
to_limit=120;%size_x;
% temp_M=M(3,end:-1:1);

% to_limit=size_x-find(temp_M>0,1,'first')+1;
% M(3,to_limit+1)

% to_limit=size_x


color_limit=15;
% to_limit=120;

figure
imagesc(M,[0 color_limit]);
% pause(10)
M=M(:,from_limit:to_limit);




find(M(3,:)==0,1,'first')

total=0;
for i=1:7

	a=M(i,:);
	b=M(i+1,:);

% find(a<3,1,'first');
% find(b<3,1,'first');

% figure

% imagesc([a; b])
	% a(1:5)
	% b(1:5)

% [c,lags]=xcorr(b,a,'coeff');               % compute cross correlation; keep lags vector
% [~,iLag]=max(c)%/end))  % find the max in one-sided



	[lags,c]=CXCORR(a,b);
	% stem(lags,c)
	[~,idx]=max(c); %% can analyze only half
	total=[total lags(idx)];
	M(i+1,:)=circshift(M(i+1,:),[0 lags(idx)]);

% figure
% imagesc([M(i,:); M(i+1,:)])

end

disp(total)

% figure
figure
imagesc(M,[0 color_limit]);








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
