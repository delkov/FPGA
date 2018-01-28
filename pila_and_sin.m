length = 120;
number_of_waves = 4;


middle = 92;
VA = 60;
HA = 71;   %75 makes 25.22 degree with 5000 clock div

middle = middle*256+128;
VA = VA*256;
HA = HA*256;

d=2;
b = de2bi(d,16,'left-msb')
% {
N=uint16(65535);


% fileID1 = fopen('header.txt','w');
% F = fread(fileID1, '*char')'
% fclose(fileID1);
fileID = fopen('memsrom22.txt','w');
% fprintf(fileID,F);

return_period = length/10;
growth=1;
jback=0;

x=zeros(1,length);

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
                N = uint16(middle + A*sin(double(number_of_waves)*2*3.1415926*double(j-1)/double(length)));
                if j==length
                    break
                end  
    
        end
        b= de2bi(N,16,'left-msb')
        port(4)=1;
        port(5)=1;
      formatSpec = '    rom_data[%2.0f]=16''b%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f%1.0f;\n';
      fprintf(fileID,formatSpec,j*2+k-1,b(1),b(2),b(3),b(4),b(5),b(6),b(7),b(8),b(9),b(10),b(11),b(12),b(13),b(14),b(15),b(16))
 
    end
end
