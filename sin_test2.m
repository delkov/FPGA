clear; clc

N = 200;
d = 7.6404/N;
x = zeros(1,N);


for n = 2:10*N
    x(n) = x(n-1) + d/sqrt(1+cos(x(n-1))^2);
end


middle = 80;
VA = 40;
HA = 40;% 61 is 107 <-> 111 sometimes; 63 is 111 pk-pk  %75 makes 25.22 degree with 5000 clock div8



new_line_up=[];
new_line_down=[];
crit_value=0.9998;


cd('/home/delkov/mojo/SIMPLE/');
fileID = fopen('NEW_memsrom_2.txt','w');

y = sin(x);



x(end/2+1:end)=x(end/2:-1:1);
x=2*(x/max(x)-1/2);

% shift=-5;
shift=0;
x=circshift(x,shift);
calib=3*10^2;




[~,size_y]=size(y);

for i=1:size_y
	if (y(i)/max(y) > crit_value)
		new_line_up=[new_line_up; i];
	elseif  (y(i)/max(y) < -crit_value)
		new_line_down=[new_line_down; i];
	end
		

end





x= uint16( calib*(middle+VA*x)  );
y=  uint16( calib*(middle+HA*y) );



% plot(x,y,'.-')






% WRITE TO FILE
for i=1:size_y

    formatSpec = '    rom_data[%2.0f]=16''b%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f;\n';

    b= de2bi(x(i),16,'left-msb');
    fprintf(fileID,formatSpec,i*2,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));

    b= de2bi(y(i),16,'left-msb');
    fprintf(fileID,formatSpec,i*2+1,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));

end


disp(size(new_line_up))
disp(size(new_line_down))

% show new lines

% add=115;
add=215;
% disp(new_line_up*8+add)
% disp(new_line_down*8+add)
add_down=0;
add_up=0;


%new line
str = strcat(   'if (', sprintf('addr_q == 16''d%d || ', add+[8*new_line_up+add_up; 8*new_line_down(1:end-1)]), ' addr_q==16''d',num2str(add+8*new_line_down(end)), ') begin' )


% new frame
str2 = strcat(   'if (', sprintf('addr_q == 16''d%d || ', add+8*new_line_up(1)+add_up), ' addr_q==16''d', num2str(add+8*new_line_up(end/2+1)+add_up), ') begin' )
