clear; clc

number_of_samples=50; % for LINE! -> for half of sinus
number_of_lines =21; % -1 = total in 2 frames -> 5 Line here per frame!! VALUE SHOUD BE 2N+1

crit_value=0.999;

middle = 80;
VA = 40;
HA = 40;% 61 is 107 <-> 111 sometimes; 63 is 111 pk-pk  %75 makes 25.22 degree with 5000 clock div8


cd('/home/delkov/mojo/SIMPLE/');
fileID = fopen('NEW_memsrom.txt','w');

% HA
x=zeros(1,(number_of_samples-1)*number_of_lines);
y=zeros(1,(number_of_samples-1)*number_of_lines);

% VA
x_2=zeros(1,(number_of_samples-2)*number_of_lines);


delta=2/(number_of_samples-1);
temp_x=zeros(1,number_of_samples-1);


phase_shift=0;

% make Y-array 
start_index=1;
for i=1:number_of_lines

	if (i==1)
		delta_x=0;
	elseif (i==2)
		delta_x=x(find(x~=0,1,'last'));
	end

	if (mod(i,2))
		temp_y=-1+delta:delta:1;
		temp_x=asin(temp_y);
		x(start_index:start_index+number_of_samples-2) =  (2*i-2)*delta_x+temp_x;
		y(start_index:start_index+number_of_samples-2)=temp_y;			
		start_index=start_index+number_of_samples-1;
	else
		temp_y=1-delta:-delta:-1;
		temp_x=asin(temp_y);
		x(start_index:start_index+number_of_samples-2) = (2*i-2)*delta_x-temp_x;		
		y(start_index:start_index+number_of_samples-2)=temp_y;
		start_index=start_index+number_of_samples-1;
	end
end



% % MAKE X-array
% [~,size_y] = size(y);
% for i=1:size_y	
% 	if (i>size_y/2)
% 		x_2(i)=2*i;	
% 	else 
% 		x_2(i)=2*(size_y-i);
% 	end
% end


% x_2=(2*(x_2/size_y))-3;


% x=[x x];
% y=[y -y];

x=x(number_of_samples/2:end-number_of_samples/2);
y=y(number_of_samples/2:end-number_of_samples/2);

x(end/2+1:end)=x(end/2:-1:1);
% y(end/2+1:end)=-y(end/2:-1:1);

x=2*(x/max(x)-1/2);



% figure();
% [~,size_x]=size(x);
% plot([1:size_x],x,'.-')


% figure();
% [~,size_y]=size(y);
% plot([1:size_y],y,'.-')


% shift=0;
% x=circshift(x, shift);

% min_x=abs(min(x));
% x=min_x+x;



% make shift to make fine, closed trajectory
% shift=31;
% x_2=circshift(x_2, shift);

% % MAKE THEM ADOPT FOR DAC. be careful with trimming
% x_2= (middle+VA*x_2)  ;
% y=   (middle+HA*y) ;


% figure();
% plot(x_2,y,'.-')


% figure();
% plot(x, y,'.-')

% figure();
% [~,size_x_2]=size(x_2);
% plot([1:size_x_2],x_2,'.-')



% figure();
% plot(x_2,y,'.-')
% x_2=uint16(  middle+VA*x_2    );
% y=uint16(  middle+HA*y    );




% % MAKE THEM ADOPT FOR DAC. be careful with trimming
% calib=25;

calib=3*10^2;

% calib_2=3*10^2;



x= uint16( calib*(middle+VA*x)  );
y=  uint16( calib*(middle+HA*y) );





% figure();
% plot(x_2,y,'.-')


figure();
plot(x, y,'.-')

figure();
[~,size_x]=size(x);
plot([1:size_x],x,'.-')


figure();
[~,size_y]=size(y);
plot([1:size_y],y,'.-')


[~,size_y]=size(y);
% WRITE TO FILE
for i=1:size_y
    formatSpec = '    rom_data[%2.0f]=16''b%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f;\n';

    b= de2bi(x(i),16,'left-msb');
    fprintf(fileID,formatSpec,i*2,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));

    b= de2bi(y(i),16,'left-msb');
    fprintf(fileID,formatSpec,i*2+1,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));

end


% % disp('symmetry')
% % x_2(1)

% % (y(x_2(1))-min(y))/(max(y)-min(y))



