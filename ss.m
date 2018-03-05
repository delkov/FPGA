clear; clc
delete(instrfindall); % remove already opened serial


% LINES | N   | FREQ | FPS | MEMS    |  SHIFT | ADD
% 39    | 120 | 20   | 1   | 800000  | -2     | 63 
% 59    | 160 | 30   | 1   | 1600000 | -7     | 115
% 39    | 240 | 20   | 1   | 1600000 | -2     | 

N = 180; % at 172 points * 3.2kk ~55Hz
d = 7.6404/N; % from eleptical integral
x = zeros(1,N);
% x=zeros(1,4)
% d=d0*ones(1,N);

% d(round(N/4-N/10):round(N/4+N/10))=1.5*d0

number_of_lines=2; % real lines +1

% d=repmat(d,1,number_of_lines);

middle = 78.5;
VA = 40;
HA = 40;% 61 is 107 <-> 111 sometimes; 63 is 111 pk-pk  %75 makes 25.22 degree with 5000 clock div8

crit_value=0.99999;
new_line_up=[];
new_line_down=[];


for n = 2:N
        x(n) = x(n-1) + d/sqrt(1+cos(x(n-1))^2);
end

% remove_id=round(N/4-N/15):3:round(N/4+N/15);
% remove_id_2=round(3*N/4-N/15):3:round(3*N/4+N/15);
% x([remove_id,remove_id_2])=[];

x=repmat(x,1,number_of_lines);

cd('/home/delkov/mojo/SIMPLE/');
fileID = fopen('NEW_memsrom_2.txt','w');

y = sin(x);

% % make smooth left side
% for i=1:N/4
% 	x(i)=x(i)+2/(x(i)+x(round(N/4)))^4;
% end

% % % make smooth right side 
% for i=number_of_lines*N/2-N/4:number_of_lines*N/2
% 	x(i)=x(i)-0.13/(x(i)-x(round(11*number_of_lines*N/20)))^4;
% end

% plot(x,y,'.-')
x=2*(x/max(x)-1/2);
x(round(end/2)+1:end)=x(round(end/2):-1:1);
% y(round(end/2):end)=-y(round(end/2)+1:-1:1);

% make shift one axes on another
% shift=-5; -5 for 280 per sin1 at 16k?.. some frequence.
% shift=-2; % -10 for 46Hz

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


x = uint16( calib*(middle+VA*x)  );
y=  uint16( calib*(middle+HA*y) );

% 
figure();
plot(x,y,'.-')
% figure();
% plot([1:length(y)],y,'o')
% figure();
% plot([1:length(x)],x,'o')


formatSpec = '    %1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f,\n';


% write at the beginning, its trash actually, since in FPGA reading from index==2
for i=1:2
b= de2bi(0,16,'left-msb');
  fprintf(fileID,formatSpec,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
end

% WRITE TO FILE
for i=1:size_y
    % formatSpec = '   assign rom_data[%2.0f]=8''b%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f;\n';%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f;\n';
    % formatSpec_2 = '  assign  rom_data[%2.0f]=rom_data[12];\n';%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f;\n';

    b= de2bi(x(i),16,'left-msb');
    % fprintf(fileID,formatSpec,i*2,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8));%,b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));

    % if i<N
    fprintf(fileID,formatSpec,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
	
    b= de2bi(y(i),16,'left-msb');
    fprintf(fileID,formatSpec,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
        % fprintf(fileID,formatSpec,i*2+1,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8));%,b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
    % else
    	% b= de2bi(y(i),16,'left-msb');
    	% fprintf(fileID,formatSpec_2,i*2+1);%,b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
    % end
end


disp(size(new_line_up))
disp(size(new_line_down))

% show new lines

% add=115;
add=220; % 63 for 39x120, 115 for 59x120
% disp(new_line_up*8+add)
% disp(new_line_down*8+add)
add_down=0;
add_up=0;


%new line
str = strcat(   'if (', sprintf('addr_q == 18''d%d || ', add+[8*new_line_up+add_up; 8*new_line_down(1:end-1)]), ' addr_q==18''d',num2str(add+8*new_line_down(end)), ') begin' )

size_y*2+2-1 % two is beginning trash data -1 since counting from 0
disp((size_y*2+2-1)*4)
% new frame
str2 = strcat(   'if (', sprintf('addr_q == 18''d%d || ', add+8*new_line_up(1)+add_up), ' addr_q==18''d', num2str(add+8*new_line_down((end-1)/2+1)+add_up), ') begin' )

clear all

% % calculate laser freq.
% x=[12420 12450 12500 12562 12290 12257 12429];
% y=[9979 9998 10030 10070 9895 9873 9984];

% cftool(x,y)