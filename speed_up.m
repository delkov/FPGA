
% x = 953;
% d = 100;

tic
while j<10000
	% r = mod(x, d);   % 53
	% y = (x - r) / d; % y = 9	
	% z=953;

	% y=num2str(x);
	% out=str2double(y(1));

	
	% N = 1123;
	% m = floor(log10(x));  % [EDITED] Thanks Stephen
	% D = mod(floor(N ./ 10 .^ (m:-1:0)), 10);
	

	j=j+1;
end

% toc*1000


N = 1123;
m = floor(log10(N))  % [EDITED] Thanks Stephen
D = mod(floor(N ./ 10 .^ (m:-1:0)), 10)
