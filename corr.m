% t = 1 : 1000;
% phaseshift= 2*pi/3;
% s1 = sin (2*pi*t/500);
% s2 = sin (2*pi*t/500+ phaseshift);                        
% figure(1); clf;
% plot (t,s1, t,s2);
% Axis_x = [-length(s1)+1 : 1 : length(s1)-1];               
% cross_corr = xcorr(s1,s2,'coeff');                       
% figure(2); clf;
% plot( Axis_x, cross_corr,'r');



clear; clc

M=dlmread('real_corr_test.txt');
down_limit=100;
up_limit=200;

% M=M(:,down_limit:up_limit);
% M_2=zeros(size(M));


% M(24,:)=circshift(M(24,:), 10);
figure
imagesc(M,[0 25]);

% for i=3:39
% 	a=M(i,:)
% 	b=M(i+1,:)
% 	[c,lags]=xcorr(a,b);
% 	% disp('new')
% 	[maxC,I]=max(c);
% 	lag = lags(I)
% 	if lag
% 		disp(lag)
% 	end
% 	M(i,:)=circshift(M(i,:), [0 lag]);
% end



% a=circshift(M(24,:),0)
% a=M(24,:);
% b=M(24,:);
% [c,lags]=xcorr(a,b);
% [maxC,I]=max(a);
% lag=lags(I)
% disp('aa')

% figure
% imagesc(M,[0 15]);


% [val,iLag]=max(c(find(lags==0):end))  % find the max in one-sided
% c(find(lags==0):end)
% [val,iLag]=max(c(find(lags==0):end))  % find the max in one-sided

for i=3:39
	% s1= M(i,:);
	% s2=circshift(s1, 8);
	% s2= M(i+1,:);
% s2=[0 0 0 1 1 1 1 1 2 3 4 5 0];
	[c,lags]=xcorr(M(i,:),M(i+1,:),'coeff');
	% disp('new')
	[maxC,I]=max(c);
	lag = lags(I)
	% s3=circshift(s2, lag);
	M(i+1,:)=circshift(M(i+1,:), lag);
end


figure
imagesc(M,[0 10]);

% s1
% s2
% s3


% s3=circshift(s2, (iLag-1));           % correct for the shift



% s1
% s2
% % s3


% disp('new')
% [maxC,I]=max(c)
% lag = lags(I)

% s3=circshift(s2, lag)           % correct for the shift

% plot(s1), hold on,plot(s2,'r')
% plot(s3,'g')  % show the two signals...
% [c,l]=xcorr(s1,s2);             % compute correl, save lags
% figure,plot(l,c)                % plot correlations vs lag



% [acor,lag] = xcorr(s2,s1);

% [~,I] = max(abs(acor));
% lagDiff = lag(I)