clear; clc

cd('/home/delkov/mojo/SIMPLE/txt');

% txt=dir('23_Mar*.txt');
% txt_last=txt(end).name
txt_last='23_Mar_2018_15_06_21.txt';
% txt_last='20_Mar_2018_17_28_13.txt';1
M=dlmread(txt_last);



number_of_lines=5; % +1 will be
number_of_rows=10; % +1 will be
R=M(1:number_of_lines,1:number_of_rows);

% R=ones(number_of_lines,number_of_rows);

% figure();
% imagesc(R);
% caxis([0,15])
% R(R>30)=1;

VFOV=30;
HFOV=30;

theta=[VFOV:VFOV/(number_of_lines-1):VFOV+VFOV]*pi/180;
phi=[HFOV:HFOV/(number_of_rows-1):HFOV+HFOV]*pi/180;

sin_theta=sin(theta);
cos_theta=cos(theta);
sin_phi=sin(phi);
cos_phi=cos(phi);
% cos_phi_sin_theta=cos(phi).*sin(theta);
% sin_phi_sin_theta=sin(phi).*sin(theta);



x=zeros(1,number_of_lines*number_of_rows);
y=zeros(1,number_of_lines*number_of_rows);
z=zeros(1,number_of_lines*number_of_rows);

% R=ones(number_of_lines,number_of_rows);

for i=1:number_of_lines
	for j=1:number_of_rows
		x((i-1)*number_of_rows+j)=R(i,j)*cos_phi(j)*sin_theta(i);
		y((i-1)*number_of_rows+j)=R(i,j)*sin_phi(j)*sin_theta(i);
		z((i-1)*number_of_rows+j)=R(i,j)*cos_theta(i);
	end
end

figure();
scatter3(x,y,z,'filled')