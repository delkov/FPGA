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
M=dlmread('real_corr_test.txt');
from_limit=70;
to_limit=200;
color_limit=15;

M=M(:,from_limit:to_limit);

% % M_2=zeros(size(M));

% % a=M(5,:);
% % M(5,:)=circshift(M(5,:), 10);
% backup=M(6,:);
% M(6,:)=circshift(M(6,:), 4);
% % figure
% % imagesc(M,[0 color_limit]);

% % for i=1:9
% % 	[c,lags]=xcorr(M(i,:),M(i+1,:));
% % 	[maxC,I]=max(c);
% % 	lag=lags(I)
% % 	disp('aa')
% % 	M(i+1,:)=circshift(M(i+1,:), [0 lag]);
% % end

% % a=M(10,:);
% a=backup;

% [c,lags]=xcorr(a,M(6,:));
% [maxC,I]=max(c);
% lag=lags(I)
% disp('aa')
% M(6,:)=circshift(M(6,:), [0 lag]);


figure
imagesc(M,[0 color_limit]);

% M(1,:)=circshift(M(1,:),[0 -10]);

figure
imagesc(M,[0 color_limit]);


for i=2:5
	a=M(i,:);
	b=M(i+1,:);
	[c,lags]=xcorr(b,a);
	% disp('new')
	[~,I]=max(abs(c));%(1:find(lags==0)));
	% [maxC,I]=max(c(1:end));
	lag = lags(I);
	if lag
		disp(lag)
	end
	disp('new lag')
	PhDiff = phdiffmeasure(a, b)

	% M(i+1,:)=circshift(M(i+1,:), [0 -lag]);
end

	% a=M(1,:);

	% b=circshift(M(4,:), [0 2]);
	% [c,lags]=xcorr(b,a);
	% % disp('new')
	% [maxC,I]=max(c);%(1:find(lags==0)));
	% % [maxC,I]=max(c(1:end));
	% lag = lags(I)
	% if lag
	% 	disp(lag)
	% end
	% M(1,:)=circshift(M(1,:), [0 -lag]);


figure
imagesc(M,[0 color_limit]);





% clear; clc

% s1=[1 2 3 4 5]
% s2=[0 0 0 1 1 1 1 1 2 3 4 5 0]
% [c,lags]=xcorr(s1,s2);
%  % disp('new')
% [maxC,I]=max(c);
% lag = lags(I)

% s3=circshift(s2, lag)










% [val,iLag]=max(c(find(lags==0):end))  % find the max in one-sided
% c(find(lags==0):end)
% [val,iLag]=max(c(find(lags==0):end))  % find the max in one-sided

% for i=1:9
% 	% s1= M(i,:);
% 	% s2=circshift(s1, 8);
% 	% s2= M(i+1,:);
% % s2=[0 0 0 1 1 1 1 1 2 3 4 5 0];
% 	[c,lags]=xcorr(M(i,:),M(i+1,:),'coeff');
% 	% disp('new')
% 	[maxC,I]=max(c);
% 	lag = lags(I)
% 	% s3=circshift(s2, lag);
% 	M(i+1,:)=circshift(M(i+1,:), lag);
% end


% figure
% imagesc(M,[0 color_limit]);

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