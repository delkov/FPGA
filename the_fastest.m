clear; clc
delete(instrfindall); % remove already opened serial

main();

function main()

    % % parallel initialization
    % if ~exist('p','Var')   
    %     p = gcp();
    % end

    %% CONSTANT
    counter=0; % for FPS checking

    % for serial
    baud_rate=4000000;
    buffer_size=500000; % in bytes

    record_time=300;
    % VERY IMPORTANT PARAM! should be num_of_frames*size_of_frame*~0.8
    size_to_read=8000; % read when reached in buffer.

    % GLOBAL
    x_size=300;
    y_size=10;

    % plot settings
    number_of_sub=6;

    show_x_min=0;
    show_x_max=x_size;
    show_y_min=0;
    show_y_max=y_size;

    color=[0 25];
    show_colorbar = 0;
    show_separated_lines = 1;

    replace_zero_to=0; % replace "bad data" because of bad connecton

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
    M_1=zeros(maximum_y_points_1,maximum_x_points_1,'uint8'); % uint8 is fine
    M_2=zeros(maximum_y_points_2,maximum_x_points_2,'uint8');
    M_3=zeros(maximum_y_points_3,maximum_x_points_3,'uint8');
    M_4=zeros(maximum_y_points_4,maximum_x_points_4,'uint8'); 
    M_5=zeros(maximum_y_points_5,maximum_x_points_5,'uint8');
    M_6=zeros(maximum_y_points_6,maximum_x_points_6,'uint8');

    % all flow separated by this array, A_1 for X1 and so on..
    A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,'uint32'); % +1 since new line saved in this array. Don't forget about x4;
    A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,'uint32'); % uint32 is fine. CALIB2 is ~32000
    A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,'uint32'); % 
    A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,'uint32'); % 
    A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,'uint32'); % 
    A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,'uint32'); % 
             

    % fileID = fopen('xcorr_checking.txt','w');

    if ~exist('h','Var')   
        h=figure('ToolBar','none','units','normalized','outerposition',[0 0 1 1], 'color', 'black');
        
        % speed up FPS
        set(gcf, 'GraphicsSmoothing','off')  % worked for HG1 with opengl!
        set(gcf,'Renderer','OpenGL'); % worked (by default actually..)
        set(gcf,'RendererMode','manual') % already setted because of OpenGl, just keep it..

        % cla
        ax = axes('Parent', h);        
        [ha, pos] = tight_subplot(1,number_of_sub,[0 0],[.02 .02],[.01 .01]);

        % F1
        axes(ha(1));
        pl(1)=image(M_1,'CDataMapping','scaled');
        if (~show_separated_lines)
            axis off;
        end
        ax=gca;
        % to make drawnow faster, since defined already
        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YTick = [0:1:show_y_max];
        ax.XTick = [0:20:show_x_max];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % % set(ha,'YTickLabel',[]) 



        % F2
        axes(ha(2));
        pl(2)=image(M_2,'CDataMapping','scaled');
        if (~show_separated_lines)
            axis off;
        end
        ax=gca;
        % to make drawnow faster, since defined already
        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YTick = [0:1:show_y_max];
        ax.XTick = [0:20:show_x_max];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % % set(ha,'YTickLabel',[]) 


         % F3
        axes(ha(3));
        pl(3)=image(M_3,'CDataMapping','scaled');

        if (~show_separated_lines)
            axis off;
        end
        ax=gca;
        % to make drawnow faster, since defined already
        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YTick = [0:1:show_y_max];
        ax.XTick = [0:20:show_x_max];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % % set(ha,'YTickLabel',[]) 


        % F4
        axes(ha(4));
        pl(4)=image(M_4,'CDataMapping','scaled');
        if (~show_separated_lines)
            axis off;
        end
        ax=gca;
        % to make drawnow faster, since defined already
        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YTick = [0:1:show_y_max];
        ax.XTick = [0:20:show_x_max];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % % set(ha,'YTickLabel',[]) 

        % F5
        axes(ha(5));
        pl(5)=image(M_5,'CDataMapping','scaled');
        if (~show_separated_lines)
            axis off;
        end
        ax=gca;
        % to make drawnow faster, since defined already
        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YTick = [0:1:show_y_max];
        ax.XTick = [0:20:show_x_max];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % % set(ha,'YTickLabel',[]) 


        % F6
        axes(ha(6));
        pl(6)=image(M_6,'CDataMapping','scaled');
        if (~show_separated_lines)
            axis off;
        end
        ax=gca;
        % to make drawnow faster, since defined already
        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');
        ax.CLim = [color(1) color(2)]; % color limit
        ax.Color=[0 0 0];
        ax.YTick = [0:1:show_y_max];
        ax.XTick = [0:20:show_x_max];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];
        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];
        % % set(ha,'YTickLabel',[]) 

        if (show_colorbar)
            colorbar;
        end
        colormap('jet');
    end
   
    % wait initialization of frames % co.
    % delay_ms(1000);
    

    % flush serial to avoid overflow
    % flushinput(s);
    
    left_out=uint16([]); % to make good out 16bit
    start_ok=false;

    % draw now %
    drawnow;

    frame_reversed_1=false;
    frame_reversed_2=false;
    frame_reversed_3=false;
    frame_reversed_4=false;
    frame_reversed_5=false;
    frame_reversed_6=false;



    start=tic;
    if(~exist('s','Var'))
        ser_list=seriallist();
        serial_port=ser_list(1);
        % getting data by bytes, so 8 bits
        s = serial(serial_port,'BaudRate',baud_rate,'DataBits',8,'InputBufferSize',buffer_size); %20k is 6000 points * 8 byte each, so take 40k.
        % callback genetration
        s.BytesAvailableFcnCount = size_to_read;
        s.BytesAvailableFcnMode = 'byte';
        s.BytesAvailableFcn = {@READY_TO_READ};
        fopen(s);     
    end


    % check profiling %
    profile on
    
    %% NESTED to MAIN %%
    function READY_TO_READ(obj,event)

            if toc(start) > record_time
                disp(['FPS is ', num2str(counter/toc(start))]);
                delay_ms(1000);
    
                name=strsplit(string(datetime('now')),' ');
                name=char(strrep(name(2),':','_'));
                profsave(profile('info'), name);
                delete(h);

                return;
            end


            out = [left_out; fread(s,size_to_read,'uint16')]; % both of them 16 bit -> it also 16bit; PREALLOCATED for out can be done...

            % separate by good packages
            out_idx = find(0<out & out<7); % 6 susbs we have
            first_byte_position = min(out_idx);
            last_byte_position = max(out_idx);
            
            %probably 1 x or 1 x y11
            left_out=out(last_byte_position:end); % uint16, since out is uint16
            % totaly right input, like 1 x y z
            good_out=out(first_byte_position:last_byte_position-1); % uint16
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


            X1();
            X2();
            X3();
            X4();
            X5();
            X6();


            if (redraw_1==true && redraw_2==true && redraw_3==true && redraw_4==true && redraw_5==true && redraw_6==true) 
                counter=counter+1;
                redraw_1=false;
                redraw_2=false;
                redraw_3=false;
                redraw_4=false;
                redraw_5=false;
                redraw_6=false;

                        if(counter==15)
                            dlmwrite('real_corr_test.txt',M_2_backup);
                        end

                drawnow nocallbacks %% more faster (25%) than just drawnow.
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
                    zero_index_all=find(A_1==0,5,'first')-1; % we have keeping MORE!!! some times we have 0 in REAL data (ALREADY FIXED IN FPGA.., but anyway keep it)
                    
                    % try % sometimes we start from case, when first line is empty -> wrong zero_first..
                    zero_index=zero_index_all(end); % take real matrix zeros..
                    A_sep{len+1}=A_1(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_1) % we dont need to reverse frame..
                        temp_row_1=2;
                        line_reversed=true;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_1(temp_row_1,j)=replace_zero_to;
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
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_1(temp_row_1,size_A_sepi+1-j)=replace_zero_to;
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

                    else % we need to reverse frame
                        temp_row_1=1;
                        line_reversed=false;
                        % loop for all lines
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_1(temp_row_1,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_1(temp_row_1, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_1');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_1(temp_row_1,size_A_sepi+1-j)=replace_zero_to;
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
                    end % frame reversed
                    frame_reversed_1=~frame_reversed_1;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{3})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(1),'CData',M_1);
                redraw_1=true;    

                % only for testing
                M_1_backup=M_1;

                %% Previous frame is done -> A_1 is complete -> prcess it
                M_1=zeros(maximum_y_points_1,maximum_x_points_1,'uint8');
                A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,'uint32'); % +1 since new line saved in this array

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
                    zero_index_all=find(A_2==0,5,'first')-1; % we have keeping MORE!!! some times we have 0 in REAL data (ALREADY FIXED IN FPGA.., but anyway keep it)
                    
                    % try % sometimes we start from case, when first line is empty -> wrong zero_first..
                    zero_index=zero_index_all(end); % take real matrix zeros..
                    A_sep{len+1}=A_2(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_2) % we dont need to reverse frame..
                        temp_row_2=2;
                        line_reversed=true;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_2(temp_row_2,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_2(temp_row_2, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_2(temp_row_2, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                            % A_sep{i}(3*(j-1)+2)*720*0.15/ ( A_sep{i}(3*(j-1)+3) )
                                        % catch
                                            % disp('wasted M_2');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_2(temp_row_2,size_A_sepi+1-j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_2(temp_row_2, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15  / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_2');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j


                            % if(i>1 && i<len+1)
                            %     [c,lags]=xcorr(M_2(temp_row_2,:),M_2(temp_row_2-1,:))   
                            % end

                            line_reversed=~line_reversed; % change polarity
                            temp_row_2=temp_row_2+1; % next line
                        end  % for i

                    else % we need to reverse frame
                        temp_row_2=1;
                        line_reversed=false;
                        % loop for all lines
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_2(temp_row_2,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_2(temp_row_2, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_2');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_2(temp_row_2,size_A_sepi+1-j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_2(temp_row_2, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_2');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_2=temp_row_2+1; % next line
                        end  % for i
                    end % frame reversed
                    frame_reversed_2=~frame_reversed_2;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{3})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(2),'CData',M_2);
                redraw_2=true;    

                % only for testing
                M_2_backup=M_2;

                %% Previous frame is done -> A_2 is complete -> prcess it
                M_2=zeros(maximum_y_points_2,maximum_x_points_2,'uint8');
                A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,'uint32'); % +1 since new line saved in this array

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
                    zero_index_all=find(A_3==0,5,'first')-1; % we have keeping MORE!!! some times we have 0 in REAL data (ALREADY FIXED IN FPGA.., but anyway keep it)
                    
                    % try % sometimes we start from case, when first line is empty -> wrong zero_first..
                    zero_index=zero_index_all(end); % take real matrix zeros..
                    A_sep{len+1}=A_3(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_3) % we dont need to reverse frame..
                        temp_row_3=2;
                        line_reversed=true;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_3(temp_row_3,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_3(temp_row_3, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_3(temp_row_3, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_3');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_3(temp_row_3,size_A_sepi+1-j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_3(temp_row_3, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15  / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_3');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j
                            line_reversed=~line_reversed; % change polarity
                            temp_row_3=temp_row_3+1; % next line
                        end  % for i

                    else % we need to reverse frame
                        temp_row_3=1;
                        line_reversed=false;
                        % loop for all lines
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_3(temp_row_3,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_3(temp_row_3, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_3');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_3(temp_row_3,size_A_sepi+1-j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_3(temp_row_3, size_A_sepi+1-j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_3');
                                        % end % try
                                    end 
                                end % reversed
                            end % for j

                            line_reversed=~line_reversed; % change polarity
                            temp_row_3=temp_row_3+1; % next line
                        end  % for i
                    end % frame reversed
                    frame_reversed_3=~frame_reversed_3;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{3})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(3),'CData',M_3);
                redraw_3=true;    

                %% Previous frame is done -> A_3 is complete -> prcess it
                M_3=zeros(maximum_y_points_3,maximum_x_points_3,'uint8');
                A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,'uint32'); % +1 since new line saved in this array

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
                    zero_index_all=find(A_4==0,5,'first')-1; % we have keeping MORE!!! some times we have 0 in REAL data (ALREADY FIXED IN FPGA.., but anyway keep it)
                    
                    % try % sometimes we start from case, when first line is empty -> wrong zero_first..
                    zero_index=zero_index_all(end); % take real matrix zeros..
                    A_sep{len+1}=A_4(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_4) % we dont need to reverse frame..
                        temp_row_4=2;
                        line_reversed=true;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_4(temp_row_4,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_4(temp_row_4, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_4(temp_row_4, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_4');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_4(temp_row_4,size_A_sepi+1-j)=replace_zero_to;
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
                            line_reversed=~line_reversed; % change polarity
                            temp_row_4=temp_row_4+1; % next line
                        end  % for i

                    else % we need to reverse frame
                        temp_row_4=1;
                        line_reversed=false;
                        % loop for all lines
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_4(temp_row_4,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_4(temp_row_4, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_4');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_4(temp_row_4,size_A_sepi+1-j)=replace_zero_to;
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
                    end % frame reversed
                    frame_reversed_4=~frame_reversed_4;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{3})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(4),'CData',M_4);
                redraw_4=true;    

                %% Previous frame is done -> A_4 is complete -> prcess it
                M_4=zeros(maximum_y_points_4,maximum_x_points_4,'uint8');
                A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,'uint32'); % +1 since new line saved in this array

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
                    zero_index_all=find(A_5==0,5,'first')-1; % we have keeping MORE!!! some times we have 0 in REAL data (ALREADY FIXED IN FPGA.., but anyway keep it)
                    
                    % try % sometimes we start from case, when first line is empty -> wrong zero_first..
                    zero_index=zero_index_all(end); % take real matrix zeros..
                    A_sep{len+1}=A_5(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_5) % we dont need to reverse frame..
                        temp_row_5=2;
                        line_reversed=true;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_5(temp_row_5,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_5(temp_row_5, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_5(temp_row_5, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_5');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_5(temp_row_5,size_A_sepi+1-j)=replace_zero_to;
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
                            line_reversed=~line_reversed; % change polarity
                            temp_row_5=temp_row_5+1; % next line
                        end  % for i

                    else % we need to reverse frame
                        temp_row_5=1;
                        line_reversed=false;
                        % loop for all lines
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_5(temp_row_5,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_5(temp_row_5, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_5');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_5(temp_row_5,size_A_sepi+1-j)=replace_zero_to;
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
                    end % frame reversed
                    frame_reversed_5=~frame_reversed_5;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{3})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(5),'CData',M_5);
                redraw_5=true;    

                %% Previous frame is done -> A_5 is complete -> prcess it
                M_5=zeros(maximum_y_points_5,maximum_x_points_5,'uint8');
                A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,'uint32'); % +1 since new line saved in this array

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
                    zero_index_all=find(A_6==0,5,'first')-1; % we have keeping MORE!!! some times we have 0 in REAL data (ALREADY FIXED IN FPGA.., but anyway keep it)
                    
                    % try % sometimes we start from case, when first line is empty -> wrong zero_first..
                    zero_index=zero_index_all(end); % take real matrix zeros..
                    A_sep{len+1}=A_6(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                    % catch           
                    % end
                    % start from the beggining both for reversde & not reversed frames

                    if (~frame_reversed_6) % we dont need to reverse frame..
                        temp_row_6=2;
                        line_reversed=true;

                        % loop for all lines
                        for i=1:len+1
                            size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if we dont need to reverse
                                    % disp('not reversed')
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_6(temp_row_6,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            % M_6(temp_row_6, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                                            M_6(temp_row_6, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_6');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_6(temp_row_6,size_A_sepi+1-j)=replace_zero_to;
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
                            line_reversed=~line_reversed; % change polarity
                            temp_row_6=temp_row_6+1; % next line
                        end  % for i

                    else % we need to reverse frame
                        temp_row_6=1;
                        line_reversed=false;
                        % loop for all lines
                        for i=len+1:-1:1
                            size_A_sepi=fix(length(A_sep{i})/3);
                            % loop within selected line
                            for j=1:size_A_sepi
                                if (~line_reversed) % if not reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_6(temp_row_6,j)=replace_zero_to;
                                    else
                                        % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                                        % try
                                            M_6(temp_row_6, j)=A_sep{i}(3*(j-1)+2)*720*0.15 / ( A_sep{i}(3*(j-1)+3) ); % in
                                        % catch
                                            % disp('wasted M_6');
                                        % end % try
                                    end     
                                else   % if we must reversed
                                    if (A_sep{i}(3*(j-1)+2)==0)
                                        M_6(temp_row_6,size_A_sepi+1-j)=replace_zero_to;
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
                    end % frame reversed
                    frame_reversed_6=~frame_reversed_6;
                        
                    % disp(['Matrix is ',  num2str(length(A_sep{3})/2) 'x' num2str(len)  ]);
                end % len ~=0
                %%% END SEPARATION %%%

                set(pl(6),'CData',M_6);
                redraw_6=true;    

                %% Previous frame is done -> A_6 is complete -> prcess it
                M_6=zeros(maximum_y_points_6,maximum_x_points_6,'uint8');
                A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,'uint32'); % +1 since new line saved in this array

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
    end % function
    











    % disp(['Matrix is ',  num2str(length(A_sep{2})/2) 'x' num2str(len)  ]);
    % disp(['Total points/s ',  num2str(counter/10*len*length(A_sep{2})/2) ]);
    
    
    %% NESTED FUNCTION (SINCE SHARED MEMOTY, MATLAB DOENST HAVE POINTERS! ONLY IN MEX type..)    
    %% careful about A_sep size.. ALSO WE HAVE ZEROS at the end of A_1, since preallocated..

    





    % function pause the program
    function delay_ms(seconds)
        tic;
        while toc < seconds/1000
        end
    end



end % main