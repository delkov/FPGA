clear; clc
delete(instrfindall);

main();
function main()
    cd('/home/delkov/mojo/SIMPLE/txt');

    %% CONSTANT
    % SERIAL
    baud_rate=1000000;
    buffer_size=1000000; % in bytes
    size_to_read=500; % read when reached in buffer

    % % PROFILING
    % profile_on=0;
    % record_time=60; % profile time
    
    % GLOBAL
    start_command='d';
    x_size=500;
    y_size=220;
 
    % IMAGE CORRECTIONS
    filter_data=0;
    corr_on=0;
    max_shift=35;
    replace_if_bigger_than=60; 

    % PLOT
    % number_of_sub=6;
    % cmap_name=jet_black_end; % mine, parula_black, jet_black, jet_black_end, jet_white, hot
    matrix_default_value=0;
    color_M1=[0 10000];
    color_M2=[0 10];


    show_separated_lines = 0;
    show_colorbar = 1;
    % first_line_reverse=true;
    show_x_min=1;
    show_x_max=x_size;
    show_y_min=0;
    show_y_max=y_size;
    y_tick_step=20;
    x_tick_step=40;
    type_of_M='double'; 
    type_of_A='double'; % can be uint32 & double() below.. but not much speed increased

    %% END CONSTANT


    %X1
    maximum_x_points_1= x_size; % make it bigger 5% 
    maximum_y_points_1= y_size; % make it bigger 5%
    % len_1_before=0;
    % new_frame_1_idx=0;
    % redraw_1=false;
    %X2
    maximum_x_points_2= x_size; % make it bigger 5% 
    maximum_y_points_2= y_size; % make it bigger 5%
    % len_2_before=0;
    % new_frame_2_idx=0;
    % redraw_2=false;
   
    M_1_backup=zeros(maximum_y_points_1,maximum_x_points_1,type_of_M); 
    M_2_backup=zeros(maximum_y_points_2,maximum_x_points_2,type_of_M); 
    M_1=matrix_default_value*ones(maximum_y_points_1,maximum_x_points_1,type_of_M); % uint8 is fine, but will be rough
    M_2=matrix_default_value*ones(maximum_y_points_2,maximum_x_points_2,type_of_M);
             

    % if ~exist('h','Var')   
    %     % h=figure('Name','LViewer','NumberTitle','off','MenuBar', 'none', 'ToolBar','none','units','normalized','outerposition',[0 0 1 1], 'color', 'black');
        h=figure('MenuBar', 'none', 'ToolBar','none','units','normalized','outerposition',[0 0 1 1], 'color', 'black');
        
        bg = uibuttongroup(h, 'Visible','off',...
                  'Position',[0 0 1 .075],...
                  'HandleVisibility','off');
        % S.r1 = uicontrol(bg,'Style',...
        %                   'radiobutton',...
        %                   'String','Option 1',...
        %                   'Units', 'normalized',...
        %                   'OuterPosition',[0.05 0 0.5 0.8],...
        %                   'HandleVisibility','off',...
        %                   'Callback', @r1_callback);
        % S.r2 = uicontrol(bg,'Style','radiobutton',...
        %                   'String','Option 2',...
        %                   'Units', 'normalized',...
        %                   'OuterPosition',[0.15 0 0.5 0.8],...
        %                   'Value',1,...
        %                   'HandleVisibility','off',...
        %                   'Callback', @r2_callback);
        % S.r3 = uicontrol(bg,'Style','radiobutton',...
        %                   'String','Option 3',...
        %                   'Units', 'normalized',...
        %                   'OuterPosition',[0.25 0 0.5 0.8],...
        %                   'HandleVisibility','off',...
        %                   'Callback', @r3_callback);
        S.sl = uicontrol(bg,'Style','slider',...
                          'String','Distance range',...
                          'Units', 'normalized',...
                          'OuterPosition',[0.35 0.2 0.2 0.4],...
                          'HandleVisibility','on',...
                          'min',1,'max',10000,'val', color_M2(2),...  
                          'SliderStep',[0.010101 0.1],... %0101011
                          'Callback', @slider_callback);
          % Add a text uicontrol to label the slider.
        S.ed = uicontrol(bg,'Style','edit',...
                          'String', num2str(color_M2(2)),...
                          'Units', 'normalized',...
                          'InnerPosition',[0.55 0.2 0.05 0.4],...
                          'HandleVisibility','on');
        % S.btn = uicontrol(bg, 'Style', 'pushbutton', 'String', 'Flip',...
        %                   'Units', 'normalized',...
        %                   'OuterPosition',[0.62 0.2 0.05 0.4],...
        %                   'HandleVisibility','on',...
        %                   'Callback', @reverse_image);      
        % S.btn2 = uicontrol(bg, 'Style', 'checkbox', 'String', 'Filter',...
        %                   'Units', 'normalized',...
        %                   'OuterPosition',[0.68 0.2 0.05 0.4],...
        %                   'HandleVisibility','on',...
        %                   'Callback', @filter_data_callback);    
        % S.btn3 = uicontrol(bg, 'Style', 'checkbox', 'String', 'CORR',...
        %                   'Units', 'normalized',...
        %                   'OuterPosition',[0.71 0.2 0.05 0.4],...
        %                   'HandleVisibility','on',...
        %                   'Callback', @corr_on_callback);    
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

    %     % cla
    %     % ax = axes('Parent', h);        
          [ha, ~] = tight_subplot(1,2,[0 0],[.1 0.01],[.02 .02]);


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
        ax.CLim = [color_M1(1) color_M1(2)]; % color limit
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
        ax.CLim = [color_M2(1) color_M2(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % set(ha,'YTickLabel',[]) 


    %     colormap('jet');
    % end
        
        % if (show_colorbar)
        %     c=colorbar;
        %     c.Color = 'white';
        %     c.Position=[0.96 0.1 0.02 0.89];
        % end
    % wait initialization of frames % co.
    % delay_ms(1000);
    
    % drawnow;
    % bad_counter=0;

    % M_1_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    % M_1_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    % M_2_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
    % M_2_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);


    count_old=1;
    temp_row=1;%maximum_y_points_2-1;
    left_new=uint32([]);


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
    
    % fileID = fopen('serial_checking.txt','w');


    %% NESTED to MAIN %%
    function READY_TO_READ(~,~)
        % both of them 8 bit -> it also 8bit; PREALLOCATED for out can be done, but not necessary
        new = [left_new; uint32(fread(s,size_to_read,'uint8'))];

        zeros_amount=6;
        idx_begin=find(new==2,zeros_amount,'first');
        idx_last=find(new==2,zeros_amount,'last');
        for i=1:zeros_amount
            if (new(idx_begin(i)+1) == 0 && new(idx_begin(i)+9) == 2)
                idx_begin=idx_begin(i);
                for j=zeros_amount:-1:1
                    if (new(idx_last(j)-8) == 0 && new(idx_last(j)-9) == 2)
                        idx_last=idx_last(j);
                        break
                    end
                end
                break
            end
        end

        left_new=new(idx_last:end);
        new = new(idx_begin:idx_last-1);
        new_size=length(new)/9; % how many packages

        % size(new)
        % new(1:10)

        if mod(new_size,1)==0
            new_length=4*new_size; % since 4 digits from 1 9bytes package
            good_out=zeros(1,new_length,'uint32');
            
            for i=1:1:new_size
                good_out(4*i-3)=new(9*i-8)+new(9*i-7)*256;
                good_out(4*i-2)=new(9*i-6)+new(9*i-5)*256+new(9*i-4)*65536;
                good_out(4*i-1)=new(9*i-3)+new(9*i-2)*256;
                good_out(4*i)=new(9*i-1)+new(9*i)*256;
            end
            good_out_backup=good_out;            


            % fprintf(fileID,'%d\n', good_out); 



            %% NEW FRAME FIRST PART!! 14 x3 times expected
            new_frame=find(good_out==14,1,'last');
            if (new_frame)
                frame_reversed_2=true;
                % disp('new frame')
                good_out=good_out(1:new_frame-2 );
            else
                new_frame=find(good_out==15,1,'last');
                if (new_frame)
                    frame_reversed_2=false;
                    good_out=good_out(1:new_frame-2 );
                end
            end

            [A_sep, start_new_row]=SEP(good_out);
            len_A_sep=length(A_sep);

            if (len_A_sep-1==0)  % no new lines input
                % disp('SINGLE LINE')
                len_A_sepi_last=length(A_sep{len_A_sep});
                if (start_new_row==1)
                    temp_row=temp_row+1;
                    count_old=1;
                end
                try
                    [M_1(temp_row, count_old:count_old+len_A_sepi_last/4-1), M_2(temp_row, count_old:count_old+len_A_sepi_last/4-1)] = TOF(A_sep{len_A_sep});

                catch
                    disp('size erro')
                end
                count_old=count_old+len_A_sepi_last/4; % shift +1 already included
            else  % we have at least one new line
                % processing from 1 to last-1 lines
                for i=1:len_A_sep-1
                    % disp('MANY LINES')
                    len_A_sepi=length(A_sep{i});
                    if (start_new_row) %% directly jump to the next row, no need to write to prev. line
                       % disp('start new row')
                        if (i==1) % jump to next row
                            temp_row=temp_row+1;
                        end
                        try
                            [M_1(temp_row, 1:len_A_sepi/4), M_2(temp_row, 1:len_A_sepi/4)] = TOF(A_sep{i});  
                            temp_row=temp_row+1;
                        catch
                            disp('size error')
                        end
                    else 
                        % disp('start new row 0')
                        if (i==1)
                            try
                                [M_1(temp_row,count_old:count_old+len_A_sepi/4-1), M_2(temp_row,count_old:count_old+len_A_sepi/4-1)] = TOF(A_sep{i});
                                temp_row=temp_row+1;
                            catch
                                disp('size error')
                            end
                            count_old=1;
                        else % just new lines now.. already read data for past line
                            try
                                M_2(temp_row, 1:len_A_sepi/4) = TOF(A_sep{i});  
                                temp_row=temp_row+1;
                            catch
                                disp('size error')
                            end
                        end
                    end % new row
                end  % for

                %% WERE many lines, process last line
                if (len_A_sep==1 & start_new_row==1)
                    temp_row=temp_row+1;
                end

                % disp('PROCESS LAST LINE')
                len_A_sepi_last=length(A_sep{len_A_sep});
                % disp(A_sep{len_A_sep});
                count_old=1;
                try
                    [M_1(temp_row, count_old:count_old+len_A_sepi_last/4-1), M_2(temp_row, count_old:count_old+len_A_sepi_last/4-1)] = TOF(A_sep{len_A_sep});
                    count_old=len_A_sepi_last/4+1;
                catch
                    disp('size error')
                end
            end % check how many lines

            %% NEW FRAME SECOND PART
            if (new_frame)
                good_out=good_out_backup(new_frame+3:end);
                count_old=1;
                temp_row=1;%maximum_y_points_2-1;
                % M_1=zeros(maximum_y_points_1,maximum_x_points_1); %% should be commented
                % M_2=zeros(maximum_y_points_2,maximum_x_points_2); %% should be commented
                
                [A_sep, start_new_row]=SEP(good_out);
                % disp('A_sep')
                % disp(A_sep)
                % for i=1:length(A_sep)
                %     disp(A_sep{i}')
                % end
                len_A_sep=length(A_sep);

                if (len_A_sep-1==0)  % no new lines input
                    % disp('SINGLE LINE')
                    len_A_sepi_last=length(A_sep{len_A_sep});
                    if (start_new_row==1)
                        temp_row=temp_row+1;
                        count_old=1;
                    end
                    try
                        [M_1(temp_row, count_old:count_old+len_A_sepi_last/4-1), M_2(temp_row, count_old:count_old+len_A_sepi_last/4-1)] = TOF(A_sep{len_A_sep});
                    catch
                        disp('size erro')
                    end
                    count_old=count_old+len_A_sepi_last/4; % shift +1 already included
                else  % we have at least one new line
                % processing from 1 to last-1 lines
                    for i=1:len_A_sep-1
                        % disp('MANY LINES')
                        len_A_sepi=length(A_sep{i});
                        if (start_new_row) %% directly jump to the next row, no need to write to prev. line
                            disp('start new row')
                            if (i==1) % jump to next row
                                temp_row=temp_row+1;
                            end
                            try
                                [M_1(temp_row, 1:len_A_sepi/4), M_2(temp_row, 1:len_A_sepi/4)] = TOF(A_sep{i});  
                                temp_row=temp_row+1;
                            catch
                                disp('size error')
                            end
                        else 
                            disp('start new row 0')
                            if (i==1)
                                try
                                    [M_1(temp_row,count_old:count_old+len_A_sepi/4-1), M_2(temp_row,count_old:count_old+len_A_sepi/4-1)] = TOF(A_sep{i});
                                    temp_row=temp_row+1;
                                catch
                                    disp('size error')
                                end
                                count_old=1;
                            else % just new lines now.. already read data for past line
                                try
                                    % M_1(temp_row, 1:len_A_sepi/4) = TOF_1(A_sep{i});  
                                    [M_1(temp_row, 1:len_A_sepi/4), M_2(temp_row, 1:len_A_sepi/4)] = TOF(A_sep{i});  
                                    temp_row=temp_row+1;
                                catch
                                    disp('size error')
                                end
                            end
                        end % new row
                    end  % for

                %% WERE many lines, process last line
                if (len_A_sep==1 & start_new_row==1)
                    % if (start_new_row==1)            
                        temp_row=temp_row+1;
                    end

                    % disp('PROCESS LAST LINE')
                    len_A_sepi_last=length(A_sep{len_A_sep});
                    % disp(A_sep{len_A_sep});
                    count_old=1;
                    try 
                        [M_1(temp_row, count_old:count_old+len_A_sepi_last/4-1), M_2(temp_row, count_old:count_old+len_A_sepi_last/4-1)] = TOF(A_sep{len_A_sep});
                        count_old=len_A_sepi_last/4+1;
                    catch
                        disp('size error')
                    end
                end % check how many lines
            end % if new frame



                set(pl(1),'CData',M_1);
                set(pl(2),'CData',M_2);
                drawnow nocallbacks






        else
            disp('bad data occur')
            % flushinput(s)
            % bad_counter=bad_counter+1;
            % disp(['how much read', num2str(how_much_read_size_to_read)]);
            % fileID = fopen('serial_checking.txt','w');
            % delay_ms(10000);

            % A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % uint32 is fine. CALIB2 is ~32000
            % len_2_before=0;
            % M_1_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            % M_1_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            % M_2_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);
            % M_2_not_reversed_frame_last_line=matrix_default_value*ones(1,x_size,type_of_M);

            % left_new=uint16([]);
        end





        function [A_sep, start_new_row] = SEP(A)
            new_lines=find(A==13);
            len=length(new_lines);
            if (len>0)
                if (new_lines(1)==2)
                    start_new_row=1;
                    for i=1:len-1 % if <1 no processing.
                        A_sep{i} = A(new_lines(i)+3:new_lines(i+1)-2);   
                    end    
                    A_sep{len}=A(new_lines(len)+3:end);
                else
                    start_new_row=0;
                    A_sep{1}=A(1:new_lines(1)-2);
                    for i=2:1:len % if <1 no processing.
                        A_sep{i} = A(new_lines(i-1)+3:new_lines(i)-2);
                    end    
                    A_sep{len+1}=A(new_lines(len)+3:end);  
                end
            else
                % disp('no new lines..')
                start_new_row=0;
                A_sep{1}=A; 
            end % len > 0
        end % SEP


        function [TOF_AR_M1 TOF_AR_M2] = TOF(A)%,CLK_PERIOD,CALIB_PERIODS)
                size_B=length(A)/4;
                TOF_AR_M1=zeros(1,size_B);
                TOF_AR_M2=zeros(1,size_B);
                for i=1:size_B
                    TOF_AR_M1(i)= A(4*(i-1)+2);
                    TOF_AR_M2(i)= double(A(4*(i-1)+3)*720*0.15) / double(A(4*(i-1)+4));
                end
        end % TOF_AR

      
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
                    set(ha(:),'CLim',[color_M1(1) E]); 
                else
                    set(h,'string',L{3}) % User tried to set slider out of range. 
                end
            case S.sl
                set(S.ed,'string',sprintf('%.2f',get(h,'value'))) % Set edit to current slider.
                set(ha(1),'CLim',[color_M1(1) get(h,'value')]); 
            otherwise
                % Do nothing, or whatever.
        end

    end % function


    % function r1_callback(~, event)
    %     left_new=uint16([]);
    %     disp('mode 1');

    %     x_size=320;
    %     y_size=4;
    %     show_x_min=1;
    %     show_x_max=x_size;
    %     show_y_min=0.5;
    %     show_y_max=y_size+0.5;

    %     set(ha(:),'XLim',[show_x_min show_x_max]);
    %     set(ha(:),'YLim',[show_y_min show_y_max]);
    %     set(ha(:), 'XTick', [0:x_tick_step:show_x_max]);
    %     set(ha(:), 'YTick', [0:y_tick_step:show_y_max]);

    %     %X1
    %     maximum_x_points_1= x_size; % make it bigger 5% 
    %     maximum_y_points_1= y_size; % make it bigger 5%
    %     temp_row_1=1;
    %     len_1_before=0;
    %     new_frame_1_idx=0;
    %     redraw_1=false;

    %     M_1=matrix_default_value*ones(maximum_y_points_1,maximum_x_points_1,type_of_M);
    %     A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array
    %     M_1_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_1_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X2
    %     maximum_x_points_2= x_size; % make it bigger 5% 
    %     maximum_y_points_2= y_size; % make it bigger 5%
    %     temp_row_2=1;
    %     len_2_before=0;
    %     new_frame_2_idx=0;
    %     redraw_2=false;

    %     M_2=matrix_default_value*ones(maximum_y_points_2,maximum_x_points_2,type_of_M);
    %     A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % +1 since new line saved in this array
    %     M_2_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_2_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X3
    %     maximum_x_points_3= x_size; % make it bigger 5% 
    %     maximum_y_points_3= y_size; % make it bigger 5%
    %     temp_row_3=1;
    %     len_3_before=0;
    %     new_frame_3_idx=0;
    %     redraw_3=false;

    %     M_3=matrix_default_value*ones(maximum_y_points_3,maximum_x_points_3,type_of_M);
    %     A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array
    %     M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


    %     %X4
    %     maximum_x_points_4= x_size; % make it bigger 5% 
    %     maximum_y_points_4= y_size; % make it bigger 5%
    %     temp_row_4=1;
    %     len_4_before=0;
    %     new_frame_4_idx=0;
    %     redraw_4=false;

    %     M_4=matrix_default_value*ones(maximum_y_points_4,maximum_x_points_4,type_of_M);
    %     A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % +1 since new line saved in this array
    %     M_4_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_4_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X5
    %     maximum_x_points_5= x_size; % make it bigger 5% 
    %     maximum_y_points_5= y_size; % make it bigger 5%
    %     temp_row_5=1;
    %     len_5_before=0;
    %     new_frame_5_idx=0;
    %     redraw_5=false;

    %     M_5=matrix_default_value*ones(maximum_y_points_5,maximum_x_points_5,type_of_M);
    %     A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % +1 since new line saved in this array
    %     M_5_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_5_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


    %     %X6
    %     maximum_x_points_6= x_size; % make it bigger 5% 
    %     maximum_y_points_6= y_size; % make it bigger 5%
    %     temp_row_6=1;
    %     len_6_before=0;
    %     new_frame_6_idx=0;
    %     redraw_6=false;

    %     M_6=matrix_default_value*ones(maximum_y_points_6,maximum_x_points_6,type_of_M);
    %     A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % +1 since new line saved in this array
    %     M_6_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_6_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);



    %     fwrite(s,uint8('h'),'uint8');
    %     delay_ms(50); % wait to get bias
    %     flushinput(s);
    %     fwrite(s,uint8('d'),'uint8');

    % end


    % function r2_callback(~, event)
    %     left_new=uint16([]);
    %     disp('mode 2');

    %     x_size=140;
    %     y_size=8;

    %     show_x_min=1;
    %     show_x_max=x_size;
    %     show_y_min=0.5;
    %     show_y_max=y_size+0.5;

    %     set(ha(:),'XLim',[show_x_min show_x_max]);
    %     set(ha(:),'YLim',[show_y_min show_y_max]);
    %     set(ha(:), 'XTick', [0:x_tick_step:show_x_max]);
    %     set(ha(:), 'YTick', [0:y_tick_step:show_y_max]);

    %     %X1
    %     maximum_x_points_1= x_size; % make it bigger 5% 
    %     maximum_y_points_1= y_size; % make it bigger 5%
    %     temp_row_1=1;
    %     len_1_before=0;
    %     new_frame_1_idx=0;
    %     redraw_1=false;

    %     M_1=matrix_default_value*ones(maximum_y_points_1,maximum_x_points_1,type_of_M);
    %     A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array
    %     M_1_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_1_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X2
    %     maximum_x_points_2= x_size; % make it bigger 5% 
    %     maximum_y_points_2= y_size; % make it bigger 5%
    %     temp_row_2=1;
    %     len_2_before=0;
    %     new_frame_2_idx=0;
    %     redraw_2=false;

    %     M_2=matrix_default_value*ones(maximum_y_points_2,maximum_x_points_2,type_of_M);
    %     A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % +1 since new line saved in this array
    %     M_2_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_2_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X3
    %     maximum_x_points_3= x_size; % make it bigger 5% 
    %     maximum_y_points_3= y_size; % make it bigger 5%
    %     temp_row_3=1;
    %     len_3_before=0;
    %     new_frame_3_idx=0;
    %     redraw_3=false;

    %     M_3=matrix_default_value*ones(maximum_y_points_3,maximum_x_points_3,type_of_M);
    %     A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array
    %     M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X4
    %     maximum_x_points_4= x_size; % make it bigger 5% 
    %     maximum_y_points_4= y_size; % make it bigger 5%
    %     temp_row_4=1;
    %     len_4_before=0;
    %     new_frame_4_idx=0;
    %     redraw_4=false;

    %     M_4=matrix_default_value*ones(maximum_y_points_4,maximum_x_points_4,type_of_M);
    %     A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % +1 since new line saved in this array
    %     M_4_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_4_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X5
    %     maximum_x_points_5= x_size; % make it bigger 5% 
    %     maximum_y_points_5= y_size; % make it bigger 5%
    %     temp_row_5=1;
    %     len_5_before=0;
    %     new_frame_5_idx=0;
    %     redraw_5=false;

    %     M_5=matrix_default_value*ones(maximum_y_points_5,maximum_x_points_5,type_of_M);
    %     A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % +1 since new line saved in this array
    %     M_5_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_5_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


    %     %X6
    %     maximum_x_points_6= x_size; % make it bigger 5% 
    %     maximum_y_points_6= y_size; % make it bigger 5%
    %     temp_row_6=1;
    %     len_6_before=0;
    %     new_frame_6_idx=0;
    %     redraw_6=false;

    %     M_6=matrix_default_value*ones(maximum_y_points_6,maximum_x_points_6,type_of_M);
    %     A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % +1 since new line saved in this array
    %     M_6_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_6_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


    %     fwrite(s,uint8('h'),'uint8');
    %     delay_ms(50); % wait to get bias
    %     flushinput(s);
    %     fwrite(s,uint8('f'),'uint8');
    % end


    % function r3_callback(~, event)
    %     left_new=uint16([]);
    %     disp('mode 3');

    %     x_size=250;
    %     y_size=30;

    %     show_x_min=1;
    %     show_x_max=x_size;
    %     show_y_min=0.5;
    %     show_y_max=y_size+0.5;

    %     set(ha(:),'XLim',[show_x_min show_x_max]);
    %     set(ha(:),'YLim',[show_y_min show_y_max]);
    %     set(ha(:), 'XTick', [0:x_tick_step:show_x_max]);
    %     set(ha(:), 'YTick', [0:y_tick_step:show_y_max]);

    %     %X1
    %     maximum_x_points_1= x_size; % make it bigger 5% 
    %     maximum_y_points_1= y_size; % make it bigger 5%
    %     temp_row_1=1;
    %     len_1_before=0;
    %     new_frame_1_idx=0;
    %     redraw_1=false;

    %     M_1=matrix_default_value*ones(maximum_y_points_1,maximum_x_points_1,type_of_M);
    %     A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,type_of_A); % +1 since new line saved in this array
    %     M_1_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_1_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X2
    %     maximum_x_points_2= x_size; % make it bigger 5% 
    %     maximum_y_points_2= y_size; % make it bigger 5%
    %     temp_row_2=1;
    %     len_2_before=0;
    %     new_frame_2_idx=0;
    %     redraw_2=false;

    %     M_2=matrix_default_value*ones(maximum_y_points_2,maximum_x_points_2,type_of_M);
    %     A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,type_of_A); % +1 since new line saved in this array
    %     M_2_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_2_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X3
    %     maximum_x_points_3= x_size; % make it bigger 5% 
    %     maximum_y_points_3= y_size; % make it bigger 5%
    %     temp_row_3=1;
    %     len_3_before=0;
    %     new_frame_3_idx=0;
    %     redraw_3=false;

    %     M_3=matrix_default_value*ones(maximum_y_points_3,maximum_x_points_3,type_of_M);
    %     A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,type_of_A); % +1 since new line saved in this array
    %     M_3_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_3_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X4
    %     maximum_x_points_4= x_size; % make it bigger 5% 
    %     maximum_y_points_4= y_size; % make it bigger 5%
    %     temp_row_4=1;
    %     len_4_before=0;
    %     new_frame_4_idx=0;
    %     redraw_4=false;

    %     M_4=matrix_default_value*ones(maximum_y_points_4,maximum_x_points_4,type_of_M);
    %     A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,type_of_A); % +1 since new line saved in this array
    %     M_4_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_4_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);

    %     %X5
    %     maximum_x_points_5= x_size; % make it bigger 5% 
    %     maximum_y_points_5= y_size; % make it bigger 5%
    %     temp_row_5=1;
    %     len_5_before=0;
    %     new_frame_5_idx=0;
    %     redraw_5=false;

    %     M_5=matrix_default_value*ones(maximum_y_points_5,maximum_x_points_5,type_of_M);
    %     A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,type_of_A); % +1 since new line saved in this array
    %     M_5_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_5_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


    %     %X6
    %     maximum_x_points_6= x_size; % make it bigger 5% 
    %     maximum_y_points_6= y_size; % make it bigger 5%
    %     temp_row_6=1;
    %     len_6_before=0;
    %     new_frame_6_idx=0;
    %     redraw_6=false;

    %     M_6=matrix_default_value*ones(maximum_y_points_6,maximum_x_points_6,type_of_M);
    %     A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,type_of_A); % +1 since new line saved in this array
    %     M_6_reversed_frame_last_line=zeros(1,x_size,type_of_M);
    %     M_6_not_reversed_frame_last_line=zeros(1,x_size,type_of_M);


    %     fwrite(s,uint8('h'),'uint8');
    %     delay_ms(50);
    %     flushinput(s);
    %     fwrite(s,uint8('g'),'uint8');
    % end


    % function corr_on_callback(source,event)
    %   val=get(source, 'Value');
    %   if (val)
    %     disp('CORR ON');
    %     corr_on=1;
    %   else
    %     disp('CORR OFF');
    %     corr_on=0;
    %   end
    % end


    % function filter_data_callback(source,event)
    %   val=get(source, 'Value');
    %   if (val)
    %     disp('FILTER ON');
    %     filter_data=1;
    %   else
    %     disp('FILTER OFF');
    %     filter_data=0;
    %   end
    % end


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
        dlmwrite(name, [M_1, M_2]);
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

    % function [x,c]=CXCORR(a,b)
    %     b_size=length(b);
    %     c=zeros(1,b_size);
    %     for k=1:b_size
    %         c(k)=a*b';
    %         b=[b(end),b(1:end-1)]; %circular shift
    %     end
    %     x=[0:length(b)-1]; %lags
    % end

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