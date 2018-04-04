clear; clc
delete(instrfindall); % remove already opened serial

%% FINAL
% 3    |  560   | 16.8 | 11.1 |  3.2kk  |  -13 | 0 | 225
% 7   |   240  | 39    | 11.2 |  3.2kk  |  -13 (rough) | 212 or 220
% 29    |  420   | 22.3 | 1.56|  3.2kk  | -11 (can be -12, but worse) | 0 | 212 + 13444*2
N = 420; % 420 for 29; 240 for 7; 560 for 3; use even for symmetry, better divider of 4.
d = 7.6404/N; % from eleptical integral
 

shift=-11

add_3_to_7=0;
add_7_to_29=0;

add_3_to_7=13444;
add_7_to_29=13444;
add=205+add_3_to_7+add_7_to_29;

% add=220;

x = zeros(1,N);

number_of_lines=29; % real lines +1

middle = 79.5;
VA = 40; % WAS 30; 29-30 is 10deg, 40 is 14.3deg
HA = 46.5;% WAS 53.7 for max, 50 is quite safe. 48 is safe lvl2.

crit_value=0.99999;
new_line_up=[];
new_line_down=[];

cd('/home/delkov/mojo/SIMPLE/');
fileID = fopen('NEW_memsrom_2.txt','w');


% % make x-array, from desire sqrt(x^2+y^2)==const==length of segment
for n = 2:N*number_of_lines
    x(n) = x(n-1) + d/sqrt(1+cos(x(n-1))^2);
end

% x=0:2*pi/N:2*pi*number_of_lines;

% remove points around vehicles
locality_val=N/20; 

remove_id=[];
remove_id_2=[];
for i=1:number_of_lines

% % disp('begin')
% % disp('end')
    % remove_id=[remove_id round(N*(i-1)+(N/4-locality_val)):2:round(N*(i-1)+(N/4-locality_val))+round(2*locality_val+4)];
    % remove_id_2=[rem1ove_id_2 round(N*(i-1)+(3*N/4-locality_val)):2:round(N*(i-1)+(3*N/4-locality_val))+round((2*locality_val)+4)];
end

disp('HOW MANY POINT TO REDUCE PER LINE')
disp(size([remove_id remove_id_2],2)/number_of_lines)

x([remove_id,remove_id_2])=[];
y = sin(x);



% figure();
% plot(x,y,'.-')



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
% size(x(fix(end/2)+1:end))
% size(x(fix(end/2):-1:1))

% size(x)
% x(fix(end/2)+2:end)=x(fix(end/2):-1:1);
% y(fix(end/2)+2:end)=-y(fix(end/2):-1:1);

x(fix(end/2)+1:end)=x(fix(end/2):-1:1);
y(fix(end/2)+1:end)=-y(fix(end/2):-1:1);
x=2*(x/max(x)-1/2);

% x(end)=[]
% y(end)=[]
% x(end/2+1:end)=x(end/2:-1:1);
% x=2*(x/max(x)-1/2);

% make shift one axes on another
% shift=-5; -5 for 280 per sin1 at 16k?.. some frequence.
% shift=-2; % -10 for 46Hz
% x(1:10)

% shift=0;

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
% figure();
% plot(x,y,'.-')
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
disp('NEW LINE COUNT')
disp(size(new_line_up))
disp(size(new_line_down))

% disp('change add by')
% length([remove_id remove_id_2])/number_of_lines

% show new lines
% add=115;

% add=212+add_3_to_7;%+add_7_to_29;%+5764; % 63 for 39x120, 115 for 59x120

add_down=0;
add_up=0;




% diff=zeros(1,length(new_line_down)-1);
% for i=1:length(new_line_down)-1
% 	diff(i)= new_line_down(i+1)-new_line_down(i);
% end
% disp('diff')
% disp(diff)
% disp(new_line_down)


% new line
str = strcat(   'if (', sprintf('addr_q == 18''d%d || ', add+[8*new_line_up+add_up; 8*new_line_down(1:end-1)]), ' addr_q==18''d',num2str(add+8*new_line_down(end)), ') begin' )
% str = strcat(   'if (', sprintf('addr_q == 18''d%d || ', add+[8*new_line_up+add_up]), 'begin' )

% disp([add+8*new_line_up(1), add+8*new_line_up(fix(end/2+1))])


size_y*2+2-1 % two is beginning trash data -1 since counting from 0
disp((size_y*2+2-1)*4)
% new frame
str2 = strcat(   'if (', sprintf('addr_q == 18''d%d || ', add+8*new_line_up(1)+add_up), ' addr_q==18''d', num2str(add+8*new_line_down(fix((end-1)/2+1))+add_up), ') begin' )


clear all

% % calculate laser freq.
% x=[12420 12450 12500 12562 12290 12257 12429 12715];
% y=[9979 9998 10030 10070 9895 9873 9984 10088];

% cftool(x,y)