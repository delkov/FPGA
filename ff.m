clear; clc
delete(instrfindall); % remove already opened serial

main();
function main()

    mine=[
        1.0000         0         0
        1.0000    0.0572         0
        1.0000    0.1143         0
        1.0000    0.1715         0
        1.0000    0.2287         0
        1.0000    0.2858         0
        1.0000    0.3430         0
        1.0000    0.3673         0
        1.0000    0.3917         0
        1.0000    0.4160         0
        1.0000    0.4403         0
        1.0000    0.4647         0
        1.0000    0.4890         0
        1.0000    0.5912         0
        1.0000    0.6934         0
        1.0000    0.7956         0
        1.0000    0.8978         0
        1.0000    1.0000         0
        0.9862    0.9914    0.0049
        0.9725    0.9829    0.0099
        0.9587    0.9743    0.0148
        0.9449    0.9657    0.0197
        0.9312    0.9571    0.0247
        0.9174    0.9486    0.0296
        0.9036    0.9400    0.0345
        0.8769    0.9475    0.0690
        0.8502    0.9550    0.1034
        0.8235    0.9625    0.1378
        0.7968    0.9700    0.1723
        0.7701    0.9775    0.2067
        0.7434    0.9850    0.2411
        0.7167    0.9925    0.2756
        0.6900    1.0000    0.3100
        0.6342    0.9487    0.3333
        0.5784    0.8973    0.3567
        0.5227    0.8460    0.3800
        0.4669    0.7947    0.4033
        0.4111    0.7433    0.4267
        0.3553    0.6920    0.4500
        0.2996    0.6407    0.4733
        0.2438    0.5893    0.4967
        0.1880    0.5380    0.5200
        0.1611    0.4611    0.5886
        0.1343    0.3843    0.6571
        0.1074    0.3074    0.7257
        0.0806    0.2306    0.7943
        0.0537    0.1537    0.8629
        0.0269    0.0769    0.9314
             0         0    1.0000
             0         0    0.9371
             0         0    0.8743
             0         0    0.8114
             0         0    0.7486
             0         0    0.6857
             0         0    0.6229
             0         0    0.5600
             0         0    0.4900
             0         0    0.4200
             0         0    0.3500
             0         0    0.2800
             0         0    0.2100
             0         0    0.1400
             0         0    0.0700
             0         0         0
    ];
    parula_white=[
        0.9769    0.9839    0.0805
        0.9691    0.9606    0.1064
        0.9664    0.9367    0.1222
        0.9637    0.9129    0.1379
        0.9610    0.8890    0.1537
        0.9668    0.8647    0.1676
        0.9725    0.8405    0.1815
        0.9783    0.8162    0.1954
        0.9841    0.7919    0.2093
        0.9898    0.7677    0.2232
        0.9956    0.7434    0.2371
        0.9728    0.7298    0.2394
        0.9393    0.7288    0.2100
        0.9035    0.7330    0.1774
        0.8634    0.7406    0.1596
        0.8203    0.7498    0.1535
        0.7738    0.7598    0.1646
        0.7242    0.7698    0.1910
        0.6720    0.7793    0.2227
        0.6175    0.7819    0.2650
        0.5630    0.7844    0.3073
        0.5085    0.7870    0.3496
        0.4541    0.7896    0.3919
        0.3996    0.7922    0.4342
        0.3451    0.7947    0.4765
        0.2906    0.7973    0.5188
        0.2470    0.7918    0.5567
        0.2161    0.7843    0.5923
        0.1939    0.7757    0.6238
        0.1717    0.7670    0.6554
        0.1408    0.7584    0.6842
        0.0964    0.7500    0.7120
        0.0433    0.7411    0.7394
        0.0067    0.7312    0.7660
        0.0036    0.7203    0.7917
        0.0297    0.7082    0.8163
        0.0689    0.6948    0.8394
        0.0952    0.6798    0.8598
        0.1095    0.6624    0.8723
        0.1237    0.6450    0.8848
        0.1380    0.6276    0.8973
        0.1460    0.6089    0.9096
        0.1540    0.5902    0.9218
        0.1687    0.5703    0.9359
        0.1736    0.5493    0.9505
        0.1785    0.5284    0.9652
        0.1834    0.5074    0.9798
        0.1963    0.4847    0.9892
        0.2206    0.4603    0.9973
        0.2440    0.4358    0.9988
        0.2602    0.4123    0.9952
        0.2638    0.3810    0.9760
        0.2674    0.3497    0.9568
        0.2711    0.3185    0.9375
        0.2747    0.2872    0.9183
        0.2783    0.2559    0.8991
        0.2778    0.2523    0.8944
        0.2772    0.2487    0.8897
        0.2767    0.2450    0.8850
        0.2762    0.2414    0.8804
        0.2756    0.2378    0.8757
        0.2751    0.2342    0.8710
        0.6375    0.6171    0.9355
        1.0000    1.0000    1.0000
    ];
    parula_black=[
        0.9769    0.9839    0.0805
        0.9691    0.9606    0.1064
        0.9664    0.9368    0.1221
        0.9637    0.9129    0.1379
        0.9610    0.8890    0.1537
        0.9668    0.8647    0.1676
        0.9726    0.8405    0.1815
        0.9783    0.8162    0.1954
        0.9841    0.7919    0.2093
        0.9899    0.7676    0.2232
        0.9956    0.7434    0.2371
        0.9728    0.7298    0.2394
        0.9393    0.7288    0.2100
        0.9035    0.7330    0.1774
        0.8634    0.7406    0.1596
        0.8203    0.7498    0.1535
        0.7738    0.7598    0.1646
        0.7242    0.7698    0.1910
        0.6720    0.7793    0.2227
        0.6175    0.7818    0.2650
        0.5630    0.7844    0.3073
        0.5085    0.7870    0.3496
        0.4541    0.7896    0.3919
        0.3996    0.7921    0.4342
        0.3451    0.7947    0.4765
        0.2906    0.7973    0.5188
        0.2470    0.7918    0.5567
        0.2161    0.7843    0.5923
        0.1939    0.7756    0.6239
        0.1717    0.7670    0.6554
        0.1408    0.7584    0.6842
        0.0964    0.7500    0.7120
        0.0433    0.7411    0.7394
        0.0067    0.7312    0.7660
        0.0036    0.7203    0.7917
        0.0297    0.7082    0.8163
        0.0689    0.6948    0.8394
        0.0952    0.6798    0.8598
        0.1095    0.6624    0.8723
        0.1238    0.6450    0.8848
        0.1380    0.6276    0.8973
        0.1460    0.6089    0.9095
        0.1540    0.5902    0.9218
        0.1687    0.5703    0.9359
        0.1764    0.5499    0.9520
        0.1799    0.5286    0.9659
        0.1834    0.5074    0.9798
        0.1963    0.4847    0.9892
        0.2206    0.4603    0.9973
        0.2440    0.4358    0.9988
        0.2602    0.4123    0.9952
        0.2639    0.3810    0.9759
        0.2675    0.3497    0.9567
        0.2711    0.3185    0.9375
        0.2747    0.2872    0.9183
        0.2783    0.2559    0.8991
        0.2751    0.2342    0.8710
        0.2736    0.2277    0.8594
        0.2721    0.2212    0.8479
        0.2706    0.2147    0.8364
        0.2304    0.1931    0.6076
        0.1902    0.1716    0.3788
        0.1500    0.1500    0.1500
             0         0         0
    ];
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
    jet_white =[
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
             0    0.9375    1.0000
             0    0.8750    1.0000
             0    0.8125    1.0000
             0    0.7500    1.0000
             0    0.6875    1.0000
             0    0.6250    1.0000
             0    0.5625    1.0000
             0    0.5000    1.0000
             0    0.4375    1.0000
             0    0.3750    1.0000
             0    0.3125    1.0000
             0    0.2500    1.0000
             0    0.1875    1.0000
             0    0.1250    1.0000
             0    0.0625    1.0000
             0         0    1.0000
        0.1429    0.1429    1.0000
        0.2857    0.2857    1.0000
        0.4286    0.4286    1.0000
        0.5714    0.5714    1.0000
        0.7143    0.7143    1.0000
        0.8571    0.8571    1.0000
        1.0000    1.0000    1.0000
    ];
    jet_black_end= [
             0         0    0.5625
             0         0    0.6250
             0         0    0.6875
             0         0    0.7500
             0         0    0.8125
             0         0    0.8750
             0         0    0.9375
             0         0    1.0000
             0    0.0625    1.0000
             0    0.1250    1.0000
             0    0.1875    1.0000
             0    0.2500    1.0000
             0    0.3125    1.0000
             0    0.3750    1.0000
             0    0.4375    1.0000
             0    0.5000    1.0000
             0    0.5625    1.0000
             0    0.6250    1.0000
             0    0.6875    1.0000
             0    0.7500    1.0000
             0    0.8125    1.0000
             0    0.8750    1.0000
             0    0.9375    1.0000
             0    1.0000    1.0000
        0.0625    1.0000    0.9375
        0.1250    1.0000    0.8750
        0.1875    1.0000    0.8125
        0.2500    1.0000    0.7500
        0.3125    1.0000    0.6875
        0.3750    1.0000    0.6250
        0.4375    1.0000    0.5625
        0.5000    1.0000    0.5000
        0.5625    1.0000    0.4375
        0.6250    1.0000    0.3750
        0.6875    1.0000    0.3125
        0.7500    1.0000    0.2500
        0.8125    1.0000    0.1875
        0.8750    1.0000    0.1250
        0.9375    1.0000    0.0625
        1.0000    1.0000         0
        1.0000    0.9375         0
        1.0000    0.8750         0
        1.0000    0.8125         0
        1.0000    0.7500         0
        1.0000    0.6875         0
        1.0000    0.6250         0
        1.0000    0.5625         0
        1.0000    0.5000         0
        1.0000    0.4375         0
        1.0000    0.3750         0
        1.0000    0.3125         0
        1.0000    0.2500         0
        1.0000    0.1875         0
        1.0000    0.1250         0
        1.0000    0.0625         0
        1.0000         0         0
        0.8333         0         0
        0.6667         0         0
        0.5000         0         0
        0.3333         0         0
        0.1667         0         0
             0         0         0
             0         0         0
             0         0         0
    ];

    cd('/home/delkov/mojo/SIMPLE/txt');

    %% CONSTANT
    counter=0; % for FPS checking
    % SERIAL
    baud_rate=4000000;
    buffer_size=1000000; % in bytes
    size_to_read=25000; % read when reached in buffer

    % PROFILING
    profile_on=0;
    record_time=60; % profile time
    
    % GLOBAL
    start_command='f';

    x_size=240;
    y_size=30;
 

    % IMAGE CORRECTIONS
    filter_data=0;
    corr_on=0;
    max_shift=35;
    replace_if_bigger_than=60; 

    % PLOT
    number_of_sub=6;
    show_colorbar = 1;
    cmap_name=jet_black; % mine, parula_black, jet_black, jet_black_end, jet_white, hot
    matrix_default_value=100;
    color=[1.5 40];

    show_separated_lines = 0;
    first_line_reverse=true;
    show_x_min=1;
    show_x_max=x_size;
    show_y_min=0;
    show_y_max=y_size;
    y_tick_step=1;
    x_tick_step=40;
    type_of_M='double'; 
    type_of_A='double'; % can be uint32 & double() below.. but not much speed increased


    %X1
    maximum_x_points_1= x_size; % make it bigger 5% 
    maximum_y_points_1= y_size; % make it bigger 5%
    temp_row_1=1;%maximum_y_points;
    len_1_before=0;
    new_frame_1_idx=0;
    redraw_1=false;
    %X2
    maximum_x_points_2= x_size; % make it bigger 5% 
    maximum_y_points_2= y_size; % make it bigger 5%
    temp_row_2=1;
    len_2_before=0;
    new_frame_2_idx=0;
    redraw_2=false;
    %X3
    maximum_x_points_3= x_size; % make it bigger 5% 
    maximum_y_points_3= y_size; % make it bigger 5%
    temp_row_3=1;
    len_3_before=0;
    new_frame_3_idx=0;
    redraw_3=false;
    %X4
    maximum_x_points_4= x_size; % make it bigger 5% 
    maximum_y_points_4= y_size; % make it bigger 5%
    temp_row_4=1;
    len_4_before=0;
    new_frame_4_idx=0;
    redraw_4=false;
    %X5
    maximum_x_points_5= x_size; % make it bigger 5% 
    maximum_y_points_5= y_size; % make it bigger 5%
    temp_row_5=1;
    len_5_before=0;
    new_frame_5_idx=0;
    redraw_5=false;
    %X6
    maximum_x_points_6= x_size; % make it bigger 5% 
    maximum_y_points_6= y_size; % make it bigger 5%
    temp_row_6=1;
    len_6_before=0;
    new_frame_6_idx=0;
    redraw_6=false;

    M_1_backup=zeros(maximum_y_points_1,maximum_x_points_1,type_of_M); 
    M_2_backup=zeros(maximum_y_points_2,maximum_x_points_2,type_of_M); 
    M_3_backup=zeros(maximum_y_points_3,maximum_x_points_3,type_of_M); 
    M_4_backup=zeros(maximum_y_points_4,maximum_x_points_4,type_of_M); 
    M_5_backup=zeros(maximum_y_points_5,maximum_x_points_5,type_of_M); 
    M_6_backup=zeros(maximum_y_points_6,maximum_x_points_6,type_of_M); 

    M_1=matrix_default_value*ones(maximum_y_points_1,maximum_x_points_1,type_of_M); % uint8 is fine, but will be rough
    M_2=matrix_default_value*ones(maximum_y_points_2,maximum_x_points_2,type_of_M);
    M_3=matrix_default_value*ones(maximum_y_points_3,maximum_x_points_3,type_of_M);
    M_4=matrix_default_value*ones(maximum_y_points_4,maximum_x_points_4,type_of_M); 
    M_5=matrix_default_value*ones(maximum_y_points_5,maximum_x_points_5,type_of_M);
    M_6=matrix_default_value*ones(maximum_y_points_6,maximum_x_points_6,type_of_M);

    % all flow separated by this array, A_1 for X1 and so on..
    A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array. Don't forget about x4;
    A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % uint32 is fine. CALIB2 is ~32000
    A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % 
    A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % 
    A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % 
    A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % 
             
    if profile_on
        profile on;
        start_time=tic;
    end


    if ~exist('h','Var')   
        % h=figure('Name','LViewer','NumberTitle','off','MenuBar', 'none', 'ToolBar','none','units','normalized','outerposition',[0 0 1 1], 'color', 'black');
        h=figure('MenuBar', 'none', 'ToolBar','none','units','normalized','outerposition',[0 0 1 1], 'color', 'black');
        
        bg = uibuttongroup(h, 'Visible','off',...
                  'Position',[0 0 1 .075],...
                  'HandleVisibility','off');
        S.r1 = uicontrol(bg,'Style',...
                          'radiobutton',...
                          'String','RFP (1800x4)',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.05 0 0.5 0.8],...
                          'HandleVisibility','off',...
                          'Callback', @r1_callback);
        S.r2 = uicontrol(bg,'Style','radiobutton',...
                          'String','CAR (760x8)',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.15 0 0.5 0.8],...
                          'Value',0,...
                          'HandleVisibility','off',...
                          'Callback', @r2_callback);
        S.r3 = uicontrol(bg,'Style','radiobutton',...
                          'String','HR (1440x30)',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.25 0 0.5 0.8],...
                          'HandleVisibility','off',...
                          'Value',1,...
                          'Callback', @r3_callback);
        S.sl = uicontrol(bg,'Style','slider',...
                          'String','Distance range',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.35 0.2 0.2 0.4],...
                          'HandleVisibility','on',...
                          'min',1,'max',100,'val', color(2),...  
                          'SliderStep',[0.010101 0.1],... %0101011
                          'Callback', @slider_callback);
          % Add a text uicontrol to label the slider.
        S.ed = uicontrol(bg,'Style','edit',...
                          'String', num2str(color(2)),...
                          'Units', 'normalized',...
                          'InnerPosition',[0.55 0.2 0.05 0.4],...
                          'HandleVisibility','on');
        % S.btn = uicontrol(bg, 'Style', 'pushbutton', 'String', 'Flip',...
        %                   'Units', 'normalized',...
        %                   'OuterPosition',[0.62 0.2 0.05 0.4],...
        %                   'HandleVisibility','on',...
        %                   'Callback', @reverse_image);      
        S.btn2 = uicontrol(bg, 'Style', 'checkbox', 'String', 'Filter',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.68 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'Callback', @filter_data_callback);    
        S.btn3 = uicontrol(bg, 'Style', 'checkbox', 'String', 'CORR',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.71 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'Callback', @corr_on_callback);    
        S.btn4 = uicontrol(bg, 'Style', 'checkbox', 'String', 'Ticks',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.741 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'Value',0,...
                          'Callback', @ticks_callback);   
        S.btn5 = uicontrol(bg, 'Style', 'pushbutton', 'String', 'Screen',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.79 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'val',1,...
                          'Callback', @screen_callback); 
        S.btn6 = uicontrol(bg, 'Style', 'pushbutton', 'String', 'Pause',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.84 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'val',1,...
                          'Callback', @pause_callback); 
        S.btn7 = uicontrol(bg, 'Style', 'pushbutton', 'String', 'EXIT',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.89 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'Value',0,...
                          'Callback', @exit_callback); 

        % Make the uibuttongroup visible after creating child objects. 
        bg.Visible = 'on';
        set([S.sl,S.ed],'call',{@ed_call,S});  % Shared Callback.

        % speed up FPS
        set(gcf, 'GraphicsSmoothing','off')  % worked for HG1 with opengl!
        set(gcf,'Renderer','OpenGL'); % worked (by default actually..)0
        set(gcf,'RendererMode','manual'); % already setted because of OpenGl, just keep it..

        % cla
        % ax = axes('Parent', h);        
        [ha, ~] = tight_subplot(1,number_of_sub,[0 0],[.1 0.01],[.01 .04]);

        colormap(ha(1), cmap_name);
        colormap(ha(2), cmap_name);
        colormap(ha(3), cmap_name);
        colormap(ha(4), cmap_name);
        colormap(ha(5), cmap_name);
        colormap(ha(6), cmap_name);


        % F1
        axes(ha(1));
        pl(1)=image(M_1,'CDataMapping','scaled');
        ax=gca;
        if (~show_separated_lines)
            ax.XTick=[];
            ax.YTick=[];
            axis off
        else
            ax.XTick = [0:x_tick_step:show_x_max];
            ax.YTick = [0:y_tick_step:show_y_max];
        end
        % to make drawnow faster, since defined already
        set(ax, 'xlimmode','manual',...
           'ylimmode','manual',...
           'zlimmode','manual',...
           'climmode','manual',...
           'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % set(ha,'YTickLabel',[]) 

        % F2
        axes(ha(2));
        pl(2)=image(M_2,'CDataMapping','scaled');
        ax=gca;
        if (~show_separated_lines)
            ax.XTick=[];
            ax.YTick=[];
            axis off
        else
            ax.XTick = [0:x_tick_step:show_x_max];
            ax.YTick = [0:y_tick_step:show_y_max];
        end
        % to make drawnow faster, since defined already
        set(ax, 'xlimmode','manual',...
           'ylimmode','manual',...
           'zlimmode','manual',...
           'climmode','manual',...
           'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % set(ha,'YTickLabel',[]) 

        % % F3
        axes(ha(3));
        pl(3)=image(M_3,'CDataMapping','scaled');
        ax=gca;
        if (~show_separated_lines)
            ax.XTick=[];
            ax.YTick=[];
            axis off
        else
            ax.XTick = [0:x_tick_step:show_x_max];
            ax.YTick = [0:y_tick_step:show_y_max];
        end
        % to make drawnow faster, since defined already
        set(ax, 'xlimmode','manual',...
           'ylimmode','manual',...
           'zlimmode','manual',...
           'climmode','manual',...
           'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % set(ha,'YTickLabel',[]) 
        % F4
        axes(ha(4));
        pl(4)=image(M_4,'CDataMapping','scaled');
        ax=gca;
        if (~show_separated_lines)
            ax.XTick=[];
            ax.YTick=[];
            axis off
        else
            ax.XTick = [0:x_tick_step:show_x_max];
            ax.YTick = [0:y_tick_step:show_y_max];
        end
        % to make drawnow faster, since defined already
        set(ax, 'xlimmode','manual',...
           'ylimmode','manual',...
           'zlimmode','manual',...
           'climmode','manual',...
           'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % % set(ha,'YTickLabel',[]) 

        % F5
        axes(ha(5));
        pl(5)=image(M_5,'CDataMapping','scaled');
        ax=gca;
        if (~show_separated_lines)
            ax.XTick=[];
            ax.YTick=[];
            axis off
        else
            ax.XTick = [0:x_tick_step:show_x_max];
            ax.YTick = [0:y_tick_step:show_y_max];
        end
        % to make drawnow faster, since defined already
        set(ax, 'xlimmode','manual',...
           'ylimmode','manual',...
           'zlimmode','manual',...
           'climmode','manual',...
           'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % % set(ha,'YTickLabel',[]) /

        % F6
        axes(ha(6));
        pl(6)=image(M_6,'CDataMapping','scaled');
        ax=gca;
        if (~show_separated_lines)
            ax.XTick=[];
            ax.YTick=[];
            axis off
        else
            ax.XTick = [0:x_tick_step:show_x_max];
            ax.YTick = [0:y_tick_step:show_y_max];
        end
        % to make drawnow faster, since defined already
        set(ax, 'xlimmode','manual',...
           'ylimmode','manual',...
           'zlimmode','manual',...
           'climmode','manual',...
           'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % % % set(ha,'YTickLabel',[]) 
        

        colormap('jet');
    end
        
        if (show_colorbar)
            c=colorbar;
            c.Color = 'white';
            c.Position=[0.96 0.1 0.02 0.89];
        end
    % wait initialization of frames % co.
    % delay_ms(1000);
    
    drawnow;
    bad_counter=0;

    M_1_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_1_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_2_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_2_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_3_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_3_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_4_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_4_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_5_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_5_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_6_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    M_6_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);

    left_new=uint16([]);


    if(~exist('s','Var'))
        ser_list=seriallist();
        for i=1:1:length(ser_list)
            if (contains(ser_list(i), '/dev/ttyUSB'))
                ser_number=i;
            end
        end
        serial_port=ser_list(ser_number)
        s = serial(serial_port,'BaudRate',baud_rate,'DataBits',8,'InputBufferSize',buffer_size);
        s.ByteOrder = 'littleEndian';
        s.BytesAvailableFcnCount = size_to_read;
        s.BytesAvailableFcnMode = 'byte';
        s.BytesAvailableFcn = {@READY_TO_READ};
        fopen(s);
        % delay_ms(100);
        fwrite(s,uint8(start_command),'uint8')  % send start command
    
    end
    

    %% NESTED to MAIN %%
    function READY_TO_READ(~,~)

        if profile_on
            if (toc(start_time) > record_time)
                disp(['FPS is ', num2str(counter/toc(start_time))]);
                disp(['bad counter', num2str(bad_counter)]);
                name=strsplit(string(datetime('now')),' ');
                name=char(strrep(name(2),':','_'));
                profsave(profile('info'), name);
                delay_ms(10000);
            end
        end

        % both of them 8 bit -> it also 8bit; PREALLOCATED for out can be done...
        new = [left_new; uint8(fread(s,size_to_read,'uint8'))];

        zeros_amount=6;
        idx_begin=find(new==0,zeros_amount,'first');
        idx_last=find(new==0,zeros_amount,'last');
        for i=1:zeros_amount
            if (idx_begin(i)~=1 && ( new(idx_begin(i)-1)==1 || new(idx_begin(i)-1)==2 || new(idx_begin(i)-1)==3 || new(idx_begin(i)-1)==4 || new(idx_begin(i)-1)==5 || new(idx_begin(i)-1)==6  ) )
                idx_begin=idx_begin(i);
                for j=zeros_amount:-1:1
                    if (idx_last(j)~=1 && ( new(idx_last(j)-1)==1 || new(idx_last(j)-1)==2 || new(idx_last(j)-1)==3 || new(idx_last(j)-1)==4 || new(idx_last(j)-1)==5 || new(idx_last(j)-1)==6  ) ) 
                        idx_last=idx_last(j);
                        break
                    end
                end
                break
            end
        end


        left_new=new(idx_last-1:end);
        new = new(idx_begin-1:idx_last-2);
        new_size=length(new);

        if mod(new_size,6)==0
            new_length=new_size/2;
            good_out=zeros(1,new_length,'uint16');
            for i=1:new_length
                good_out(i)=new(2*i-1)+new(2*i)*256;
            end

            % find all new frames for all subs
            find_new_frames=find(good_out==14);
            if isempty(find_new_frames)
                find_new_frames=find(good_out==15);
                frame_reversed_1=true;
                frame_reversed_2=true;
                frame_reversed_3=true;
                frame_reversed_4=true;
                frame_reversed_5=true;
                frame_reversed_6=true;
            else
                frame_reversed_1=false;
                frame_reversed_2=false;
                frame_reversed_3=false;
                frame_reversed_4=false;
                frame_reversed_5=false;
                frame_reversed_6=false;
            end

            %% WE ASUME ONLY 1 FRAME PER TIME, since its real-time so no lags.
            for i=1:2:length(find_new_frames) % here we skip 1 14 14.. just grab first one
                switch good_out(find_new_frames(i)-1) % detect, which submodule
                    case 1
                        new_frame_1_idx=find_new_frames(i)-1;  % index (in good_out array) of submodule, which have next 14
                    case 2
                        new_frame_2_idx=find_new_frames(i)-1;
                    case 3
                        new_frame_3_idx=find_new_frames(i)-1;
                    case 4
                        new_frame_4_idx=find_new_frames(i)-1;
                    case 5
                        new_frame_5_idx=find_new_frames(i)-1;
                    case 6
                        new_frame_6_idx=find_new_frames(i)-1;
                    otherwise
                        disp('wrong submodule for new frame..')
                end
            end

            try
                X1();
                X2();
                X3();
                X4();
                X5();
                X6();
            catch
                disp('catch X()..')
            %     % flushinput(s)
            end

            if (redraw_2==true)% &&  redraw_2==true ||redraw_4==true || redraw_5==true || redraw_6==true)
            % if (redraw_1==true && redraw_2==true  && redraw_3==true && redraw_4==true && redraw_5==true && redraw_6==true) 
                counter=counter+1;
                redraw_1=false;
                redraw_2=false;
                redraw_3=false;
                redraw_4=false;
                redraw_5=false;
                redraw_6=false;
                drawnow nocallbacks %% more faster (25%) than just drawnow.
            end
        else
            disp('bad data occur')
            % flushinput(s)
            bad_counter=bad_counter+1;
            % disp(['how much read', num2str(how_much_read_size_to_read)]);
            % fileID = fopen('serial_checking.txt','w');
            % fprintf(fileID,'%d\n', new); 
            % delay_ms(10000);

            A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array. Don't forget about x4;
            A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % uint32 is fine. CALIB2 is ~32000
            A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % 
            A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % 
            A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % 
            A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % 

            len_1_before=0;
            len_2_before=0;
            len_3_before=0;
            len_4_before=0;
            len_5_before=0;
            len_6_before=0;

            M_1_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_1_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_2_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_2_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_3_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_3_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_4_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_4_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_5_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_5_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_6_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            M_6_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);

            left_new=uint16([]);
        end






    %% NESTED FOR READY_TO_READ %%%
        function X1()
            find_1_all_idx = find(good_out==1); % find indexes of all points 
            if (new_frame_1_idx == 0) % no new frame for sub_1
                len_1 = length(find_1_all_idx); % how many points in this package
                % fill array from last good_out
                for i=len_1_before+1:len_1_before+len_1
                    A_1(3*i-2:3*i) = good_out(find_1_all_idx(i-len_1_before):find_1_all_idx(i-len_1_before)+2);
                end
                len_1_before=len_1_before+len_1;
            else % we have new frame, so first fill before new_line, process it  and then fill data after new_line
                len_1=find(find_1_all_idx==new_frame_1_idx)-1; % how many points until new frame
                for i=len_1_before+1:len_1_before+len_1
                    A_1(3*i-2:3*i) = good_out(find_1_all_idx(i-len_1_before):find_1_all_idx(i-len_1_before)+2);
                end

                % NOW A_1 contains all frame -> separate by lines it.
                %%% SEPARATION %%%
                new_lines=find(A_1==13);
                len=length(new_lines)/2;

                if (len~=0) % sometimes we can read only new frame, without new_line
                    % remove last 2 digits from 13 13 13, % overflow sometimes.. for clean_new_lines                    
                    clean_new_lines=zeros(1,len,'uint32');
                    for i=1:len
                        clean_new_lines(i)=new_lines(2*i-1);
                    end
            
                    %% ASSUME, that row cannot start from new line !!!
                    A_sep=cell(1,len+1); % preallocated memory, carefull size
                    % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
                    A_sep{1}=A_1(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
                    for i=2:len % if <1 not processing.
                        A_sep{i} = A_1(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
                    end
                    [~,size_asep]=size(A_sep{len});
                    zero_index = clean_new_lines(len)+size_asep;
                    A_sep{len+1}=A_1(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 

                    if (~frame_reversed_1) % we dont need to reverse frame..
                        M_1(1,:)=M_1_reversed_frame_last_line;
                        temp_row_1=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            
                            % loop for selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    M_1(temp_row_1, j)=  A_sep{i}(3*(j-1)+2)*720*0.15 /   A_sep{i}(3*(j-1)+3)     ; % in

                                    if filter_data
                                        if (M_1(temp_row_1, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_1(temp_row_1,j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_1(temp_row_1,j)=M_1(temp_row_1, replace_idx);
                                            % else 
                                                % j
                                                % disp('no place bigger ~reversed 1')
                                            end
                                        elseif (M_1(temp_row_1, j) == 0)
                                            replace_idx=find(M_1(temp_row_1,j-1:-1:1) ~= 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_1(temp_row_1,j)=M_1(temp_row_1, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line
                                    M_1(temp_row_1, size_A_sepi+1-j)= A_sep{i}(3*(j-1)+2)*720*0.15 / A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_1(temp_row_1, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_1(temp_row_1, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_1(temp_row_1,size_A_sepi+1-j)=M_1(temp_row_1, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 2')
                                            end
                                        elseif (M_1(temp_row_1, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_1(temp_row_1, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_1(temp_row_1,size_A_sepi+1-j)=M_1(temp_row_1, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_1=temp_row_1+1; % next line
                        end  % for i
                        M_1_not_reversed_frame_last_line=M_1(temp_row_1-1,:);

                    else % we need to reverse frame
                        temp_row_1=1;
                        line_reversed=~first_line_reverse;

                        % % loop for all lines
                        M_1(len+2,:)=M_1_not_reversed_frame_last_line;
                        for i=len+1:-1:1                            
                            size_A_sepi=fix(length(A_sep{i})/3);
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed1

                                    M_1(temp_row_1, j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_1(temp_row_1, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_1(temp_row_1, j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_1(temp_row_1,j)=M_1(temp_row_1, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 1')
                                            end
                                        elseif  (M_1(temp_row_1, j) == 0)
                                            replace_idx=find(M_1(temp_row_1, j-1:-1:1) > 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_1(temp_row_1,j)=M_1(temp_row_1, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line                                 
                                    M_1(temp_row_1, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_1(temp_row_1, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_1(temp_row_1, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_1(temp_row_1,size_A_sepi+1-j)=M_1(temp_row_1, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 2')
                                            end
                                        elseif (M_1(temp_row_1, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_1(temp_row_1, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_1(temp_row_1,size_A_sepi+1-j)=M_1(temp_row_1, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j
                            line_reversed=~line_reversed; % change polarity
                            temp_row_1=temp_row_1+1; % next line
                        end  % for i
                        M_1_reversed_frame_last_line=M_1(1,:);
                    end % frame reversed
                    % frame_reversed_1=~frame_reversed_1;
                end % len ~=0
                %%% END SEPARATION %%%

                if (corr_on)
                    start_from=1;
                    % max_shift=20;
                    for i=1:len+1 % excep last line
                        size_A_sepi=fix(length(A_sep{i})/3)-2; % minus 2 since sometimes number of points can be -1,-2..
                        finish_to=size_A_sepi;

                        [lags,c]=CXCORR(M_1(i,start_from:finish_to), M_1(i+1,start_from:finish_to));
                        [~,idx]=max(c); %% can analyze only half, or even only first 10.. (in case of HR).
                        % lags(idx)
                        if (    (lags(idx)<max_shift) || (finish_to-lags(idx)<max_shift)    )
                            M_1(i+1,start_from:finish_to)=circshift(M_1(i+1,start_from:finish_to),[0 lags(idx)]);
                        end
                    end
                end


                M_1_backup=M_1;
                set(pl(1),'CData',M_1);
                redraw_1=true;  

                %% Previous frame is done -> A_1 is complete -> prcess it
                M_1=matrix_default_value*ones(maximum_y_points_1,maximum_x_points_1,type_of_M);
                A_1=matrix_default_value*ones(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array

                % fill array, which after new frame
                len_1_full=length(find_1_all_idx); % all points
                len_1=find(find_1_all_idx==new_frame_1_idx);
                for i=1:len_1_full-len_1
                    A_1(3*i-2:3*i) = good_out(find_1_all_idx(i+len_1):find_1_all_idx(i+len_1)+2);
                end
        
                len_1_before=len_1_full-len_1;
                new_frame_1_idx=0;
            end % new_frame_1

        end % function X1



        function X2()
            find_2_all_idx = find(good_out==2); % find indexes of all points 
            if (new_frame_2_idx == 0) % no new frame for sub_2
                len_2 = length(find_2_all_idx); % how many points in this package
                % fill array from last good_out
                for i=len_2_before+1:len_2_before+len_2
                    A_2(3*i-2:3*i) = good_out(find_2_all_idx(i-len_2_before):find_2_all_idx(i-len_2_before)+2);
                end
                len_2_before=len_2_before+len_2;
            else % we have new frame, so first fill before new_line, process it  and then fill data after new_line
                len_2=find(find_2_all_idx==new_frame_2_idx)-1; % how many points until new frame
                for i=len_2_before+1:len_2_before+len_2
                    A_2(3*i-2:3*i) = good_out(find_2_all_idx(i-len_2_before):find_2_all_idx(i-len_2_before)+2);
                end

                % NOW A_2 contains all frame -> separate by lines it.
                %%% SEPARATION %%%
                new_lines=find(A_2==13);
                len=length(new_lines)/2;

                if (len~=0) % sometimes we can read only new frame, without new_line
                    % remove last 2 digits from 13 13 13, % overflow sometimes.. for clean_new_lines                    
                    clean_new_lines=zeros(1,len,'uint32');
                    for i=1:len
                        clean_new_lines(i)=new_lines(2*i-1);
                    end
            
                    %% ASSUME, that row cannot start from new line !!!
                    A_sep=cell(1,len+1); % preallocated memory, carefull size
                    % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
                    A_sep{1}=A_2(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
                    for i=2:len % if <1 not processing.
                        A_sep{i} = A_2(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
                    end
                    [~,size_asep]=size(A_sep{len});
                    zero_index = clean_new_lines(len)+size_asep;
                    A_sep{len+1}=A_2(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 


                    if (~frame_reversed_2) % we dont need to reverse frame..
                        M_2(1,:)=M_2_reversed_frame_last_line;
                        temp_row_2=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            
                            % loop for selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    M_2(temp_row_2, j)=  A_sep{i}(3*(j-1)+2)*720*0.15 /   A_sep{i}(3*(j-1)+3)     ; % in

                                    if filter_data
                                        if (M_2(temp_row_2, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_2(temp_row_2,j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_2(temp_row_2,j)=M_2(temp_row_2, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 1')
                                            end
                                        elseif (M_2(temp_row_2, j) == 0)
                                            replace_idx=find(M_2(temp_row_2,j-1:-1:1) ~= 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_2(temp_row_2,j)=M_2(temp_row_2, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line
                                    M_2(temp_row_2, size_A_sepi+1-j)= A_sep{i}(3*(j-1)+2)*720*0.15 / A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_2(temp_row_2, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_2(temp_row_2, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_2(temp_row_2,size_A_sepi+1-j)=M_2(temp_row_2, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 2')
                                            end
                                        elseif (M_2(temp_row_2, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_2(temp_row_2, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_2(temp_row_2,size_A_sepi+1-j)=M_2(temp_row_2, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_2=temp_row_2+1; % next line
                        end  % for i
                        M_2_not_reversed_frame_last_line=M_2(temp_row_2-1,:);

                    else % we need to reverse frame
                        temp_row_2=1;
                        line_reversed=~first_line_reverse;

                        % % loop for all lines
                        M_2(len+2,:)=M_2_not_reversed_frame_last_line;
                        for i=len+1:-1:1                            
                            size_A_sepi=fix(length(A_sep{i})/3);
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed1

                                    M_2(temp_row_2, j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_2(temp_row_2, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_2(temp_row_2, j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_2(temp_row_2,j)=M_2(temp_row_2, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 1')
                                            end
                                        elseif  (M_2(temp_row_2, j) == 0)
                                            replace_idx=find(M_2(temp_row_2, j-1:-1:1) > 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_2(temp_row_2,j)=M_2(temp_row_2, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line                                 
                                    M_2(temp_row_2, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_2(temp_row_2, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_2(temp_row_2, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_2(temp_row_2,size_A_sepi+1-j)=M_2(temp_row_2, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 2')
                                            end
                                        elseif (M_2(temp_row_2, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_2(temp_row_2, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_2(temp_row_2,size_A_sepi+1-j)=M_2(temp_row_2, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j
                            line_reversed=~line_reversed; % change polarity
                            temp_row_2=temp_row_2+1; % next line
                        end  % for i
                        M_2_reversed_frame_last_line=M_2(1,:);
                    end % frame reversed
                    % frame_reversed_2=~frame_reversed_2;
                end % len ~=0
                %%% END SEPARATION %%%

                % stay=find(M_2(1:8,1:100)>replace_if_bigger_than);
                % if(stay)
                %     disp('biger')
                %     disp(stay)
                %     % delay_ms(2000)
                % end

                % stay=find(M_2(1:8,1:100)==0);
                % if(stay)
                %     disp('0')
                %     disp(stay)
                %     % delay_ms(2000)
                % end

                if (corr_on)
                    start_from=1;
                    % max_shift=20;
                    for i=1:len+1 % excep last line
                        size_A_sepi=fix(length(A_sep{i})/3)-2; % minus 2 since sometimes number of points can be -1,-2..
                        finish_to=size_A_sepi;

                        [lags,c]=CXCORR(M_2(i,start_from:finish_to), M_2(i+1,start_from:finish_to));
                        [~,idx]=max(c); %% can analyze only half, or even only first 10.. (in case of HR).
                        % lags(idx)
                        % disp('CORR')
                        if (    (lags(idx)<max_shift) || (finish_to-lags(idx)<max_shift)    )
                            M_2(i+1,start_from:finish_to)=circshift(M_2(i+1,start_from:finish_to),[0 lags(idx)]);
                        end
                    end
                end

                % if(counter==50)
                %     dlmwrite('real_corr_test_2.txt',M_2);
                %     disp('done')
                %     % find(M_2_backup(2,:)==0,5,'first')
                % end
        
                if (counter==200)
                    name=strcat(strrep(datestr(now,'dd-mmm-yyyy-hh-MM-ss'),'-','_'),'.txt');
                    dlmwrite(name, [M_1_backup M_2_backup M_3_backup M_4_backup M_5_backup M_6_backup]);
                    disp('SCREEN IS DONE')
                end
                % txt=[]
                % total_points=0;
                % for i=2:30
                %     total_points=total_points+find(M_2(i,:)==0,1,'first');
                %     txt=[txt strcat(    num2str(find(M_2(i,:)==0,1,'first')) ,'_')    ];
                % end
                % total_points=total_points+ find(arrayfun(@isnan, M_2(31,:)), 1,'first');
                % last_txt=num2str(find(arrayfun(@isnan, M_2(31,:)), 1,'first'));

                % disp([txt last_txt])
                % disp(total_points)
                % disp(['sizes ',num2str( [find(M_2(2,:)==0,1,'first') find(arrayfun(@isnan, M_2(31,:)), 1,'first') find(M_2(16,:)==0,1,'first')  ]) ])
                % disp(['sum', num2str(    find(M_2(2,:)==0,1,'first') + find(arrayfun(@isnan, M_2(31,:)), 1,'first') +find(M_2(16,:)==0,1,'first')  )   ])
                % M_2(25,:)
                % M_2(31,:)
                
                % find(M_2(2,:)==0,1,'first')
                % find(arrayfun(@isnan, M_2(31,:)), 1,'first')



                % if(counter==50)
                %     name=strcat(strrep(datestr(now,'dd-mmm-yyyy-hh-MM-ss'),'-','_'),'.txt');

                %     dlmwrite(name,M_2);
                %     disp('done')
                %     % find(M_2_backup(2,:)==0,5,'first')
                % end

                M_2_backup=M_2;
                set(pl(2),'CData',M_2);
                redraw_2=true;  

                %% Previous frame is done -> A_2 is complete -> prcess it
                M_2=matrix_default_value*ones(maximum_y_points_2,maximum_x_points_2,type_of_M);
                A_2=matrix_default_value*ones(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % +1 since new line saved in this array

                % fill array, which after new frame
                len_2_full=length(find_2_all_idx); % all points
                len_2=find(find_2_all_idx==new_frame_2_idx);
                for i=1:len_2_full-len_2
                    A_2(3*i-2:3*i) = good_out(find_2_all_idx(i+len_2):find_2_all_idx(i+len_2)+2);
                end
        
                len_2_before=len_2_full-len_2;
                new_frame_2_idx=0;
            end % new_frame_2

        end % function X2

        function X3()
            find_3_all_idx = find(good_out==3); % find indexes of all points 
            if (new_frame_3_idx == 0) % no new frame for sub_3
                len_3 = length(find_3_all_idx); % how many points in this package
                % fill array from last good_out
                for i=len_3_before+1:len_3_before+len_3
                    A_3(3*i-2:3*i) = good_out(find_3_all_idx(i-len_3_before):find_3_all_idx(i-len_3_before)+2);
                end
                len_3_before=len_3_before+len_3;
            else % we have new frame, so first fill before new_line, process it  and then fill data after new_line
                len_3=find(find_3_all_idx==new_frame_3_idx)-1; % how many points until new frame
                for i=len_3_before+1:len_3_before+len_3
                    A_3(3*i-2:3*i) = good_out(find_3_all_idx(i-len_3_before):find_3_all_idx(i-len_3_before)+2);
                end

                % NOW A_3 contains all frame -> separate by lines it.
                %%% SEPARATION %%%
                new_lines=find(A_3==13);
                len=length(new_lines)/2;

                if (len~=0) % sometimes we can read only new frame, without new_line
                    % remove last 2 digits from 13 13 13, % overflow sometimes.. for clean_new_lines                    
                    clean_new_lines=zeros(1,len,'uint32');
                    for i=1:len
                        clean_new_lines(i)=new_lines(2*i-1);
                    end
            
                    %% ASSUME, that row cannot start from new line !!!
                    A_sep=cell(1,len+1); % preallocated memory, carefull size
                    % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
                    A_sep{1}=A_3(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
                    for i=2:len % if <1 not processing.
                        A_sep{i} = A_3(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
                    end
                    [~,size_asep]=size(A_sep{len});
                    zero_index = clean_new_lines(len)+size_asep;
                    A_sep{len+1}=A_3(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 


                    if (~frame_reversed_3) % we dont need to reverse frame..
                        M_3(1,:)=M_3_reversed_frame_last_line;
                        temp_row_3=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            
                            % loop for selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    M_3(temp_row_3, j)=  A_sep{i}(3*(j-1)+2)*720*0.15 /   A_sep{i}(3*(j-1)+3)     ; % in

                                    if filter_data
                                        if (M_3(temp_row_3, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_3(temp_row_3,j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_3(temp_row_3,j)=M_3(temp_row_3, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 1')
                                            end
                                        elseif (M_3(temp_row_3, j) == 0)
                                            replace_idx=find(M_3(temp_row_3,j-1:-1:1) ~= 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_3(temp_row_3,j)=M_3(temp_row_3, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line
                                    M_3(temp_row_3, size_A_sepi+1-j)= A_sep{i}(3*(j-1)+2)*720*0.15 / A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_3(temp_row_3, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_3(temp_row_3, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_3(temp_row_3,size_A_sepi+1-j)=M_3(temp_row_3, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 2')
                                            end
                                        elseif (M_3(temp_row_3, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_3(temp_row_3, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_3(temp_row_3,size_A_sepi+1-j)=M_3(temp_row_3, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_3=temp_row_3+1; % next line
                        end  % for i
                        M_3_not_reversed_frame_last_line=M_3(temp_row_3-1,:);

                    else % we need to reverse frame
                        temp_row_3=1;
                        line_reversed=~first_line_reverse;

                        % % loop for all lines
                        M_3(len+2,:)=M_3_not_reversed_frame_last_line;
                        for i=len+1:-1:1                            
                            size_A_sepi=fix(length(A_sep{i})/3);
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed1

                                    M_3(temp_row_3, j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_3(temp_row_3, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_3(temp_row_3, j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_3(temp_row_3,j)=M_3(temp_row_3, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 1')
                                            end
                                        elseif  (M_3(temp_row_3, j) == 0)
                                            replace_idx=find(M_3(temp_row_3, j-1:-1:1) > 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_3(temp_row_3,j)=M_3(temp_row_3, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line                                 
                                    M_3(temp_row_3, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_3(temp_row_3, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_3(temp_row_3, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_3(temp_row_3,size_A_sepi+1-j)=M_3(temp_row_3, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 2')
                                            end
                                        elseif (M_3(temp_row_3, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_3(temp_row_3, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_3(temp_row_3,size_A_sepi+1-j)=M_3(temp_row_3, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j
                            line_reversed=~line_reversed; % change polarity
                            temp_row_3=temp_row_3+1; % next line
                        end  % for i
                        M_3_reversed_frame_last_line=M_3(1,:);
                    end % frame reversed
                    % frame_reversed_3=~frame_reversed_3;
                end % len ~=0
                %%% END SEPARATION %%%

                if (corr_on)
                    start_from=1;
                    % max_shift=20;
                    for i=1:len+1 % excep last line
                        size_A_sepi=fix(length(A_sep{i})/3)-2; % minus 2 since sometimes number of points can be -1,-2..
                        finish_to=size_A_sepi;

                        [lags,c]=CXCORR(M_3(i,start_from:finish_to), M_3(i+1,start_from:finish_to));
                        [~,idx]=max(c); %% can analyze only half, or even only first 10.. (in case of HR).
                        % lags(idx)
                        % disp('CORR')
                        if (    (lags(idx)<max_shift) || (finish_to-lags(idx)<max_shift)    )
                            M_3(i+1,start_from:finish_to)=circshift(M_3(i+1,start_from:finish_to),[0 lags(idx)]);
                        end
                    end
                end


                M_3_backup=M_3;
                set(pl(3),'CData',M_3);
                redraw_3=true;  

                %% Previous frame is done -> A_3 is complete -> prcess it
                M_3=matrix_default_value*ones(maximum_y_points_3,maximum_x_points_3,type_of_M);
                A_3=matrix_default_value*ones(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array

                % fill array, which after new frame
                len_3_full=length(find_3_all_idx); % all points
                len_3=find(find_3_all_idx==new_frame_3_idx);
                for i=1:len_3_full-len_3
                    A_3(3*i-2:3*i) = good_out(find_3_all_idx(i+len_3):find_3_all_idx(i+len_3)+2);
                end
        
                len_3_before=len_3_full-len_3;
                new_frame_3_idx=0;
            end % new_frame_3

        end % function X3

        function X4()
            find_4_all_idx = find(good_out==4); % find indexes of all points 
            if (new_frame_4_idx == 0) % no new frame for sub_4
                len_4 = length(find_4_all_idx); % how many points in this package
                % fill array from last good_out
                for i=len_4_before+1:len_4_before+len_4
                    A_4(3*i-2:3*i) = good_out(find_4_all_idx(i-len_4_before):find_4_all_idx(i-len_4_before)+2);
                end
                len_4_before=len_4_before+len_4;
            else % we have new frame, so first fill before new_line, process it  and then fill data after new_line
                len_4=find(find_4_all_idx==new_frame_4_idx)-1; % how many points until new frame
                for i=len_4_before+1:len_4_before+len_4
                    A_4(3*i-2:3*i) = good_out(find_4_all_idx(i-len_4_before):find_4_all_idx(i-len_4_before)+2);
                end

                % NOW A_4 contains all frame -> separate by lines it.
                %%% SEPARATION %%%
                new_lines=find(A_4==13);
                len=length(new_lines)/2;

                if (len~=0) % sometimes we can read only new frame, without new_line
                    % remove last 2 digits from 13 13 13, % overflow sometimes.. for clean_new_lines                    
                    clean_new_lines=zeros(1,len,'uint32');
                    for i=1:len
                        clean_new_lines(i)=new_lines(2*i-1);
                    end
            
                    %% ASSUME, that row cannot start from new line !!!
                    A_sep=cell(1,len+1); % preallocated memory, carefull size
                    % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
                    A_sep{1}=A_4(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
                    for i=2:len % if <1 not processing.
                        A_sep{i} = A_4(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
                    end
                    [~,size_asep]=size(A_sep{len});
                    zero_index = clean_new_lines(len)+size_asep;
                    A_sep{len+1}=A_4(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 


                    if (~frame_reversed_4) % we dont need to reverse frame..
                        M_4(1,:)=M_4_reversed_frame_last_line;
                        temp_row_4=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            
                            % loop for selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    M_4(temp_row_4, j)=  A_sep{i}(3*(j-1)+2)*720*0.15 /   A_sep{i}(3*(j-1)+3)     ; % in

                                    if filter_data
                                        if (M_4(temp_row_4, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_4(temp_row_4,j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_4(temp_row_4,j)=M_4(temp_row_4, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 1')
                                            end
                                        elseif (M_4(temp_row_4, j) == 0)
                                            replace_idx=find(M_4(temp_row_4,j-1:-1:1) ~= 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_4(temp_row_4,j)=M_4(temp_row_4, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line
                                    M_4(temp_row_4, size_A_sepi+1-j)= A_sep{i}(3*(j-1)+2)*720*0.15 / A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_4(temp_row_4, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_4(temp_row_4, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_4(temp_row_4,size_A_sepi+1-j)=M_4(temp_row_4, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 2')
                                            end
                                        elseif (M_4(temp_row_4, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_4(temp_row_4, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_4(temp_row_4,size_A_sepi+1-j)=M_4(temp_row_4, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_4=temp_row_4+1; % next line
                        end  % for i
                        M_4_not_reversed_frame_last_line=M_4(temp_row_4-1,:);

                    else % we need to reverse frame
                        temp_row_4=1;
                        line_reversed=~first_line_reverse;

                        % % loop for all lines
                        M_4(len+2,:)=M_4_not_reversed_frame_last_line;
                        for i=len+1:-1:1                            
                            size_A_sepi=fix(length(A_sep{i})/3);
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed1

                                    M_4(temp_row_4, j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_4(temp_row_4, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_4(temp_row_4, j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_4(temp_row_4,j)=M_4(temp_row_4, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 1')
                                            end
                                        elseif  (M_4(temp_row_4, j) == 0)
                                            replace_idx=find(M_4(temp_row_4, j-1:-1:1) > 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_4(temp_row_4,j)=M_4(temp_row_4, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line                                 
                                    M_4(temp_row_4, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_4(temp_row_4, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_4(temp_row_4, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_4(temp_row_4,size_A_sepi+1-j)=M_4(temp_row_4, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 2')
                                            end
                                        elseif (M_4(temp_row_4, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_4(temp_row_4, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_4(temp_row_4,size_A_sepi+1-j)=M_4(temp_row_4, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j
                            line_reversed=~line_reversed; % change polarity
                            temp_row_4=temp_row_4+1; % next line
                        end  % for i
                        M_4_reversed_frame_last_line=M_4(1,:);
                    end % frame reversed
                    % frame_reversed_4=~frame_reversed_4;
                end % len ~=0
                %%% END SEPARATION %%%

                if (corr_on)
                    start_from=1;
                    % max_shift=20;
                    for i=1:len+1 % excep last line
                        size_A_sepi=fix(length(A_sep{i})/3)-2; % minus 2 since sometimes number of points can be -1,-2..
                        finish_to=size_A_sepi;

                        [lags,c]=CXCORR(M_4(i,start_from:finish_to), M_4(i+1,start_from:finish_to));
                        [~,idx]=max(c); %% can analyze only half, or even only first 10.. (in case of HR).
                        % lags(idx)
                        % disp('CORR')
                        if (    (lags(idx)<max_shift) || (finish_to-lags(idx)<max_shift)    )
                            M_4(i+1,start_from:finish_to)=circshift(M_4(i+1,start_from:finish_to),[0 lags(idx)]);
                        end
                    end
                end


                M_4_backup=M_4;
                set(pl(4),'CData',M_4);
                redraw_4=true;  

                %% Previous frame is done -> A_4 is complete -> prcess it
                M_4=matrix_default_value*ones(maximum_y_points_4,maximum_x_points_4,type_of_M);
                A_4=matrix_default_value*ones(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % +1 since new line saved in this array

                % fill array, which after new frame
                len_4_full=length(find_4_all_idx); % all points
                len_4=find(find_4_all_idx==new_frame_4_idx);
                for i=1:len_4_full-len_4
                    A_4(3*i-2:3*i) = good_out(find_4_all_idx(i+len_4):find_4_all_idx(i+len_4)+2);
                end
        
                len_4_before=len_4_full-len_4;
                new_frame_4_idx=0;
            end % new_frame_4

        end % function X3

        function X5()
            find_5_all_idx = find(good_out==5); % find indexes of all points 
            if (new_frame_5_idx == 0) % no new frame for sub_5
                len_5 = length(find_5_all_idx); % how many points in this package
                % fill array from last good_out
                for i=len_5_before+1:len_5_before+len_5
                    A_5(3*i-2:3*i) = good_out(find_5_all_idx(i-len_5_before):find_5_all_idx(i-len_5_before)+2);
                end
                len_5_before=len_5_before+len_5;
            else % we have new frame, so first fill before new_line, process it  and then fill data after new_line
                len_5=find(find_5_all_idx==new_frame_5_idx)-1; % how many points until new frame
                for i=len_5_before+1:len_5_before+len_5
                    A_5(3*i-2:3*i) = good_out(find_5_all_idx(i-len_5_before):find_5_all_idx(i-len_5_before)+2);
                end

                % NOW A_5 contains all frame -> separate by lines it.
                %%% SEPARATION %%%
                new_lines=find(A_5==13);
                len=length(new_lines)/2;

                if (len~=0) % sometimes we can read only new frame, without new_line
                    % remove last 2 digits from 13 13 13, % overflow sometimes.. for clean_new_lines                    
                    clean_new_lines=zeros(1,len,'uint32');
                    for i=1:len
                        clean_new_lines(i)=new_lines(2*i-1);
                    end
            
                    %% ASSUME, that row cannot start from new line !!!
                    A_sep=cell(1,len+1); % preallocated memory, carefull size
                    % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
                    A_sep{1}=A_5(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
                    for i=2:len % if <1 not processing.
                        A_sep{i} = A_5(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
                    end
                    [~,size_asep]=size(A_sep{len});
                    zero_index = clean_new_lines(len)+size_asep;
                    A_sep{len+1}=A_5(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 


                    if (~frame_reversed_5) % we dont need to reverse frame..
                        M_5(1,:)=M_5_reversed_frame_last_line;
                        temp_row_5=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            
                            % loop for selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    M_5(temp_row_5, j)=  A_sep{i}(3*(j-1)+2)*720*0.15 /   A_sep{i}(3*(j-1)+3)     ; % in

                                    if filter_data
                                        if (M_5(temp_row_5, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_5(temp_row_5,j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_5(temp_row_5,j)=M_5(temp_row_5, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 1')
                                            end
                                        elseif (M_5(temp_row_5, j) == 0)
                                            replace_idx=find(M_5(temp_row_5,j-1:-1:1) ~= 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_5(temp_row_5,j)=M_5(temp_row_5, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line
                                    M_5(temp_row_5, size_A_sepi+1-j)= A_sep{i}(3*(j-1)+2)*720*0.15 / A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_5(temp_row_5, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_5(temp_row_5, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_5(temp_row_5,size_A_sepi+1-j)=M_5(temp_row_5, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 2')
                                            end
                                        elseif (M_5(temp_row_5, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_5(temp_row_5, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_5(temp_row_5,size_A_sepi+1-j)=M_5(temp_row_5, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_5=temp_row_5+1; % next line
                        end  % for i
                        M_5_not_reversed_frame_last_line=M_5(temp_row_5-1,:);

                    else % we need to reverse frame
                        temp_row_5=1;
                        line_reversed=~first_line_reverse;

                        % % loop for all lines
                        M_5(len+2,:)=M_5_not_reversed_frame_last_line;
                        for i=len+1:-1:1                            
                            size_A_sepi=fix(length(A_sep{i})/3);
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed1

                                    M_5(temp_row_5, j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_5(temp_row_5, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_5(temp_row_5, j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_5(temp_row_5,j)=M_5(temp_row_5, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 1')
                                            end
                                        elseif  (M_5(temp_row_5, j) == 0)
                                            replace_idx=find(M_5(temp_row_5, j-1:-1:1) > 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_5(temp_row_5,j)=M_5(temp_row_5, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line                                 
                                    M_5(temp_row_5, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_5(temp_row_5, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_5(temp_row_5, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_5(temp_row_5,size_A_sepi+1-j)=M_5(temp_row_5, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 2')
                                            end
                                        elseif (M_5(temp_row_5, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_5(temp_row_5, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_5(temp_row_5,size_A_sepi+1-j)=M_5(temp_row_5, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j
                            line_reversed=~line_reversed; % change polarity
                            temp_row_5=temp_row_5+1; % next line
                        end  % for i
                        M_5_reversed_frame_last_line=M_5(1,:);
                    end % frame reversed
                    % frame_reversed_5=~frame_reversed_5;
                end % len ~=0
                %%% END SEPARATION %%%

                if (corr_on)
                    start_from=1;
                    % max_shift=20;
                    for i=1:len+1 % excep last line
                        size_A_sepi=fix(length(A_sep{i})/3)-2; % minus 2 since sometimes number of points can be -1,-2..
                        finish_to=size_A_sepi;

                        [lags,c]=CXCORR(M_5(i,start_from:finish_to), M_5(i+1,start_from:finish_to));
                        [~,idx]=max(c); %% can analyze only half, or even only first 10.. (in case of HR).
                        % lags(idx)
                        % disp('CORR')
                        if (    (lags(idx)<max_shift) || (finish_to-lags(idx)<max_shift)    )
                            M_5(i+1,start_from:finish_to)=circshift(M_5(i+1,start_from:finish_to),[0 lags(idx)]);
                        end
                    end
                end


                M_5_backup=M_5;
                set(pl(5),'CData',M_5);
                redraw_5=true;  

                %% Previous frame is done -> A_5 is complete -> prcess it
                M_5=matrix_default_value*ones(maximum_y_points_5,maximum_x_points_5,type_of_M);
                A_5=matrix_default_value*ones(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % +1 since new line saved in this array

                % fill array, which after new frame
                len_5_full=length(find_5_all_idx); % all points
                len_5=find(find_5_all_idx==new_frame_5_idx);
                for i=1:len_5_full-len_5
                    A_5(3*i-2:3*i) = good_out(find_5_all_idx(i+len_5):find_5_all_idx(i+len_5)+2);
                end
        
                len_5_before=len_5_full-len_5;
                new_frame_5_idx=0;
            end % new_frame_5

        end % function X5

        function X6()
            find_6_all_idx = find(good_out==6); % find indexes of all points 
            if (new_frame_6_idx == 0) % no new frame for sub_6
                len_6 = length(find_6_all_idx); % how many points in this package
                % fill array from last good_out
                for i=len_6_before+1:len_6_before+len_6
                    A_6(3*i-2:3*i) = good_out(find_6_all_idx(i-len_6_before):find_6_all_idx(i-len_6_before)+2);
                end
                len_6_before=len_6_before+len_6;
            else % we have new frame, so first fill before new_line, process it  and then fill data after new_line
                len_6=find(find_6_all_idx==new_frame_6_idx)-1; % how many points until new frame
                for i=len_6_before+1:len_6_before+len_6
                    A_6(3*i-2:3*i) = good_out(find_6_all_idx(i-len_6_before):find_6_all_idx(i-len_6_before)+2);
                end

                % NOW A_6 contains all frame -> separate by lines it.
                %%% SEPARATION %%%
                new_lines=find(A_6==13);
                len=length(new_lines)/2;

                if (len~=0) % sometimes we can read only new frame, without new_line
                    % remove last 2 digits from 13 13 13, % overflow sometimes.. for clean_new_lines                    
                    clean_new_lines=zeros(1,len,'uint32');
                    for i=1:len
                        clean_new_lines(i)=new_lines(2*i-1);
                    end
            
                    %% ASSUME, that row cannot start from new line !!!
                    A_sep=cell(1,len+1); % preallocated memory, carefull size
                    % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
                    A_sep{1}=A_6(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
                    for i=2:len % if <1 not processing.
                        A_sep{i} = A_6(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
                    end
                    [~,size_asep]=size(A_sep{len});
                    zero_index = clean_new_lines(len)+size_asep;
                    A_sep{len+1}=A_6(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 


                    if (~frame_reversed_6) % we dont need to reverse frame..
                        M_6(1,:)=M_6_reversed_frame_last_line;
                        temp_row_6=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            
                            % loop for selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    M_6(temp_row_6, j)=  A_sep{i}(3*(j-1)+2)*720*0.15 /   A_sep{i}(3*(j-1)+3)     ; % in

                                    if filter_data
                                        if (M_6(temp_row_6, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_6(temp_row_6,j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_6(temp_row_6,j)=M_6(temp_row_6, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 1')
                                            end
                                        elseif (M_6(temp_row_6, j) == 0)
                                            replace_idx=find(M_6(temp_row_6,j-1:-1:1) ~= 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_6(temp_row_6,j)=M_6(temp_row_6, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 1')
                                            end
                                        end
                                    end

                                else   % if we must reversed line
                                    M_6(temp_row_6, size_A_sepi+1-j)= A_sep{i}(3*(j-1)+2)*720*0.15 / A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_6(temp_row_6, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_6(temp_row_6, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_6(temp_row_6,size_A_sepi+1-j)=M_6(temp_row_6, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger ~reversed 2')
                                            end
                                        elseif (M_6(temp_row_6, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_6(temp_row_6, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_6(temp_row_6,size_A_sepi+1-j)=M_6(temp_row_6, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 ~reversed 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_6=temp_row_6+1; % next line
                        end  % for i
                        M_6_not_reversed_frame_last_line=M_6(temp_row_6-1,:);

                    else % we need to reverse frame
                        temp_row_6=1;
                        line_reversed=~first_line_reverse;

                        % % loop for all lines
                        M_6(len+2,:)=M_6_not_reversed_frame_last_line;
                        for i=len+1:-1:1                            
                            size_A_sepi=fix(length(A_sep{i})/3);
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed1

                                    M_6(temp_row_6, j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_6(temp_row_6, j) >= replace_if_bigger_than)
                                            replace_idx=find(M_6(temp_row_6, j-1:-1:1)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_6(temp_row_6,j)=M_6(temp_row_6, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 1')
                                            end
                                        elseif  (M_6(temp_row_6, j) == 0)
                                            replace_idx=find(M_6(temp_row_6, j-1:-1:1) > 0,1,'first');
                                            if replace_idx>0
                                                replace_idx=j-replace_idx;
                                                M_6(temp_row_6,j)=M_6(temp_row_6, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 1')
                                            end
                                        end
                                    end
                                else   % if we must reversed line                                 
                                    M_6(temp_row_6, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in

                                    if filter_data
                                        if (M_6(temp_row_6, size_A_sepi+1-j) >= replace_if_bigger_than)
                                            replace_idx=find(M_6(temp_row_6, size_A_sepi+1-j:end)<replace_if_bigger_than,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_6(temp_row_6,size_A_sepi+1-j)=M_6(temp_row_6, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place bigger - 2')
                                            end
                                        elseif (M_6(temp_row_6, size_A_sepi+1-j) == 0)
                                            replace_idx=find(M_6(temp_row_6, size_A_sepi+1-j:end)>0,1,'first');
                                            if replace_idx>0
                                                replace_idx=replace_idx+size_A_sepi+1-j;
                                                M_6(temp_row_6,size_A_sepi+1-j)=M_6(temp_row_6, replace_idx);
                                            % else 
                                            %     j
                                            %     disp('no place 0 - 2')
                                            end
                                        end
                                    end
                                end % reversed
                            end % for j
                            line_reversed=~line_reversed; % change polarity
                            temp_row_6=temp_row_6+1; % next line
                        end  % for i
                        M_6_reversed_frame_last_line=M_6(1,:);
                    end % frame reversed
                    % frame_reversed_6=~frame_reversed_6;
                end % len ~=0
                %%% END SEPARATION %%%

                if (corr_on)
                    start_from=1;
                    % max_shift=20;
                    for i=1:len+1 % excep last line
                        size_A_sepi=fix(length(A_sep{i})/3)-2; % minus 2 since sometimes number of points can be -1,-2..
                        finish_to=size_A_sepi;

                        [lags,c]=CXCORR(M_6(i,start_from:finish_to), M_6(i+1,start_from:finish_to));
                        [~,idx]=max(c); %% can analyze only half, or even only first 10.. (in case of HR).
                        % lags(idx)
                        % disp('CORR')
                        if (    (lags(idx)<max_shift) || (finish_to-lags(idx)<max_shift)    )
                            M_6(i+1,start_from:finish_to)=circshift(M_6(i+1,start_from:finish_to),[0 lags(idx)]);
                        end
                    end
                end


                M_6_backup=M_6;
                set(pl(6),'CData',M_6);
                redraw_6=true;  

                %% Previous frame is done -> A_6 is complete -> prcess it
                M_6=matrix_default_value*ones(maximum_y_points_6,maximum_x_points_6,type_of_M);
                A_6=matrix_default_value*ones(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % +1 since new line saved in this array

                % fill array, which after new frame
                len_6_full=length(find_6_all_idx); % all points
                len_6=find(find_6_all_idx==new_frame_6_idx);
                for i=1:len_6_full-len_6
                    A_6(3*i-2:3*i) = good_out(find_6_all_idx(i+len_6):find_6_all_idx(i+len_6)+2);
                end
        
                len_6_before=len_6_full-len_6;
                new_frame_6_idx=0;
            end % new_frame_6

        end % function X5


    end % function READY_TO_READ


    %%% OTHERS HELPFUL FUNCTIONS %%%
        
    function [] = ed_call(varargin)
        [h,S] = varargin{[1,3]};  % Get calling handle and structure.

        switch h  % Who called?
            case S.ed
                L = get(S.sl,{'min','max','value'});  
                E = str2double(get(h,'string'));  
                % E=str2num(sprintf('%.2f',get(h,'string')))
                if E >= L{1} && E <= L{2}
                    set(S.sl,'value',E)  % E falls within range of slider.
                    set(ha(:),'CLim',[color(1) E]); 
                else
                    set(h,'string',L{3}) % User tried to set slider out of range. 
                end
            case S.sl
                set(S.ed,'string',sprintf('%.2f',get(h,'value'))) % Set edit to current slider.
                set(ha(:),'CLim',[color(1) get(h,'value')]); 
            otherwise
                % Do nothing, or whatever.
        end

    end % function


    function r1_callback(~, event)
        left_new=uint16([]);
        disp('mode 1');

        x_size=320;
        y_size=4;
        show_x_min=1;
        show_x_max=x_size;
        show_y_min=0.5;
        show_y_max=y_size+0.5;

        set(ha(:),'XLim',[show_x_min show_x_max]);
        set(ha(:),'YLim',[show_y_min show_y_max]);
        set(ha(:), 'XTick', [0:x_tick_step:show_x_max]);
        set(ha(:), 'YTick', [0:y_tick_step:show_y_max]);

        %X1
        maximum_x_points_1= x_size; % make it bigger 5% 
        maximum_y_points_1= y_size; % make it bigger 5%
        temp_row_1=1;
        len_1_before=0;
        new_frame_1_idx=0;
        redraw_1=false;

        M_1=matrix_default_value*ones(maximum_y_points_1,maximum_x_points_1,type_of_M);
        A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array
        M_1_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_1_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X2
        maximum_x_points_2= x_size; % make it bigger 5% 
        maximum_y_points_2= y_size; % make it bigger 5%
        temp_row_2=1;
        len_2_before=0;
        new_frame_2_idx=0;
        redraw_2=false;

        M_2=matrix_default_value*ones(maximum_y_points_2,maximum_x_points_2,type_of_M);
        A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % +1 since new line saved in this array
        M_2_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_2_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X3
        maximum_x_points_3= x_size; % make it bigger 5% 
        maximum_y_points_3= y_size; % make it bigger 5%
        temp_row_3=1;
        len_3_before=0;
        new_frame_3_idx=0;
        redraw_3=false;

        M_3=matrix_default_value*ones(maximum_y_points_3,maximum_x_points_3,type_of_M);
        A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array
        M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


        %X4
        maximum_x_points_4= x_size; % make it bigger 5% 
        maximum_y_points_4= y_size; % make it bigger 5%
        temp_row_4=1;
        len_4_before=0;
        new_frame_4_idx=0;
        redraw_4=false;

        M_4=matrix_default_value*ones(maximum_y_points_4,maximum_x_points_4,type_of_M);
        A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % +1 since new line saved in this array
        M_4_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_4_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X5
        maximum_x_points_5= x_size; % make it bigger 5% 
        maximum_y_points_5= y_size; % make it bigger 5%
        temp_row_5=1;
        len_5_before=0;
        new_frame_5_idx=0;
        redraw_5=false;

        M_5=matrix_default_value*ones(maximum_y_points_5,maximum_x_points_5,type_of_M);
        A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % +1 since new line saved in this array
        M_5_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_5_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


        %X6
        maximum_x_points_6= x_size; % make it bigger 5% 
        maximum_y_points_6= y_size; % make it bigger 5%
        temp_row_6=1;
        len_6_before=0;
        new_frame_6_idx=0;
        redraw_6=false;

        M_6=matrix_default_value*ones(maximum_y_points_6,maximum_x_points_6,type_of_M);
        A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % +1 since new line saved in this array
        M_6_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_6_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);



        fwrite(s,uint8('h'),'uint8');
        delay_ms(50); % wait to get bias
        flushinput(s);
        fwrite(s,uint8('d'),'uint8');

    end


    function r2_callback(~, event)
        left_new=uint16([]);
        disp('mode 2');

        x_size=140;
        y_size=8;

        show_x_min=1;
        show_x_max=x_size;
        show_y_min=0.5;
        show_y_max=y_size+0.5;

        set(ha(:),'XLim',[show_x_min show_x_max]);
        set(ha(:),'YLim',[show_y_min show_y_max]);
        set(ha(:), 'XTick', [0:x_tick_step:show_x_max]);
        set(ha(:), 'YTick', [0:y_tick_step:show_y_max]);

        %X1
        maximum_x_points_1= x_size; % make it bigger 5% 
        maximum_y_points_1= y_size; % make it bigger 5%
        temp_row_1=1;
        len_1_before=0;
        new_frame_1_idx=0;
        redraw_1=false;

        M_1=matrix_default_value*ones(maximum_y_points_1,maximum_x_points_1,type_of_M);
        A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array
        M_1_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_1_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X2
        maximum_x_points_2= x_size; % make it bigger 5% 
        maximum_y_points_2= y_size; % make it bigger 5%
        temp_row_2=1;
        len_2_before=0;
        new_frame_2_idx=0;
        redraw_2=false;

        M_2=matrix_default_value*ones(maximum_y_points_2,maximum_x_points_2,type_of_M);
        A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % +1 since new line saved in this array
        M_2_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_2_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X3
        maximum_x_points_3= x_size; % make it bigger 5% 
        maximum_y_points_3= y_size; % make it bigger 5%
        temp_row_3=1;
        len_3_before=0;
        new_frame_3_idx=0;
        redraw_3=false;

        M_3=matrix_default_value*ones(maximum_y_points_3,maximum_x_points_3,type_of_M);
        A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array
        M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X4
        maximum_x_points_4= x_size; % make it bigger 5% 
        maximum_y_points_4= y_size; % make it bigger 5%
        temp_row_4=1;
        len_4_before=0;
        new_frame_4_idx=0;
        redraw_4=false;

        M_4=matrix_default_value*ones(maximum_y_points_4,maximum_x_points_4,type_of_M);
        A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % +1 since new line saved in this array
        M_4_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_4_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X5
        maximum_x_points_5= x_size; % make it bigger 5% 
        maximum_y_points_5= y_size; % make it bigger 5%
        temp_row_5=1;
        len_5_before=0;
        new_frame_5_idx=0;
        redraw_5=false;

        M_5=matrix_default_value*ones(maximum_y_points_5,maximum_x_points_5,type_of_M);
        A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % +1 since new line saved in this array
        M_5_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_5_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


        %X6
        maximum_x_points_6= x_size; % make it bigger 5% 
        maximum_y_points_6= y_size; % make it bigger 5%
        temp_row_6=1;
        len_6_before=0;
        new_frame_6_idx=0;
        redraw_6=false;

        M_6=matrix_default_value*ones(maximum_y_points_6,maximum_x_points_6,type_of_M);
        A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % +1 since new line saved in this array
        M_6_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_6_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


        fwrite(s,uint8('h'),'uint8');
        delay_ms(50); % wait to get bias
        flushinput(s);
        fwrite(s,uint8('f'),'uint8');
    end


    function r3_callback(~, event)
        left_new=uint16([]);
        disp('mode 3');

        x_size=250;
        y_size=30;

        show_x_min=1;
        show_x_max=x_size;
        show_y_min=0.5;
        show_y_max=y_size+0.5;

        set(ha(:),'XLim',[show_x_min show_x_max]);
        set(ha(:),'YLim',[show_y_min show_y_max]);
        set(ha(:), 'XTick', [0:x_tick_step:show_x_max]);
        set(ha(:), 'YTick', [0:y_tick_step:show_y_max]);

        %X1
        maximum_x_points_1= x_size; % make it bigger 5% 
        maximum_y_points_1= y_size; % make it bigger 5%
        temp_row_1=1;
        len_1_before=0;
        new_frame_1_idx=0;
        redraw_1=false;

        M_1=matrix_default_value*ones(maximum_y_points_1,maximum_x_points_1,type_of_M);
        A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array
        M_1_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_1_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X2
        maximum_x_points_2= x_size; % make it bigger 5% 
        maximum_y_points_2= y_size; % make it bigger 5%
        temp_row_2=1;
        len_2_before=0;
        new_frame_2_idx=0;
        redraw_2=false;

        M_2=matrix_default_value*ones(maximum_y_points_2,maximum_x_points_2,type_of_M);
        A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % +1 since new line saved in this array
        M_2_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_2_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X3
        maximum_x_points_3= x_size; % make it bigger 5% 
        maximum_y_points_3= y_size; % make it bigger 5%
        temp_row_3=1;
        len_3_before=0;
        new_frame_3_idx=0;
        redraw_3=false;

        M_3=matrix_default_value*ones(maximum_y_points_3,maximum_x_points_3,type_of_M);
        A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array
        M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X4
        maximum_x_points_4= x_size; % make it bigger 5% 
        maximum_y_points_4= y_size; % make it bigger 5%
        temp_row_4=1;
        len_4_before=0;
        new_frame_4_idx=0;
        redraw_4=false;

        M_4=matrix_default_value*ones(maximum_y_points_4,maximum_x_points_4,type_of_M);
        A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % +1 since new line saved in this array
        M_4_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_4_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        %X5
        maximum_x_points_5= x_size; % make it bigger 5% 
        maximum_y_points_5= y_size; % make it bigger 5%
        temp_row_5=1;
        len_5_before=0;
        new_frame_5_idx=0;
        redraw_5=false;

        M_5=matrix_default_value*ones(maximum_y_points_5,maximum_x_points_5,type_of_M);
        A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % +1 since new line saved in this array
        M_5_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_5_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


        %X6
        maximum_x_points_6= x_size; % make it bigger 5% 
        maximum_y_points_6= y_size; % make it bigger 5%
        temp_row_6=1;
        len_6_before=0;
        new_frame_6_idx=0;
        redraw_6=false;

        M_6=matrix_default_value*ones(maximum_y_points_6,maximum_x_points_6,type_of_M);
        A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % +1 since new line saved in this array
        M_6_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_6_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


        fwrite(s,uint8('h'),'uint8');
        delay_ms(50);
        flushinput(s);
        fwrite(s,uint8('g'),'uint8');
    end

    % function reverse_image(source, event)
    %     frame_reversed_1=~frame_reversed_1;
    %     frame_reversed_2=~frame_reversed_2;
    %     frame_reversed_3=~frame_reversed_3;
    %     frame_reversed_4=~frame_reversed_4;
    %     frame_reversed_5=~frame_reversed_5;
    %     frame_reversed_6=~frame_reversed_6;
    % end


    function corr_on_callback(source,event)
      val=get(source, 'Value');
      if (val)
        disp('CORR ON');
        corr_on=1;
      else
        disp('CORR OFF');
        corr_on=0;
      end
    end


    function filter_data_callback(source,event)
      val=get(source, 'Value');
      if (val)
        disp('FILTER ON');
        filter_data=1;
      else
        disp('FILTER OFF');
        filter_data=0;
      end
    end


    function ticks_callback(source,event)
      val=get(source, 'Value');
      if (val)
        disp('TICKS ON');
        show_separated_lines=1;
        set(ha(:), 'Visible', 'on');
        set(ha(:), 'XTick', [0:x_tick_step:show_x_max]);
        set(ha(:), 'YTick', [0:y_tick_step:show_y_max]);
      else
        disp('TICKS OFF');
        show_separated_lines=0;
        set(ha(:), 'Visible', 'off');
        set(ha(:), 'XTick', []);
        set(ha(:), 'YTick', []);
      end

    end



    function screen_callback(source,event)
        name=strcat(strrep(datestr(now,'dd-mmm-yyyy-hh-MM-ss'),'-','_'),'.txt');
        dlmwrite(name, [M_1_backup M_2_backup M_3_backup M_4_backup M_5_backup M_6_backup]);


        % dlmwrite(name, [M_1 M_2 M_3 M_4 M_5 M_6]);


        disp('SCREEN IS DONE')
    end




    function pause_callback(source,event)
      str=get(source,'String');
      fwrite(s,uint8('p'),'uint8');

      if strcmp(str,'Pause')
        set(source,'String', 'Play')
      else
        set(source,'String', 'Pause')
      end

    end

    function exit_callback(source,event)
        fwrite(s,uint8('h'),'uint8');
        fclose(s);
        close
        clear
        return
    end

    function [x,c]=CXCORR(a,b)
        % na=norm(a);
        % nb=norm(b);
        % a=a/na; %normalization
        % b=b/nb;
        b_size=length(b);
        c=zeros(1,b_size);
        for k=1:b_size
            c(k)=a*b';
            b=[b(end),b(1:end-1)]; %circular shift
        end
        x=[0:length(b)-1]; %lags
    end

    function [ha, pos] = tight_subplot(Nh, Nw, gap, marg_h, marg_w)
        %   in:  Nh      number of axes in hight (vertical direction)
        %        Nw      number of axes in width (horizontaldirection)
        %        gap     gaps between the axes in normalized units (0...1)
        %                   or [gap_h gap_w] for different gaps in height and width 
        %        marg_h  margins in height in normalized units (0...1)
        %                   or [lower upper] for different lower and upper margins 
        %        marg_w  margins in width in normalized units (0...1)
        %                   or [left right] for different left and right margins 

        if nargin<3; gap = .02; end
        if nargin<4 || isempty(marg_h); marg_h = .05; end
        if nargin<5; marg_w = .05; end

        if numel(gap)==1
            gap = [gap gap];
        end
        if numel(marg_w)==1
            marg_w = [marg_w marg_w];
        end
        if numel(marg_h)==1
            marg_h = [marg_h marg_h];
        end

        axh = (1-sum(marg_h)-(Nh-1)*gap(1))/Nh; 
        axw = (1-sum(marg_w)-(Nw-1)*gap(2))/Nw;

        py = 1-marg_h(2)-axh; 

        % ha = zeros(Nh*Nw,1);
        ii = 0;
        for ih = 1:Nh
            px = marg_w(1);
            
            for ix = 1:Nw
                ii = ii+1;
                ha(ii) = axes('Units','normalized', ...
                    'Position',[px py axw axh], ...
                    'XTickLabel','', ...
                    'YTickLabel','');
                px = px+axw+gap(2);
            end
            py = py-axh-gap(1);
        end
        if nargout > 1
            pos = get(ha,'Position');
        end
        ha = ha(:);

    end

    % function pause the program
    function delay_ms(seconds)
        tic;
        while toc < seconds/1000
        end
    end



end % main