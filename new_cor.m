clear; clc;

% x=[0 0 0 0 1 2 3 0 0];
% y=[1 2 3 0 0 0 0 0 0]; %Here x has a lag of 4
% [c,lags]=xcorr(x,y) %peak at index=13=9+4
% [value, id]=max(c)
% lag=lags(id)
% % lag=lags()

% y=circshift(y,lag)


color_limit=15;
M=dlmread('real_corr_test.txt');
M_2=M;
% M=M(:,100:200);
figure
imagesc(M,[0 color_limit]);

for i=2:5
	x=M(i,:);
	y=M(i+1,:);
	[c,lags]=xcorr(x,y);
	[~,id]=max(abs(c));%(1:find(lags==0)));
	% [maxC,I]=max(c(1:end));
	lag = lags(id)
	% if lag
		% disp(lag)
	% end
	% disp('new lag')
	% PhDiff = round(phdiffmeasure(x, y)*180/pi)

	M(i+1,:)=circshift(M(i+1,:), lag);
	% M(i+1,:)=circshift(M(i+1,:), PhDiff);

	disp('fin_delay')
	% finddelay(x,y)
end


figure
imagesc(M,[0 color_limit]);

% figure
% imagesc(M_2,[0 color_limit]);

% M_2(i+1,:)=alignsignals(M(i+1,:),M(i)); - the same
