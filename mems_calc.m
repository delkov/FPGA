clear; clc


% length = 4800; for 20
length = 240;

number_of_waves = 5;

crit_value=0.99

middle = 92;
VA = 60;
HA = 61;% 61 is 107 <-> 111 sometimes; 63 is 111 pk-pk  %75 makes 25.22 degree with 5000 clock div

middle = middle*256+128;
VA = VA*256;
HA = HA*256;

cd('/home/delkov/mojo/SIMPLE/');

fileID = fopen('memsrom.txt','w');

return_period = length/2;
growth=1;
jback=0;

phase_shift=-0.13;

% phase_shift=-0.025; for 20

true_length=length; % add +1 for symmetric test

x = zeros(1,true_length);
y =zeros(1,true_length);

new_line_up=[];
new_line_down=[];



for j=1:true_length
    for k = 1:2
        switch k
            case 1


                A = VA;
                if (growth==1)
                    N = uint16(middle - A + 2*A*(j-1)/(length-return_period));                    
                else 
                    N = uint16(middle + A - 2*A*(j-jback-1)/(return_period));
                end  


                if (j>(length-return_period))
                   growth = 0;
                else
                    jback = j;
                end
                

                    x(j)=N;
                    
                    b= de2bi(N,16,'left-msb');
                    formatSpec = '    rom_data[%2.0f]=16''b%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f;\n';
                    fprintf(fileID,formatSpec,j*2+k-1,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));

            case 2


                A = HA;
                if growth==1
                    N = uint16(middle + A*sin( double(number_of_waves)*2*3.1415926*double(j)/double(length)  +phase_shift  ));
                else
                    % N = uint16(middle + A*sin( double(number_of_waves)*2*3.1415926*double(j)/double(length)   +phase_shift_2 ));
                    N = uint16(middle + A*sin( double(number_of_waves)*2*3.1415926*double(j)/double(length)  +phase_shift  ));

                end

                % if j<(true_length+1)
                    b= de2bi(N,16,'left-msb');
                    formatSpec = '    rom_data[%2.0f]=16''b%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f;\n';
                    fprintf(fileID,formatSpec,j*2+k-1,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16));
                % end


                % GOT NEW LINE INDEXES..
                if (sin(  double(number_of_waves)*2*3.1415926*double(j)/double(length)    +phase_shift))<-crit_value
                    new_line_down=[new_line_down; j];
                end

                if (sin(  double(number_of_waves)*2*3.1415926*double(j)/double(length)    +phase_shift))>crit_value
                    new_line_up=[new_line_up; j];
                end
                    


                y(j)=N;


        end % switch


        
        % if j==length
        %     break
        % end  
    end % for k

end

disp('new_line_up')
disp(new_line_up)

disp('new_line_down')
disp(new_line_down)

disp(8*jback)

str = strcat(   'if (', sprintf('addr_q == 16''d%d || ', 8*[new_line_up; new_line_down(1:end-1)]), ' addr_q==16''d',num2str(8*new_line_down(end)), ') begin' )
figure();

plot(x,y,'.-')

figure();
[~,size_y]=size(y)
plot([1:size_y],y,'.-')


figure();
[~,size_x]=size(x)
plot([1:size_x],x)


% disp('y(1)')
% y(1)

% disp('y(end)')
% y(end)


disp('y(1)/rel_max(y)')
(y(end)-min(y))/(max(y)-min(y))
1