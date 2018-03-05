clear; clc
delete(instrfindall); % remove already opened serial

main();

function main()

    % % parallel initialization
    % if ~exist('p','Var')   
    %     p = gcp();
    % end

    %% CONSTANT
    counter=0;  
    baud_rate=4000000;
    buffer_size=100000; % in bytes
    read_trigger_size=100;


    % GLOBAL
    x_size=150;
    y_size=20;


    % plot settings
    show_x_min=0;
    show_x_max=150;
    show_y_min=0;
    show_y_max=20;

    color=[0 5];
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
             

    % fileID = fopen('serial_checking.txt','w');

    if ~exist('h','Var')   
        h=figure('ToolBar','none','units','normalized','outerposition',[0 0 1 1], 'color', 'black');
        
        % speed up FPS
        set(gcf, 'GraphicsSmoothing','off')  % worked for HG1 with opengl!
        set(gcf,'Renderer','OpenGL'); % worked (by default actually..)
        set(gcf,'RendererMode','manual') % already setted because of OpenGl, just keep it..

        % cla
        ax = axes('Parent', h);        

        % [ha, pos] = tight_subplot(1,3,[0 0],[.02 .02],[.01 .01]);


        % F1
        axes(ax);
        % pl(1)=imagesc(M_1,[color(1) color(2)]);%'CDataMapping','scaled');
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
        ax.YTick = [0:1:10];
        ax.XTick = [0:20:300];
        ax.YAxisLocation = 'left';
        ax.XColor=[1,1,1];
        ax.YColor=[1,1,1];

        % ax.XLim=[show_x_min, show_x_max];
        % ax.YLim=[show_y_min, show_y_max];

        % % set(ha,'YTickLabel',[]) 

        if (show_colorbar)
            colorbar;
        end
        colormap('jet');
    end2
   
    % wait initialization of frames % co.
    % delay_ms(1000);
    

    % flush serial to avoid overflow
    % flushinput(s);
    
    left_out=uint16([]); % to make good out 16bit
    start_ok=false;

    drawnow
    % delay_ms(1000);
    if(~exist('s','Var'))
        ser_list=seriallist();
        serial_port=ser_list(1);
        % getting data by bytes, so 8 bits
        s = serial(serial_port,'BaudRate',baud_rate,'DataBits',8,'InputBufferSize',buffer_size); %20k is 6000 points * 8 byte each, so take 40k.
        fopen(s);     
    end


    profile on
    % start timer 
    


    frame_reversed_1=false;
    frame_reversed_2=false;
    frame_reversed_3=false;
    frame_reversed_4=false;
    frame_reversed_5=false;
    frame_reversed_6=false;
    

    % size_to_read=uint8(0);
    % fileID = fopen('test_out.txt','r');
    % all_out=textread('test_out.txt');

    start=tic;
    while toc(start) < 10
    % piece=1;

    % while piece < 470
            % piece=piece+1;
            % index=index+

        % if (10>7)
            % join with prev. left_out uint16 is fine, since calib2 ~ 27k
            % out = [left_out; all_out(5000*piece:5000*(piece+1))]; % both of them 16 bit -> it also 16bit; PREALLOCATED is not needed in such cases
        
        size_to_read=s.BytesAvailable;
        % size_to_read=2000;
        if (size_to_read>read_trigger_size)
            new_out=fread(s,size_to_read,'uint16');

            out = [left_out; new_out]; % both of them 16 bit -> it also 16bit; PREALLOCATED is not needed in such cases



            % out(1:3)

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
        % F(2) = parfeval(p,@X2,0);
        % F(3) = parfeval(p,@X3,0);
        % F(4) = parfeval(p,@X4,0);
        % F(5) = parfeval(p,@X5,0);
        % F(6) = parfeval(p,@X6,0);

        % fetchOutputs(F)
        % completedIdx = fetchNext(F)

            % X1();
            X2();
            % X3();
            % X4();
            % X5();
            % X6();

            if (redraw_2==true)% && redraw_4==true) 
            % if (redraw_2==true) 
                % disp('frame_2')
                counter=counter+1;
                redraw_2=false;

                % disp(['Matrix is ',  num2str(length(A_sep{2})/2) 'x' num2str(len+1)  ]);
                % try
                    % disp(['M(1) is ', num2str(length(A_sep{1})/3)]) 
                    % disp(['M(20) is ', num2str(length(A_sep{20})/3)]) 
                    % disp(['Matrix is ',  num2str(length(A_sep{2})/3) 'x' num2str(len+1)  ]);
                % catch
                % end
                drawnow nocallbacks
                % drawnow limitrate
            end


        end % if buffer is not empty
    end % while 1
    

    disp(['FPS is ', num2str(counter/toc(start))]);


    name=strsplit(string(datetime('now')),' ');
    name=char(strrep(name(2),':','_'));
    profsave(profile('info'), name);

    delete(h)










    % disp(['Matrix is ',  num2str(length(A_sep{2})/2) 'x' num2str(len)  ]);
    % disp(['Total points/s ',  num2str(counter/10*len*length(A_sep{2})/2) ]);
    
    
    %% NESTED FUNCTION (SINCE SHARED MEMOTY, MATLAB DOENST HAVE POINTERS! ONLY IN MEX type..)    
    %% careful about A_sep size.. ALSO WE HAVE ZEROS at the end of A_1, since preallocated..

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
            % disp(['Lines amount', num2str(len)])
            if (len~=0) % sometimes we can read only new frame, without new_line
                % disp('len_new_lines')
                % remove last 2 digits from 13 13 13
                % overflow sometimes.. for clean_new_lines
                clean_new_lines=zeros(1,len,'uint32');
                for i=1:len
                    clean_new_lines(i)=new_lines(2*i-1);
                end
        
                %% ASSUME, that row cannot start from new line !!!
                A_sep=cell(1,len+1); % preallocated memory, carefull size
        
                % clean_new_lines(1)
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
                line_reversed=false;
                % disp('not reversed')
                % line_reversed=false; % since first line is not reversed
                % loop for all lines
                    for i=1:len+1
                        size_A_sepi=fix(length(A_sep{i})/3); % sometimes we have zero in data (so we use line 483) and this size is not divided by 3..
                        % loop for selected line
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
                                    % catch
                                        % disp('wasted M_2');
                                    % end % try
                                end     
                            else   % if we must reversed
                                % disp('reversed')
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

                        line_reversed=~line_reversed; % change polarity
                        temp_row_2=temp_row_2+1; % next line
                    end  % for i
                    % temp_row_2=1;
                else % we need to reverse frame
                    temp_row_2=1;
                    % disp('reversed')
                    line_reversed=true;
                    for i=len+1:-1:1
                        size_A_sepi=fix(length(A_sep{i})/3);
                        
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
                    

            end % len ~=0
            %%% END SEPARATION %%%

            % M_2(1,1:3)
            set(pl(1),'CData',M_2);
            redraw_2=true;    

            % max(A_2)
            % max(max(M_2))

            %% Previous frame is done -> A_2 is complete -> prcess it
            M_2=zeros(maximum_y_points_2,maximum_x_points_2,'uint8');
            % disp('new frame 1')
            A_2=zeros(1,3*maximum_x_points_2*maximum_y_points_2,'uint32'); % +1 since new line saved in this array
            % class(A_2)

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





    % function pause the program
    function delay_ms(seconds)
        tic;
        while toc < seconds/1000
        end
    end



end % main