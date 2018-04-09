clear; clc
delete(instrfindall); % remove already opened serial

main();

function main()

    % global MODE_NOT_CHAGED=true;
    % EXIT=0;
    % % parallel processing initialization
    % if ~exist('p','Var')   
    %     p = gcp();
    % end

    %% CONSTANT
    counter=0; % for FPS checking

    % for serial
    baud_rate=4000000;
    buffer_size=30000; % in bytes
    % VERY IMPORTANT PARAM! should be num_of_frames*size_of_frame*~0.8
    size_to_read=4000; % read when reached in buffer. the bigger -> the bigger chance to get 2 error -  even/odd elements after reading
    record_time=600; % profile time
    
    % GLOBAL

    start_command='f';

    x_size=400;
    y_size=10;

    % plot settings
    type_of_M='double'; 
    type_of_A='double'; % can be uint32 & double() below.. but not much speed increased

    % image_correction
    corr_on=0;
    max_shift=10;

    avg_sepatare_on=0;
    avg_delta=7;


    number_of_sub=3;
    first_frame_reverse=false;
    first_line_reverse=true;
    show_x_min=1;
    show_x_max=x_size;
    show_y_min=0;
    show_y_max=y_size;
    y_tick_step=1;
    x_tick_step=40;
    color=[0 7];
    show_colorbar = 0;
    show_separated_lines = 1;

    show_dimenshions=1;

    replace_what=1488; 
    replace_to=100; % replace "overflow/bad_data" because of bad connecton

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

    % MATRIX which will be plotted
    M_1=zeros(maximum_y_points_1,maximum_x_points_1,type_of_M); % uint8 is fine
    M_2=zeros(maximum_y_points_2,maximum_x_points_2,type_of_M);
    M_3=zeros(maximum_y_points_3,maximum_x_points_3,type_of_M);
    M_4=zeros(maximum_y_points_4,maximum_x_points_4,type_of_M); 
    M_5=zeros(maximum_y_points_5,maximum_x_points_5,type_of_M);
    M_6=zeros(maximum_y_points_6,maximum_x_points_6,type_of_M);
    % all flow separated by this array, A_1 for X1 and so on..
    A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array. Don't forget about x4;
    A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % uint32 is fine. CALIB2 is ~32000
    A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % 
    A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % 
    A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % 
    A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % 
             

    % M_2_reversed_frame_first_line=zer

    % fileID = fopen('serial_checking.txt','w');
    if ~exist('h','Var')   
        % h=figure('Name','LViewer','NumberTitle','off','MenuBar', 'none', 'ToolBar','none','units','normalized','outerposition',[0 0 1 1], 'color', 'black');
        h=figure('MenuBar', 'none', 'ToolBar','none','units','normalized','outerposition',[0 0 0.5 1], 'color', 'black');
        
        bg = uibuttongroup(h, 'Visible','off',...
                  'Position',[0 0 1 .075],...
                  'HandleVisibility','off');
                      
        S.r1 = uicontrol(bg,'Style',...
                          'radiobutton',...
                          'String','Option 1',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.05 0 0.5 0.8],...
                          'HandleVisibility','off',...
                          'Callback', @r1_callback);
                      
        S.r2 = uicontrol(bg,'Style','radiobutton',...
                          'String','Option 2',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.15 0 0.5 0.8],...
                          'Value',0,...
                          'HandleVisibility','off',...
                          'Callback', @r2_callback);

        S.r3 = uicontrol(bg,'Style','radiobutton',...
                          'String','Option 3',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.25 0 0.5 0.8],...
                          'HandleVisibility','off',...
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


        S.btn = uicontrol(bg, 'Style', 'pushbutton', 'String', 'Flip',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.62 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'Callback', @reverse_image);      

        S.btn2 = uicontrol(bg, 'Style', 'checkbox', 'String', 'CORR',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.68 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'Callback', @corr_on_callback);    


        S.btn3 = uicontrol(bg, 'Style', 'checkbox', 'String', 'AVG',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.72 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'Callback', @avg_separate_callback);    




        S.btn4 = uicontrol(bg, 'Style', 'pushbutton', 'String', 'Pause',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.82 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'val',1,...
                          'Callback', @pause_callback); 


        S.btn5 = uicontrol(bg, 'Style', 'pushbutton', 'String', 'EXIT',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.875 0.2 0.05 0.4],...
                          'HandleVisibility','on',...
                          'Value',0,...
                          'Callback', @exit_callback); 

        % Make the uibuttongroup visible after creating child objects. 
        bg.Visible = 'on';
        set([S.sl,S.ed],'call',{@ed_call,S});  % Shared Callback.

        % speed up FPS
        set(gcf, 'GraphicsSmoothing','off')  % worked for HG1 with opengl!
        set(gcf,'Renderer','OpenGL'); % worked (by default actually..)
        set(gcf,'RendererMode','manual') % already setted because of OpenGl, just keep it..

        % cla
        ax = axes('Parent', h);        
        [ha, pos] = tight_subplot(1,number_of_sub,[0 0],[.09 .02],[.01 .01]);
        % F1
        axes(ha(1));
        pl(1)=image(M_1,'CDataMapping','scaled');
        if (~show_separated_lines)
            axis off;
        end
        ax=gca;
        % to make drawnow faster, since defined already
        set(ax, 'xlimmode','manual',...
           'ylimmode','manual',...
           'zlimmode','manual',...
           'climmode','manual',...
           'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YTick = [0:y_tick_step:show_y_max];
        ax.XTick = [0:x_tick_step:show_x_max];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % set(ha,'YTickLabel',[]) 
        % F2
        axes(ha(2));
        pl(2)=image(M_2,'CDataMapping','scaled');
        if (~show_separated_lines)
            axis off;
        end
        ax=gca;
        % to make drawnow faster, since defined already
        set(ax, 'xlimmode','manual',...
           'ylimmode','manual',...
           'zlimmode','manual',...
           'climmode','manual',...
           'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YTick = [0:y_tick_step:show_y_max];
        ax.XTick = [0:x_tick_step:show_x_max];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % set(ha,'YTickLabel',[]) 
        % % F3
        axes(ha(3));
        pl(3)=image(M_3,'CDataMapping','scaled');
        if (~show_separated_lines)
            axis off;
        end
        ax=gca;
        % to make drawnow faster, since defined already
        set(ax, 'xlimmode','manual',...
           'ylimmode','manual',...
           'zlimmode','manual',...
           'climmode','manual',...
           'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YTick = [0:y_tick_step:show_y_max];
        ax.XTick = [0:x_tick_step:show_x_max];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % set(ha,'YTickLabel',[]) 
        % % F4
        % axes(ha(4));
        % pl(4)=image(M_4,'CDataMapping','scaled');
        % if (~show_separated_lines)
        %     axis off;
        % end
        % ax=gca;
        % % to make drawnow faster, since defined already
        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');
        % ax.CLim = [color(1) color(2)]; % color limit
        % ax.Color=[0 0 0];
        % ax.YTick = [0:y_tick_step:show_y_max];
        % ax.XTick = [0:x_tick_step:show_x_max];
        % ax.YAxisLocation = 'left';
        % ax.XColor=[1,1,1];
        % ax.YColor=[1,1,1];
        % ax.XLim=[show_x_min, show_x_max];
        % ax.YLim=[show_y_min, show_y_max];
        % % % set(ha,'YTickLabel',[]) 
        % % F5
        % axes(ha(5));
        % pl(5)=image(M_5,'CDataMapping','scaled');
        % if (~show_separated_lines)
        %     axis off;
        % end
        % ax=gca;
        % % to make drawnow faster, since defined already
        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');
        % ax.CLim = [color(1) color(2)]; % color limit
        % ax.Color=[0 0 0];
        % ax.YTick = [0:y_tick_step:show_y_max];
        % ax.XTick = [0:x_tick_step:show_x_max];
        % ax.YAxisLocation = 'left';
        % ax.XColor=[1,1,1];
        % ax.YColor=[1,1,1];
        % ax.XLim=[show_x_min, show_x_max];
        % ax.YLim=[show_y_min, show_y_max];
        % % % set(ha,'YTickLabel',[]) 
        % % F6
        % axes(ha(6));
        % pl(6)=image(M_6,'CDataMapping','scaled');
        % if (~show_separated_lines)
        %     axis off;
        % end
        % ax=gca;
        % % to make drawnow faster, since defined already
        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');
        % ax.CLim = [color(1) color(2)]; % color limit
        % ax.Color=[0 0 0];
        % ax.YTick = [0:y_tick_step:show_y_max];
        % ax.XTick = [0:x_tick_step:show_x_max];
        % ax.YAxisLocation = 'left';
        % ax.XColor=[1,1,1];
        % ax.YColor=[1,1,1];
        % ax.XLim=[show_x_min, show_x_max];
        % ax.YLim=[show_y_min, show_y_max];
        % % % % set(ha,'YTickLabel',[]) 
        


        if (show_colorbar)
            colorbar;
        end
        colormap('jet');
    end
   
    % wait initialization of frames % co.
    % delay_ms(1000);
    % flush serial to avoid overflow
    % flushinput(s);
    
    drawnow;
    bad_counter=0;
    frame_reversed_1=first_frame_reverse;
    frame_reversed_2=first_frame_reverse;
    frame_reversed_3=first_frame_reverse;
    frame_reversed_4=first_frame_reverse;
    frame_reversed_5=first_frame_reverse;
    frame_reversed_6=first_frame_reverse;

    M_1_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_1_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


    M_2_reversed_frame_first_line=zeros(1,x_size, type_of_M);

    M_2_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_2_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_4_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_4_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_5_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_5_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_6_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    M_6_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    left_new=uint16([]);

   % check profiling %
    profile on

    start=tic;
    if(~exist('s','Var'))

        ser_list=seriallist()
        for i=1:1:length(ser_list)
            if (contains(ser_list(i), '/dev/ttyUSB'))
                ser_number=i;
            end
        end

        serial_port=ser_list(ser_number)
        s = serial(serial_port,'BaudRate',baud_rate,'DataBits',8,'InputBufferSize',buffer_size); 
        % callback genetration
        s.ByteOrder = 'littleEndian';
        s.BytesAvailableFcnCount = size_to_read;
        s.BytesAvailableFcnMode = 'byte';
        s.BytesAvailableFcn = {@READY_TO_READ};
        fopen(s); 
        % fwrite(s,uint8('s'),'uint8')
        % delay_ms(100);
        % send start command
        fwrite(s,uint8(start_command),'uint8')
    
    end

    % disp('11')/
    %% NESTED to MAIN %%
    function READY_TO_READ(~,~)
        % if(EXIT)
        %     return
        % end
        % fileID = fopen('serial_checking.txt','w');
        % disp('4')
        if (toc(start) > record_time)
            disp(['FPS is ', num2str(counter/toc(start))]);
            disp(['bad counter', num2str(bad_counter)]);
            name=strsplit(string(datetime('now')),' ');
            name=char(strrep(name(2),':','_'));
            profsave(profile('info'), name);
            delay_ms(10000);
        end

        try
            % both of them 8 bit -> it also 8bit; PREALLOCATED for out can be done...
            new = [left_new; uint16(fread(s,size_to_read,'uint8'))];

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
            new_length=length(new)/2;
            good_out=zeros(1,new_length,'uint16');
        catch
            % fileID = fopen('serial_checking.txt','w');
            % fprintf(fileID,'%d\n', new); 
            % delay_ms(10000);

            bad_counter=bad_counter+1;
            disp('bad data..')
            flushinput(s)
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

            % if (find(new==14))
            %     frame_reversed_2=~frame_reversed_2
            % end
            % frame_reversed_1=first_frame_reverse;
            % frame_reversed_3=first_frame_reverse;
            % frame_reversed_4=first_frame_reverse;
            % frame_reversed_5=first_frame_reverse;
            % frame_reversed_6=first_frame_reverse;

            M_1_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_1_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_2_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_2_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_4_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_4_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_5_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_5_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_6_reversed_frame_last_line=zeros(1,x_size,type_of_M);
            M_6_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

            left_new=uint16([]);
            return
        end

        for i=1:new_length
            good_out(i)=new(2*i-1)+new(2*i)*256;
        end

        % good_out(1:3)
            % fprintf(fileID,'%d\n',good_out);   
            % find all new frames for all subs
        find_new_frames=find(good_out==14);
    
        %% WE ASUME ONLY 1 FRAME PER TIME !!! 
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

        % for parallel processing, 4 pool at least.
        % F(2) = parfeval(p,@X2,0);
        % F(3) = parfeval(p,@X3,0);
        % F(4) = parfeval(p,@X4,0);
        % F(5) = parfeval(p,@X5,0);
        % F(6) = parfeval(p,@X6,0);
        % fetchOutputs(F)
        % completedIdx = fetchNext(F)

        try
            % line_reversed
            % first_line_reverse
            % X1();
            X2();
            % X3();
            % X4();
            % X5();
            % X6();
            
        catch
            disp('smth wrong in X()..')
        % %     flushinput(s)
        end

            if (redraw_2==true) % &&  redraw_2==true  && redraw_3==true)% ||redraw_4==true || redraw_5==true || redraw_6==true)
            % if (redraw_1==true && redraw_2==true  && redraw_3==true && redraw_4==true && redraw_5==true && redraw_6==true) 
                counter=counter+1;
                redraw_1=false;
                redraw_2=false;
                redraw_3=false;
                redraw_4=false;
                redraw_5=false;
                redraw_6=false;

                % try
                %     M_2(30,:)
                % size(find(M_2(30,:)==0,1,'first'))
                % size(find(M_2(31,:)==0,1,'first'))

                % catch
                % end

                drawnow nocallbacks %% more faster (25%) than just drawnow.
            end


    % else 
        % disp('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');


    % end


    %% NESTED FOR READY_TO_READ %%%
        function X1()
            find_1_all_idx = find(good_out==1); % find indexes of all points 
            if (new_frame_1_idx == 0) % no new frame for sub_1
                len_1 = length(find_1_all_idx); % how many points in this package
                % fill array from last good_out1
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
                    % zero_index - clean_new_lines(len)+2
                    % if ((zero_index - clean_new_lines(len)+2)> size_asep)
                    % clean_new_lines(len)
                    % clean_new_lines(len-1)
                    zero_index = clean_new_lines(len)+size_asep;

                       % [~,size_asep]=size(A_sep{len});
                    % if ((zero_index - clean_new_lines(len)+2)> size_asep)
                       % zero_index = clean_new_lines(len)+2 + size_asep;
                    % end

                    A_sep{len+1}=A_1(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_1) % we dont need to reverse frame..
                        M_1(1,:)=M_1_reversed_frame_last_line;
                        temp_row_1=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_1(temp_row_1,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_1(temp_row_1, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_1(temp_row_1, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in

                                            % A_sep{i}(3*(j-1)+2)*720*0.15/ ( A_sep{i}(3*(j-1)+3) )
                                        % catch
                                            % disp('wasted M_1');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_1(temp_row_1,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_1(temp_row_1, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15  / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_1');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j


                            % if(i>1 && i<len+1)
                            %     [c,lags]=xcorr(M_1(temp_row_1,:),M_1(temp_row_1-1,:))   
                            % end

                            line_reversed=~line_reversed; % change polarity
                            temp_row_1=temp_row_1+1; % next line
                        end  % for i
                        M_1_not_reversed_frame_last_line=M_1(temp_row_1-1,:);

                    else % we need to reverse frame
                        temp_row_1=1;
                        line_reversed=~first_line_reverse;
                        % loop for all lines
                        M_1(len+2,:)=M_1_not_reversed_frame_last_line;
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_1(temp_row_1,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_1(temp_row_1, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_1');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_1(temp_row_1,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_1(temp_row_1, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_1');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_1=temp_row_1+1; % next line
                        end  % for i


                        M_1_reversed_frame_last_line=M_1(1,:);
                        if (show_dimenshions)
                            find(M_1(1,:)==0,1,'first')
                        end
                    end % frame reversed
                    frame_reversed_1=~frame_reversed_1;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{1})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(1),'CData',M_1);
                redraw_1=true;    

                %% Previous frame is done -> A_1 is complete -> prcess it
                M_1=zeros(maximum_y_points_1,maximum_x_points_1,type_of_M);
                A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array

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





    %% A2 contains all point for sub #2
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

                if (len>0) % sometimes we can read only new frame, without new_line
                    % remove last digit from 13 13, % overflow sometimes.. for clean_new_lines, so use uint32
                    clean_new_lines=zeros(1,len,'uint32');
                    for i=1:len
                        clean_new_lines(i)=new_lines(2*i-1);
                    end
                    

                    %% ASSUME, that row cannot start from new line !!!
                    A_sep=cell(1,len+1); % preallocated memory, carefull size
            
                    A_sep{1}=A_2(1:clean_new_lines(1)-2); % process first li11ne, outside loop, since start from 1, but not new_lines
                    
                    for i=2:len % if <1 not processing.
                        A_sep{i} = A_2(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
                    end

                    [~,size_asep]=size(A_sep{len});
                    zero_index = clean_new_lines(len)+size_asep;
                    A_sep{len+1}=A_2(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 

                    % start from the beggining both for reversde & not reversed frames
                    if (~frame_reversed_2) % we dont need to reverse frame..
                        M_2(1,:)=M_2_reversed_frame_first_line;
                        temp_row_2=2;
                        % line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                        
                            for j=1:size_A_sepi
                                % if (~line_reversed) % if we dont need to reverse

                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_2(temp_row_2,j)=replace_to;
                                    else
                                        M_2(temp_row_2, j)=  A_sep{i}(3*(j-1)+2)*720*0.15 /   A_sep{i}(3*(j-1)+3)     ; % in
                                    end     
                                % else   % if we must reversed
                                    % if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        % M_2(temp_row_2,size_A_sepi+1-j)=replace_to;
                                    % else
                                        % M_2(temp_row_2, size_A_sepi+1-j)= A_sep{i}(3*(j-1)+2)*720*0.15 / A_sep{i}(3*(j-1)+3) ; % in
                                    % end 
                                % end % reversed
                            end % for j
                            % line_reversed=~line_reversed; % change polarity
                            temp_row_2=temp_row_2+1; % next line
                        end  % for i
                        % M_2_not_reversed_frame_last_line=M_2(temp_row_2-1,:);
                    else % we need to reverse frame
                        temp_row_2=len+1;
                        % line_reversed=~first_line_reverse;
                        % loop for all lines
                        % M_2(len+2,:)=M_2_not_reversed_frame_last_line;
                        for i=1:len+1%len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            for j=1:size_A_sepi
                                % if (~line_reversed) % if not reversed1
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_2(temp_row_2,j)=replace_to;
                                    else
                                        M_2(temp_row_2, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in
                                    end     
                                % else   % if we must reversed                                 
                                    % if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        % M_2(temp_row_2,size_A_sepi+1-j)=replace_to;
                                    % else
                                        % M_2(temp_row_2, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in
                                    % end 
                                % end % reversed
                            end % for j
                            % line_reversed=~line_reversed; % change polarity
                            temp_row_2=temp_row_2-1; % next line
                        end  % for i
                        M_2_reversed_frame_first_line=M_2(1,:);
                        % M_2_reversed_frame_last_line=M_2(temp_row_2-1,:);


                    end % frame reversed
                    frame_reversed_2=~frame_reversed_2;
                        


                    % disp(['Matrix is ',  num2str(length(A_sep{1})/2) 'x' num2str(len)  ]);
                % else
                %      temp_row_2=1;
                %     for  j=1:300
                %         M_2(temp_row_2, j)=  A_2(3*(j-1)+2)*720*0.15 /   A_2(3*(j-1)+3)     ; % in                    
                %     end

              














                % combine image
                M_2_sorted=zeros(maximum_y_points_2,maximum_x_points_2,type_of_M);
                if (avg_sepatare_on)
                    best_idx_arr=zeros(1,len+1);
                    for i=1:len+1
                        size_x=fix(length(A_sep{i})/6);
                        for j=-avg_delta:1:avg_delta
                            sum_1=sum(round(M_2(i,1:size_x+j)));
                            sum_2=sum(round(M_2(i,size_x+j+1:end)));
                            diff_sum=abs(sum_2-sum_1);
                            if j==-avg_delta
                                best_sum=diff_sum;
                                best_idx=j;
                            elseif diff_sum < best_sum
                                best_sum=diff_sum;
                                best_idx=j;
                            end
                        end
                        best_idx_arr(i)=size_x+best_idx;
                    end                  
                end


                for i=1:len+1
                    size_x=fix(length(A_sep{i})/6);
                    if (avg_sepatare_on)
                        M_2_sorted(2*i-1,1:best_idx_arr(i))=M_2(i,1:best_idx_arr(i));
                        M_2_sorted(2*i,2*size_x-best_idx_arr(i):-1:1)=M_2(i,best_idx_arr(i)+1:2*size_x);
                    else
                        M_2_sorted(2*i-1,1:size_x)=M_2(i,1:size_x);
                        M_2_sorted(2*i, size_x:-1:1)=M_2(i,size_x+1:2*size_x);
                    end
                end

                
                if (frame_reversed_2)
                    total_length=2*(len+2);
                    size_x=fix(length(A_sep{i})/6);
                    M_2_sorted(2*(len+2)-1,1:size_x)=M_2((len+2),1:size_x);
                    M_2_sorted(2*(len+2), size_x:-1:1)=M_2((len+2),size_x+1:2*size_x);
                else
                    total_length=2*(len+1);
                end


                % if(counter==50)
                %     dlmwrite('real_corr_test.txt',M_2_sorted);
                %     disp('done')
                %     % find(M_2_backup(2,:)==0,5,'first')
                % end

                        
                % transform image
                if (corr_on)
                    
                    start_from=1;
                    % total_length-1
                    
                    for i=1:total_length-1
                        size_A_sepi=fix(length(A_sep{1})/6)-2; % minus 2 since sometimes number of points can be -1,-2..

                        a=M_2_sorted(i,start_from:size_A_sepi);
                        b=M_2_sorted(i+1,start_from:size_A_sepi);


                        [lags,c]=CXCORR(a,b);
                        [~,idx]=max(c); %% can analyze only half, or even only first 10.. (in case of HR).
                        if idx<max_shift
                            % disp('CORR')
                            M_2_sorted(i+1,start_from:size_A_sepi)=circshift(M_2_sorted(i+1,start_from:size_A_sepi),[0 lags(idx)]);
                        end
                    end
                end






               end      % len ~=0
                %%% END SEPARATION %%%

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


                % find(M_2(16,:)==0,2,'first')
                % find(M_2(31,:)=='NaN',2,'first')
                % find(M_2(end-1,:)==0,2,'last')



                % if(counter==50)
                %     dlmwrite('real_corr_test_2.txt',M_2_sorted(:,start_from:size_A_sepi));
                %     disp('done')
                %     % find(M_2_backup(2,:)==0,5,'first')
                % end



                set(pl(1),'CData',M_2);
                set(pl(2),'CData',M_2_sorted);
                redraw_2=true;    

                %% Previous frame is done -> A_2 is complete -> prcess it
                M_2=zeros(maximum_y_points_2,maximum_x_points_2,type_of_M);
                A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % +1 since new line saved in this array

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


    %% A2 contains all point for sub #2
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
                    % zero_index_all=find(A_3==0,number_of_zeros,'first')-1; % we have keeping MORE!!! some times we have 0 in REAL data (ALREADY FIXED IN FPGA.., but anyway keep it)
                    
                    % try % sometimes we start from case, when first line is empty -> wrong zero_first..
                    % zero_index=zero_index_all(end); % take real matrix zeros..
                    

                    [~,size_asep]=size(A_sep{len});
                    % zero_index - clean_new_lines(len)+2
                    % if ((zero_index - clean_new_lines(len)+2)> size_asep)
                    % clean_new_lines(len)
                    % clean_new_lines(len-1)
                    zero_index = clean_new_lines(len)+size_asep;
                    % end



                    A_sep{len+1}=A_3(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_3) % we dont need to reverse frame..
                        M_3(1,:)=M_3_reversed_frame_last_line;
                        temp_row_3=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')


                                 % if (A_sep{i}(3*(j-1)+2)>500)

                                 %        A_sep{i}(3*(j-1)+2:3*(j-1)+3)
                                 %        % M_3(temp_row_3,size_A_sepi+1-j)=0;
                                 % end

                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_3(temp_row_3,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_3(temp_row_3, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_3(temp_row_3, j)=  A_sep{i}(3*(j-1)+2)*720*0.15 /   A_sep{i}(3*(j-1)+3)     ; % in

                                            % double(A_sep{i}(3*(j-1)+2)*720*0.15) / ( A_sep{i}(3*(j-1)+3) )) % in
                                            % A_sep{i}(3*(j-1)+2)*720*0.15/ ( A_sep{i}(3*(j-1)+3) )
                                        % catch
                                            % disp('wasted M_3');
                                        % end % try
                                    end     
                                else   % if we must reversed

      
                                 % if (A_sep{i}(3*(j-1)+2)>500)

                                 %        A_sep{i}(3*(j-1)+2:3*(j-1)+3)
                                 %        % M_3(temp_row_3,size_A_sepi+1-j)=0;
                                 % end


                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_3(temp_row_3,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_3(temp_row_3, size_A_sepi+1-j)= A_sep{i}(3*(j-1)+2)*720*0.15 / A_sep{i}(3*(j-1)+3) ; % in
                                        % catch
                                            % disp('wasted M_3');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j


                            % if(i>1 && i<len+1)
                            %     [c,lags]=xcorr(M_3(temp_row_3,:),M_3(temp_row_3-1,:))   
                            % end

                            line_reversed=~line_reversed; % change polarity
                            temp_row_3=temp_row_3+1; % next line
                        end  % for i
                        M_3_not_reversed_frame_last_line=M_3(temp_row_3-1,:);

                    else % we need to reverse frame
                        temp_row_3=1;
                        line_reversed=~first_line_reverse;
                        % loop for all lines
                        M_3(len+2,:)=M_3_not_reversed_frame_last_line;
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed1

                                 % if (A_sep{i}(3*(j-1)+2)>500)

                                 %        A_sep{i}(3*(j-1)+2:3*(j-1)+3)
                                 %        % M_3(temp_row_3,size_A_sepi+1-j)=0;
                                 % end

                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_3(temp_row_3,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_3(temp_row_3, j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in
                                        % catch
                                            % disp('wasted M_3');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                 

                                 % if (A_sep{i}(3*(j-1)+2)>500)
                                 %        A_sep{i}(3*(j-1)+2:3*(j-1)+3)

                                 %        % M_3(temp_row_3,size_A_sepi+1-j)=0;
                                 % end


                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_3(temp_row_3,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_3(temp_row_3, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 /  A_sep{i}(3*(j-1)+3) ; % in
                                        % catch
                                            % disp('wasted M_3');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_3=temp_row_3+1; % next line
                        end  % for i


                        M_3_reversed_frame_last_line=M_3(1,:);
                    end % frame reversed
                    frame_reversed_3=~frame_reversed_3;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{1})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(3),'CData',M_3);
                redraw_3=true;    

                % only for testing
                % disp('min')
                % max(min(M_3))
                % disp('max')
                % max(max(M_3))
                % M_3_backup=M_3
                % A_3

                % delay_ms(10000)
                % break
                %% Previous frame is done -> A_3 is complete -> prcess it
                M_3=zeros(maximum_y_points_3,maximum_x_points_3,type_of_M);
                A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array

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



    %% A2 contains all point for sub #2
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
                    % zero_index - clean_new_lines(len)+2
                    % if ((zero_index - clean_new_lines(len)+2)> size_asep)
                    % clean_new_lines(len)
                    % clean_new_lines(len-1)
                    zero_index = clean_new_lines(len)+size_asep;


                    A_sep{len+1}=A_4(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_4) % we dont need to reverse frame..
                        M_4(1,:)=M_4_reversed_frame_last_line;
                        temp_row_4=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_4(temp_row_4,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_4(temp_row_4, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_4(temp_row_4, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                            % A_sep{i}(3*(j-1)+2)*720*0.15/ ( A_sep{i}(3*(j-1)+3) )
                                        % catch
                                            % disp('wasted M_4');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_4(temp_row_4,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_4(temp_row_4, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15  / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_4');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j


                            % if(i>1 && i<len+1)
                            %     [c,lags]=xcorr(M_4(temp_row_4,:),M_4(temp_row_4-1,:))   
                            % end

                            line_reversed=~line_reversed; % change polarity
                            temp_row_4=temp_row_4+1; % next line
                        end  % for i
                        M_4_not_reversed_frame_last_line=M_4(temp_row_4-1,:);

                    else % we need to reverse frame
                        temp_row_4=1;
                        line_reversed=~first_line_reverse;
                        % loop for all lines
                        M_4(len+2,:)=M_4_not_reversed_frame_last_line;
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_4(temp_row_4,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_4(temp_row_4, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_4');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_4(temp_row_4,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_4(temp_row_4, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_4');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_4=temp_row_4+1; % next line
                        end  % for i


                        M_4_reversed_frame_last_line=M_4(1,:);
                    end % frame reversed
                    frame_reversed_4=~frame_reversed_4;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{1})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(4),'CData',M_4);
                redraw_4=true;    



                % only for testing
                % M_4_backup=M_4;

                %% Previous frame is done -> A_4 is complete -> prcess it
                M_4=zeros(maximum_y_points_4,maximum_x_points_4,type_of_M);
                A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % +1 since new line saved in this array

                % fill array, which after new frame
                len_4_full=length(find_4_all_idx); % all points
                len_4=find(find_4_all_idx==new_frame_4_idx);
                for i=1:len_4_full-len_4
                    A_4(3*i-2:3*i) = good_out(find_4_all_idx(i+len_4):find_4_all_idx(i+len_4)+2);
                end
        
                len_4_before=len_4_full-len_4;
                new_frame_4_idx=0;
            end % new_frame_4

        end % function X4



    %% A2 contains all point for sub #2
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
                    % zero_index - clean_new_lines(len)+2
                    % if ((zero_index - clean_new_lines(len)+2)> size_asep)
                    % clean_new_lines(len)
                    % clean_new_lines(len-1)
                    zero_index = clean_new_lines(len)+size_asep;

                       % [~,size_asep]=size(A_sep{len});
                    % if ((zero_index - clean_new_lines(len)+2)> size_asep)
                       % zero_index = clean_new_lines(len)+2 + size_asep;
                    % end

                    A_sep{len+1}=A_5(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_5) % we dont need to reverse frame..
                        M_5(1,:)=M_5_reversed_frame_last_line;
                        temp_row_5=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_5(temp_row_5,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_5(temp_row_5, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_5(temp_row_5, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                            % A_sep{i}(3*(j-1)+2)*720*0.15/ ( A_sep{i}(3*(j-1)+3) )
                                        % catch
                                            % disp('wasted M_5');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_5(temp_row_5,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_5(temp_row_5, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15  / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_5');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j


                            % if(i>1 && i<len+1)
                            %     [c,lags]=xcorr(M_5(temp_row_5,:),M_5(temp_row_5-1,:))   
                            % end

                            line_reversed=~line_reversed; % change polarity
                            temp_row_5=temp_row_5+1; % next line
                        end  % for i
                        M_5_not_reversed_frame_last_line=M_5(temp_row_5-1,:);

                    else % we need to reverse frame
                        temp_row_5=1;
                        line_reversed=~first_line_reverse;
                        % loop for all lines
                        M_5(len+2,:)=M_5_not_reversed_frame_last_line;
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_5(temp_row_5,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_5(temp_row_5, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_5');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_5(temp_row_5,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_5(temp_row_5, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_5');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_5=temp_row_5+1; % next line
                        end  % for i


                        M_5_reversed_frame_last_line=M_5(1,:);
                    end % frame reversed
                    frame_reversed_5=~frame_reversed_5;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{1})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(5),'CData',M_5);
                redraw_5=true;    



                % only for testing
                % M_5_backup=M_5;

                %% Previous frame is done -> A_5 is complete -> prcess it
                M_5=zeros(maximum_y_points_5,maximum_x_points_5,type_of_M);
                A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % +1 since new line saved in this array

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
        
    %% A2 contains all point for sub #2
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
                    % zero_index - clean_new_lines(len)+2
                    % if ((zero_index - clean_new_lines(len)+2)> size_asep)
                    % clean_new_lines(len)
                    % clean_new_lines(len-1)
                    zero_index = clean_new_lines(len)+size_asep;

                    A_sep{len+1}=A_6(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_6) % we dont need to reverse frame..
                        M_6(1,:)=M_6_reversed_frame_last_line;
                        temp_row_6=2;
                        line_reversed=first_line_reverse;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_6(temp_row_6,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_6(temp_row_6, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_6(temp_row_6, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                            % A_sep{i}(3*(j-1)+2)*720*0.15/ ( A_sep{i}(3*(j-1)+3) )
                                        % catch
                                            % disp('wasted M_6');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_6(temp_row_6,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_6(temp_row_6, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15  / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_6');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j


                            % if(i>1 && i<len+1)
                            %     [c,lags]=xcorr(M_6(temp_row_6,:),M_6(temp_row_6-1,:))   
                            % end

                            line_reversed=~line_reversed; % change polarity
                            temp_row_6=temp_row_6+1; % next line
                        end  % for i
                        M_6_not_reversed_frame_last_line=M_6(temp_row_6-1,:);

                    else % we need to reverse frame
                        temp_row_6=1;
                        line_reversed=~first_line_reverse;
                        % loop for all lines
                        M_6(len+2,:)=M_6_not_reversed_frame_last_line;
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_6(temp_row_6,j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_6(temp_row_6, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_6');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==replace_what)
                                        M_6(temp_row_6,size_A_sepi+1-j)=replace_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_6(temp_row_6, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_6');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_6=temp_row_6+1; % next line
                        end  % for i


                        M_6_reversed_frame_last_line=M_6(1,:);
                    end % frame reversed
                    frame_reversed_6=~frame_reversed_6;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{1})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(6),'CData',M_6);
                redraw_6=true;    



                % only for testing
                % M_6_backup=M_6;

                %% Previous frame is done -> A_6 is complete -> prcess it
                M_6=zeros(maximum_y_points_6,maximum_x_points_6,type_of_M);
                A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % +1 since new line saved in this array

                % fill array, which after new frame
                len_6_full=length(find_6_all_idx); % all points
                len_6=find(find_6_all_idx==new_frame_6_idx);
                for i=1:len_6_full-len_6
                    A_6(3*i-2:3*i) = good_out(find_6_all_idx(i+len_6):find_6_all_idx(i+len_6)+2);
                end
        
                len_6_before=len_6_full-len_6;
                new_frame_6_idx=0;
            end % new_frame_6

        end % function X6

    end % function READY_TO_READ


    % disp(['Matrix is ',  num2str(length(A_sep{2})/2) 'x' num2str(len)  ]);
    % disp(['Total points/s ',  num2str(counter/10*len*length(A_sep{2})/2) ]);
    
    
    %% NESTED FUNCTION (SINCE SHARED MEMOTY, MATLAB DOENST HAVE POINTERS! ONLY IN MEX type..)    
    %% careful about A_sep size.. ALSO WE HAVE ZEROS at the end of A_1, since preallocated..

        
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


    function r1_callback(source, event)

        % MODE_NOT_CHAGED=false;
                % flushinput(s);


        left_new=uint16([]);
        disp('mode 1');


        x_size=320;
        y_size=5;
        show_x_min=1;
        show_x_max=x_size;
        show_y_min=0;
        show_y_max=y_size;

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

        M_1=zeros(maximum_y_points_1,maximum_x_points_1,type_of_M);
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

        M_2=zeros(maximum_y_points_2,maximum_x_points_2,type_of_M);
        A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % +1 since new line saved in this array
        M_2_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_2_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        % drawnow

        %X3
        maximum_x_points_3= x_size; % make it bigger 5% 
        maximum_y_points_3= y_size; % make it bigger 5%
        temp_row_3=1;
        len_3_before=0;
        new_frame_3_idx=0;
        redraw_3=false;

        M_3=zeros(maximum_y_points_3,maximum_x_points_3,type_of_M);
        A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array
        M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        % MODE_NOT_CHAGED=true;

        fwrite(s,uint8('h'),'uint8');
        delay_ms(50); % wait to get bias
        flushinput(s);
        fwrite(s,uint8('d'),'uint8');

    end


    function r2_callback(source, event)
        % MODE_NOT_CHAGED=false;
            % flushinput(s);
        left_new=uint16([]);

        % serialbreak(s,5000);
        disp('mode 2');

        x_size=140;
        y_size=30;
        
        % x_size=280;
        % y_size=35;

        show_x_min=1;
        show_x_max=x_size;
        show_y_min=0;
        show_y_max=y_size;


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

        M_1=zeros(maximum_y_points_1,maximum_x_points_1,type_of_M);
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

        M_2=zeros(maximum_y_points_2,maximum_x_points_2,type_of_M);
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

        M_3=zeros(maximum_y_points_3,maximum_x_points_3,type_of_M);
        A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array
        M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

        % MODE_NOT_CHAGED=true;

        % set(pl(2),'CData',M_2);


        fwrite(s,uint8('h'),'uint8');
        delay_ms(50); % wait to get bias
        flushinput(s);
        fwrite(s,uint8('f'),'uint8');
    end


    function r3_callback(source, event)
        left_new=uint16([]);

        % serialbreak(s,5000);
        disp('mode 3');

        x_size=280;
        y_size=62;

        show_x_min=1;
        show_x_max=x_size;
        show_y_min=0;
        show_y_max=y_size;


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

        M_1=zeros(maximum_y_points_1,maximum_x_points_1,type_of_M);
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

        M_2=zeros(maximum_y_points_2,maximum_x_points_2,type_of_M);
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

        M_3=zeros(maximum_y_points_3,maximum_x_points_3,type_of_M);
        A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array
        M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
        M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


        fwrite(s,uint8('h'),'uint8');
        delay_ms(50);
        flushinput(s);
        fwrite(s,uint8('g'),'uint8');
    end


    function reverse_image(source, event)
        frame_reversed_1=~frame_reversed_1;
        frame_reversed_2=~frame_reversed_2;
        frame_reversed_3=~frame_reversed_3;
    end


    function corr_on_callback(source,event)
      % get(source)
      % str=get(source,'String');
      val=get(source, 'Value');
      % fwrite(s,uint8('p'),'uint8');
      if (val)
        corr_on=1;
        % set(source,'String', 'OFF')
      else
        corr_on=0;
        % set(source,'String', 'CORR')
      end

    end



    function avg_separate_callback(source,event)
      % get(source)
      % str=get(source,'String');
      val=get(source, 'Value');
      % fwrite(s,uint8('p'),'uint8');
      if (val)
        avg_sepatare_on=1;
        % set(source,'String', 'OFF')
      else
        avg_sepatare_on=0;
        % set(source,'String', 'CORR')
      end

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


    function [ha, pos] = tight_subplot(Nh, Nw, gap, marg_h, marg_w)

        % tight_subplot creates "subplot" axes with adjustable gaps and margins
        %
        % [ha, pos] = tight_subplot(Nh, Nw, gap, marg_h, marg_w)
        %
        %   in:  Nh      number of axes in hight (vertical direction)
        %        Nw      number of axes in width (horizontaldirection)
        %        gap     gaps between the axes in normalized units (0...1)
        %                   or [gap_h gap_w] for different gaps in height and width 
        %        marg_h  margins in height in normalized units (0...1)
        %                   or [lower upper] for different lower and upper margins 
        %        marg_w  margins in width in normalized units (0...1)
        %                   or [left right] for different left and right margins 
        %
        %  out:  ha     array of handles of the axes objects
        %                   starting from upper left corner, going row-wise as in
        %                   subplot
        %        pos    positions of the axes objects
        %
        %  Example: ha = tight_subplot(3,2,[.01 .03],[.1 .01],[.01 .01])
        %           for ii = 1:6; axes(ha(ii)); plot(randn(10,ii)); end
        %           set(ha(1:4),'XTickLabel',''); set(ha,'YTickLabel','')

        % Pekka Kumpulainen 21.5.2012   @tut.fi
        % Tampere University of Technology / Automation Science and Engineering


        if nargin<3; gap = .02; end
        if nargin<4 || isempty(marg_h); marg_h = .05; end
        if nargin<5; marg_w = .05; end

        if numel(gap)==1; 
            gap = [gap gap];
        end
        if numel(marg_w)==1; 
            marg_w = [marg_w marg_w];
        end
        if numel(marg_h)==1; 
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


    function exit_callback(source,event)
        % EXIT=1;
        fwrite(s,uint8('h'),'uint8');
        fclose(s);
        close
        clear
        return
        % exit
    end

    function [x,c]=CXCORR(a,b)
        % na=norm(a);
        % nb=norm(b);
        % a=a/na; %normalization
        % b=b/nb;
        b_size=length(b);
        c=zeros(b_size);
        for k=1:b_size
            c(k)=a*b';
            b=[b(end),b(1:end-1)]; %circular shift
        end
        x=[0:length(b)-1]; %lags
    end




    % function pause the program
    function delay_ms(seconds)
        tic;
        while toc < seconds/1000
        end
    end



end % main