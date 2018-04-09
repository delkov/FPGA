length = 9000;
number_of_waves = 200;


middle = 92;
VA = 55;
HA = 60;   %75 makes 25.22 degree with 5000 clock div

middle = middle*256+128;
VA = VA*256;
HA = HA*256;

d=2;
b = de2bi(d,16,'left-msb');
%{
N=uint16(65535);


fileID1 = fopen('header.txt','w');
F = fread(fileID1, '*char')'
fclose(fileID1);plot
fileID = fopen('memsrom.txt','w');
fprintf(fileID,F);
%}
new_line_up=[];
new_line_down=[];

fileID = fopen('memsrom.txt','w');

return_period = length/100;
growth=1;
jback=0;

x=zeros(1,length);
y =zeros(1,length);

for j=1:length
    for k = 1:2
        port = de2bi(k-1,8,'left-msb');
        switch k
            case 1
                A = VA;
                if growth==1
                    N = uint16(middle - A + 2*A*(j-1)/(length-return_period));
                    jback = j;
                    growth = 0;
                end  
                if ((j-1)<(length-return_period))
                   growth = 1;
                end
                if (growth==0)
                    N = uint16(middle + A - 2*A*(j-jback-1)/(return_period));
                end
                x(j)=N;
            case 2
                A = HA;
            %    N = uint16(middle + A*sin(double(number_of_waves)*2*3.1415926*double(j)/double(length)));
                N = uint16(middle - A + 2*A*(rem(j-1,length/number_of_waves)/(length/number_of_waves)));
                if j==length
               %     break
                end  
                y(j)=N;
        end
        b= de2bi(N,16,'left-msb');
        port(4)=1;
        port(5)=1;
      formatSpec = '    %1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f,\n';
      fprintf(fileID,formatSpec,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
 
    end
end

crit_value=0.99;

% figure();
% plot(x,y,'.-')
figure();
plot([1:size(y,2)],y,'.-')


[~,size_y]=size(y);
for i=1:size_y
    if (y(i)/max(y) > crit_value)
        new_line_up=[new_line_up; i];
    elseif  (y(i)/max(y) < 0.01)
        new_line_down=[new_line_down; i];
    end
end

disp(size(new_line_up))
disp(size(new_line_down))

add=0;
add_up=0;
add_down=0;

str = strcat(   'if (', sprintf('addr_q == 18''d%d || ', add+[8*new_line_up+add_up]), 'begin' )
