clear; clc

N = 50;
d = 7.6404/N; % from eleptical integral
x = zeros(1,N);

number_of_lines=40; % real lines -1, additional +1;

middle = 80;
VA = 40;
HA = 40;% 61 is 107 <-> 111 sometimes; 63 is 111 pk-pk  %75 makes 25.22 degree with 5000 clock div8

crit_value=0.9984;
new_line_up=[];
new_line_down=[];


for n = 2:number_of_lines*N
    x(n) = x(n-1) + d/sqrt(1+cos(x(n-1))^2);
end



cd('/home/delkov/mojo/SIMPLE/');
fileID = fopen('NEW_memsrom_2.txt','w');

y = sin(x);

% % make smooth left side
% for i=1:N/4
% 	x(i)=x(i)+1/(x(i)+x(N/4))^4;
% end

% % make smooth right side 
% for i=number_of_lines*N/2-N/4:number_of_lines*N/2
% 	x(i)=x(i)-1/(x(i)-x(11*number_of_lines*N/20))^4;
% end

% plot(x,y,'.-')
x(end/2+1:end)=x(end/2:-1:1);
x=2*(x/max(x)-1/2);

% make shift one axes on another
% shift=-5; -5 for 280 per sin at 16k?.. some frequence.
shift=-2;
% shift=0;
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


x = uint16( calib*(middle+VA*x)  );
y=  uint16( calib*(middle+HA*y) );


figure();
plot(x,y,'.-')




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
add=31;
% disp(new_line_up*8+add)
% disp(new_line_down*8+add)
add_down=0;
add_up=0;


%new line
str = strcat(   'if (', sprintf('addr_q == 16''d%d || ', add+[8*new_line_up+add_up; 8*new_line_down(1:end-1)]), ' addr_q==16''d',num2str(add+8*new_line_down(end)), ') begin' )


% new frame
str2 = strcat(   'if (', sprintf('addr_q == 16''d%d || ', add+8*new_line_up(1)+add_up), ' addr_q==16''d', num2str(add+8*new_line_up(end/2+1)+add_up), ') begin' )
