clear; clc

cd('/home/delkov/mojo/SIMPLE/txt');
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

txt=dir('30_Mar*.txt');
% txt_last=txt(end).name
txt_last='30_Mar_2018_23_56_42.txt';
% txt_last='20_Mar_2018_17_28_13.txt';1
M=dlmread(txt_last);
size(M)
h=figure('MenuBar','none','Toolbar','figure','Color','black');


number_of_sub=6;

number_of_lines=30; % +1 will be
number_of_rows=250*number_of_sub; % +1 will be



    x=zeros(1,number_of_lines*number_of_rows);
    y=zeros(1,number_of_lines*number_of_rows);
    z=zeros(1,number_of_lines*number_of_rows);



    x_lim=10;
    y_lim=2;
    z_lim=2;
% pl=line([x,x], [y,y], [z,z], 'LineStyle','none', 'Marker','o', 'Color','b')
    ax=gca;
    % set(ax, 'Units', 'pixels', 'XLim',[-x_lim, x_lim],'YLim',[-y_lim, y_lim],'ZLim',[0, z_lim]);
    % pl = plot3(x,y,z,'Marker','o','LineStyle','none','MarkerSize',1,'Color','g')

    view([0,60])
    % get(ax)
    % ax.XLim=[-x_lim, x_lim];
    % ax.YLim=[-y_lim, y_lim];
    % ax.ZLim=[0, 30];

% pl=scatter3(x,y,z)

tic
% for i=1:10
    R=M(1:number_of_lines,1:number_of_rows);

    % figure();
    R(R>30)=0.04;
    % imagesc(R);
    % colormap(gca, jet_black);

    % caxis([0,15])

    VFOV=14;
    VFOV_ADD=90;

    HFOV=-30*number_of_sub;

    theta=[VFOV_ADD-VFOV/2:VFOV/(number_of_lines-1):VFOV_ADD+VFOV/2]*pi/180;
    phi=[HFOV:HFOV/(number_of_rows-1):HFOV+HFOV]*pi/180;

    sin_theta=sin(theta);
    cos_theta=cos(theta);
    sin_phi=sin(phi);
    cos_phi=cos(phi);
    % cos_phi_sin_theta=cos(phi).*sin(theta);
    % sin_phi_sin_theta=sin(phi).*sin(theta);


    % R=ones(number_of_lines,number_of_rows);

    for i=1:number_of_lines
        for j=1:number_of_rows
            x((i-1)*number_of_rows+j)=R(i,j)*cos_phi(j)*sin_theta(i);
            y((i-1)*number_of_rows+j)=R(i,j)*sin_phi(j)*sin_theta(i);
            z((i-1)*number_of_rows+j)=R(i,j)*cos_theta(i);
        end
    end

    % scatter3(x,y,z,3,z,'filled')


    col=reshape(R',[1 numel(R)]);
    % col=[ones(1, numel(R)/2) 2*ones(1, numel(R)/2)];
    pl=scatter3(x,y,z,2.5,'filled');%,2.5,col,'filled')

    % set(pl,{'XData','YData','ZData'},{[x,x],[y,y],[z,z]})

        % size(x)
        % c=[ones(45000/2) 2*ones(45000/2)];
        % c=[x(1:100), 10*x(101:end)];
        % c=x(1:10);
        % pl=plot3(x,y,z,'Color',[0 1 0],'Marker','o','LineStyle','none','MarkerSize',2);
        % pl=plot3(x,y,z,'Color',[0 1 0],'Marker','o','LineStyle','none','MarkerSize',2);

        % pl=scatter3(x,y,z,col)
        % pl=plot3k({x,y,z})
        % pl=surf([x;x],[y;y],[z;z],ones(1,45000));%,'Marker','o','LineStyle','none')
    
    % set(pl,'')
    % drawnow

    % ax=gca;
    axis off
    % set(ax,  'Units', 'pixels', 'Position', [10, 150, 1900, 850], 'XLim',[-6, 7],'YLim',[-1, 7],'ZLim',[-1, 1]);

    % zoom_value=10;

    % xlim([-zoom_value zoom_value])
    % ylim([-zoom_value zoom_value])
    % axis off
    % view([0 0 1000])
    % view(0,70)
% end

toc