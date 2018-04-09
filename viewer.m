clear; clc

jet_black=[
        0.5000         0         0
        0.5625         0         0
        0.6250         0         0
        0.6875         0         0
        0.7500         0         0
        0.8125         0         0
        0.8750         0         0
        0.9375         0         0
        1.0000         0         0
        1.0000    0.0625         0
        1.0000    0.1250         0
        1.0000    0.1875         0
        1.0000    0.2500         0
        1.0000    0.3125         0
        1.0000    0.3750         0
        1.0000    0.4375         0
        1.0000    0.5000         0
        1.0000    0.5625         0
        1.0000    0.6250         0
        1.0000    0.6875         0
        1.0000    0.7500         0
        1.0000    0.8125         0
        1.0000    0.8750         0
        1.0000    0.9375         0
        1.0000    1.0000         0
        0.9375    1.0000    0.0625
        0.8750    1.0000    0.1250
        0.8125    1.0000    0.1875
        0.7500    1.0000    0.2500
        0.6875    1.0000    0.3125
        0.6250    1.0000    0.3750
        0.5625    1.0000    0.4375
        0.5000    1.0000    0.5000
        0.4375    1.0000    0.5625
        0.3750    1.0000    0.6250
        0.3125    1.0000    0.6875
        0.2500    1.0000    0.7500
        0.1875    1.0000    0.8125
        0.1250    1.0000    0.8750
        0.0625    1.0000    0.9375
             0    1.0000    1.0000
             0    0.9167    1.0000
             0    0.8333    1.0000
             0    0.7500    1.0000
             0    0.6667    1.0000
             0    0.5833    1.0000
             0    0.5000    1.0000
             0    0.4167    1.0000
             0    0.3333    1.0000
             0    0.2500    1.0000
             0    0.1667    1.0000
             0    0.0833    1.0000
             0         0    1.0000
             0         0    0.9091
             0         0    0.8182
             0         0    0.7273
             0         0    0.6364
             0         0    0.5455
             0         0    0.4545
             0         0    0.3636
             0         0    0.2727
             0         0    0.1818
             0         0    0.0909
             0         0         0
];


cd('/home/delkov/mojo/SIMPLE/txt');

number_of_sub=6;

color=[0 15];

number_of_lines=8; % +1 will be
% number_of_lines=30; % +1 will be
pixels_row=130; % +1 will be
% pixels_row=240; % +1 will be

number_of_columns=pixels_row*6;

y_size=number_of_lines;
x_size=pixels_row;

VFOV=10;
VFOV_ADD=90;
HFOV=-30*number_of_sub;

theta=[VFOV_ADD-VFOV/2:VFOV/(number_of_lines-1):VFOV_ADD+VFOV/2]*pi/180;
phi=[HFOV:HFOV/(number_of_columns-1):HFOV+HFOV]*pi/180;

sin_theta=sin(theta);
cos_theta=cos(theta);
sin_phi=sin(phi);
cos_phi=cos(phi);

x_lim=10;
y_lim=15;
z_lim=2;



% h=figure('MenuBar', 'none', 'ToolBar','figure','units','normalized','outerposition',[0 0 1 1]);
% h=figure('MenuBar', 'none', 'ToolBar','figure','units','normalized','outerposition',[0 0 1 1],'color','black');
h=figure('MenuBar', 'none', 'ToolBar','figure','units','pixels','outerposition',[0 0 1920 1026],'color','black');

test=ones(1,number_of_lines*number_of_columns);
pl=scatter3(test,test,test,0.8,test);%,2.5,col,'filled')
% pl= line([test,test], [test,test], [test,test], 'LineStyle','none', 'Marker','o', 'Color','b','MarkerSize', 1, 'MarkerEdgeColor', 'none','MarkerFaceColor', [0,0,1]);
set(gca, 'Units', 'pixels', 'Position', [100, 150, 1700, 800],'XLimMode','manual','Xlim',[-8 9],'YLimMode','manual','Ylim',[-0.2 12],'ZLimMode','manual','Zlim',[-z_lim z_lim],'Visible','off');
% set(gca, 'Units', 'pixels', 'Position', [100, 150, 1700, 800],'XLimMode','manual','Xlim',[-8 9],'YLimMode','manual','Ylim',[-0.2 12],'ZLimMode','manual','Zlim',[-z_lim z_lim]);

            
% view([-10, 55])
view([-7, 68])
% view([25, 55])
colormap(gca, jet_black);
caxis([color(1) color(2)]);

c=colorbar;
c.Color = 'white';
% c.Position=[0.96 0.1 0.02 0.89];
c.Location='southoutside';
c.Position=[0.2 0.1 0.6 0.02];
c.TickDirection='in';
c.Ticks=[0:4:color(2)];
c.FontWeight='bold';
c.FontSize=10;



% tic
filename='3d_2018-04-06 20_04_14';
fid=fopen(filename);
fmt=repmat('%f,',[1,number_of_columns]);
fmt(end)=[];
g=cell2mat(textscan(fid,fmt,'collectoutput',1));
% g = fscanf(fid, formatSpec,[number_of_columns Inf]).'; % slower tahn textscan
fclose(fid);
% toc
data_size=size(g, 1);
approx_time=data_size/(8*11.19)/60;
disp(['TIME ', num2str(approx_time)]);
% data=zeros(data_size, number_of_columns);

% for i=1:data_size
% 	data(i,:)=str2double(strsplit(g{1}{i},','));
% end

% v = VideoWriter('test.mp4','Motion JPEG AVI');
% profiles = VideoWriter.getProfiles()

% v = VideoWriter('3d_min15_70.avi','Motion JPEG AVI');
v = VideoWriter('3d_min15_70_NONCOMP.avi','Uncompressed AVI');
% v = VideoWriter('3d_min15_70_NONCOMP.avi','MPEG-4');
% v.Quality = 100;
% % v.profile='MPEG-4';
v.FrameRate=11.203;

open(v);


for i=1:8:data_size
	R=g(i:i+7,:);
	for j=1:8
	    for k=1:number_of_columns
	        x((j-1)*number_of_columns+k)=R(j,k)*cos_phi(k)*sin_theta(j);
	        y((j-1)*number_of_columns+k)=R(j,k)*sin_phi(k)*sin_theta(j);
	        z((j-1)*number_of_columns+k)=R(j,k)*cos_theta(j);
	    end
	end

	col=reshape(R', [1, numel(R)]);
	set(pl,{'XData','YData','ZData','CData'},{x,y,z,col});
	drawnow
	frame = getframe(gcf);
    writeVideo(v,frame);
	delay_ms(100);
end
	

close(v);



    % function pause the program
function delay_ms(seconds)
    tic;
    while toc < seconds/1000
    end
end

