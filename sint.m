clear; clc
delete(instrfindall); % remove already opened serial

% LINES | N   | FREQ | FPS | MEMS    |  SHIFT | ADD
% 39    | 120 | 20   | 1   | 800000  | -2     | 63 
% 59    | 160 | 30   | 1   | 1600000 | -7     | 115?
% 39    | 240 | 20   | 1   | 1600000 | -2     | 115?

N = 240; % use even for symmetry, better divider of 4.
d = 7.6404/N; % from eleptical integral
x = zeros(1,N);

number_of_lines=3; % real lines +1

middle = 79.5;
VA = 40; % 40 is 73V Pk-Pk on green pcb (can differ from black)
HA = 60;% 

crit_value=0.9999;
new_line_up=[];
new_line_down=[];

cd('/home/delkov/mojo/SIMPLE/');
fileID = fopen('NEW_memsrom_2.txt','w');


% make x-array, from desire sqrt(x^2+y^2)==const==length of segment
for n = 2:N*number_of_lines
    x(n) = x(n-1) + d/sqrt(1+cos(x(n-1))^2);
end

% remove points around vehicles
locality_val=N/20; 

remove_id=[];
remove_id_2=[];
% for i=1:number_of_lines
%     remove_id=[remove_id round(N*(i-1)+(N/4-locality_val)):2:round(N*(i-1)+(N/4-locality_val))+round(2*locality_val)+2];
%     remove_id_2=[remove_id_2 round(N*(i-1)+(3*N/4-locality_val)):2:round(N*(i-1)+(3*N/4-locality_val))+round((2*locality_val))+2];
% end

x([remove_id,remove_id_2])=[];
y = sin(x);

% make smooth left side
multiply=0.1;
x_shift=N/10;
for i=1:N/4
	x(i)=x(i)+multiply/(x(i)+x(round(N/4-x_shift)))^4;
end

% % make smooth right side 
multiply=0.01;
x_shift=N/10;
for i=round(length(x)/2-N/4):round(length(x)/2+N/4)
    x(i)=x(i)-multiply/(x(i)-x(round(length(x)/2+x_shift)))^4; % can change N/10 
end

% invert arrays
x(fix(end/2)+1:end)=x(fix(end/2):-1:1);
y(fix(end/2)+1:end)=-y(fix(end/2):-1:1);
x=2*(x/max(x)-1/2);


% x(end/2+1:end)=x(end/2:-1:1);
% x=2*(x/max(x)-1/2);

% make shift one axes on another
% shift=-5; -5 for 280 per sin1 at 16k?.. some frequence.
% shift=-2; % -10 for 46Hz
shift=0;
x=circshift(x,shift);
calib=3*10^2;

% calculate shift
[~,size_y]=size(y);
for i=1:size_y
	if (y(i)/max(y) > crit_value)
		new_line_up=[new_line_up; i];
	elseif  (y(i)/max(y) < -crit_value)
		new_line_down=[new_line_down; i];
	end
end

% make them fine for DAC to write
x = uint16( calib*(middle+VA*x)  );
y=  uint16( calib*(middle+HA*y) );

% plot
figure();
plot(x,y,'.-')
% figure();
% plot([1:length(y)],y,'.-')
% figure();
% plot([1:length(x)],x,'.-')

% write to file
formatSpec = '%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f,\n';

% write at the beginning, its trash actually, since in FPGA reading from index==2
for i=1:2
b= de2bi(0,16,'left-msb');
  fprintf(fileID,formatSpec,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
end

% WRITE TO FILE+
for i=1:size_y
    b= de2bi(x(i),16,'left-msb');
    fprintf(fileID,formatSpec,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
	
    b= de2bi(y(i),16,'left-msb');
    fprintf(fileID,formatSpec,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
end

% control that crit_value right
disp(size(new_line_up))
disp(size(new_line_down))

disp('change add by')
length([remove_id remove_id_2])/number_of_lines

% show new lines
% add=115;
add=115; % 63 for 39x120, 115 for 59x120
add_down=0;
add_up=0;

%new line
str = strcat(   'if (', sprintf('addr_q == 18''d%d || ', add+[8*new_line_up+add_up; 8*new_line_down(1:end-1)]), ' addr_q==18''d',num2str(add+8*new_line_down(end)), ') begin' )
size_y*2+2-1 % two is beginning trash data -1 since counting from 0
disp((size_y*2+2-1)*4)
% new frame
str2 = strcat(   'if (', sprintf('addr_q == 18''d%d || ', add+8*new_line_up(1)+add_up), ' addr_q==18''d', num2str(add+8*new_line_down(fix((end-1)/2+1))+add_up), ') begin' )

clear all

% % calculate laser freq.
% % x=[12420 12450 12500 12562 12290 12257 12429];
% y=[9979 9998 10030 10070 9895 9873 9984];

% cftool(x,y)