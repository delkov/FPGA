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

% s1=[0 1 2 3 4 5];
% s2=[1 2 3 4 5];


% [c,lags]=xcorr(s1,s2);               % compute cross correlation; keep lags vector
% [~,iLag]=max(c(find(lags==0):end));  % find the max in one-sided
% s3=circshift(s2,[0 iLag]);           % correct for the shift


% plot(s1), hold on,plot(s2,'r')
% plot(s3,'g')  % show the two signals...
% [c,l]=xcorr(s1,s2);             % compute correl, save lags
% figure,plot(l,c)                % plot correlations vs lag



% [acor,lag] = xcorr(s2,s1);

% [~,I] = max(abs(acor));
% lagDiff = lag(I)

clear; clc
% x1 = randi([0 255],1,10)
x1=[1 2 3 4 5 6 0]

x2=[0 1 2 3 4 5 6 ]
% x2=[]
% fake_shift=3;
% x2=[zeros(1,fake_shift), x1(1:end-fake_shift)]

tic
j=1;
while j<2
	[cor_cof,lags] = xcorr(x1,x2,'coeff')
	[~,iLag]=max(cor_cof)
	x2=circshift(x2,iLag)
	j=j+1;
end
% x2=circshift(x2,iLag)
toc


% (1.3/10000)*20*6*5









%% HOW TO FLIP FAST %%
% clear; clc

% M= randi([1,255],30,300)

% tic
% j=1;
% while j<10000
% 	% M(2:2:end,:) = fliplr(M(2:2:end,:));
% 		M(2:2:end,:) = M(2:2:end, end:-1:1);


% 	j=j+1;
% end

% (toc/10000)*20*6*5
	% M(2:2:end,:) = M(2:2:end, end:-1:1);
% M
% M(2:2:end,:) = M(2:2:end, end:-1:1);