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

    % GLOBAL
    color=[0 200];
    show_colorbar = 0;
    show_separated_lines = 1;

    %X1
    maximum_x_points_1= 400; % make it bigger 5% 
    maximum_y_points_1= 200; % make it bigger 5%
    temp_row_1=1;%maximum_y_points;
    
    len_1_before=0;
    new_frame_1_idx=0;
    redraw_1=false;
    
    %X2
    maximum_x_points_2= 400; % make it bigger 5% 
    maximum_y_points_2= 200; % make it bigger 5%
    temp_row_2=1;

    len_2_before=0;
    new_frame_2_idx=0;
    redraw_2=false;

    %X3
    maximum_x_points_3= 400; % make it bigger 5% 
    maximum_y_points_3= 200; % make it bigger 5%
    temp_row_3=1;

    len_3_before=0;
    new_frame_3_idx=0;
    redraw_3=false;

    %X4
    maximum_x_points_4= 400; % make it bigger 5% 
    maximum_y_points_4= 200; % make it bigger 5%
    temp_row_4=1;

    len_4_before=0;
    new_frame_4_idx=0;
    redraw_4=false;

    %X5
    maximum_x_points_5= 400; % make it bigger 5% 
    maximum_y_points_5= 200; % make it bigger 5%
    temp_row_5=1;

    len_5_before=0;
    new_frame_5_idx=0;
    redraw_5=false;

    %X6
    maximum_x_points_6= 400; % make it bigger 5% 
    maximum_y_points_6= 200; % make it bigger 5%
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
             

    
    if ~exist('h','Var')   
        h=figure('ToolBar','none','units','normalized','outerposition',[0 0 1 1]);
        % cla
        ax = axes('Parent', h);
        [ha, pos] = tight_subplot(1,4,[0 0],[.01 .01],[.01 .01]);

        axes(ha(1));
        pl(1)=imagesc(M_1,[color(1) color(2)]);
        if (~show_separated_lines)
            axis off;
        end

        axes(ha(2));
        pl(2)=imagesc(M_2,[color(1) color(2)]);
        if (~show_separated_lines)
            axis off;
        end

        axes(ha(3));
        pl(3)=imagesc(M_3,[color(1) color(2)]);
        if (~show_separated_lines)
            axis off;
        end

        axes(ha(4));
        pl(4)=imagesc(M_4,[color(1) color(2)]);
        if (~show_separated_lines)
            axis off;
        end
        
        % axes(ha(5));
        % pl(5)=imagesc(M_5,[color(1) color(2)]);
        % if (~show_separated_lines)
        %     axis off;
        % end

        % axes(ha(6));
        % pl(6)=imagesc(M_6,[color(1) color(2)]);
        % if (~show_separated_lines)
        %     axis off;
        % end


        set(ha,'YTickLabel',[]) 
        set(ha,'YTick',[])
        set(ha,'XTick',[])

        if (show_colorbar)
            colorbar;
        end
        colormap('jet');
    end
   
    % wait initialization of frames % co.
    delay_ms(1000);
    

    % flush serial to avoid overflow
    % flushinput(s);
    
    left_out=uint16([]); % to make good out 16bit
    
    if(~exist('s','Var'))
        ser_list=seriallist();
        serial_port=ser_list(1);
        % getting data by bytes, so 8 bits
        s = serial(serial_port,'BaudRate',4000000,'DataBits',8,'InputBufferSize',500000); %20k is 6000 points * 8 byte each, so take 40k.
        fopen(s);     
    end

    % start timer 
    start=tic;


    while 1 %toc(start) < 1000

        if (s.BytesAvailable>7)
                % disp('parallel is fine')
            % join with prev. left_out uint16 is fine, since calib2 ~ 27k
            out = [left_out; fread(s,s.BytesAvailable,'uint16')]; % both of them 16 bit -> it also 16bit; PREALLOCATED is not needed in such cases
            out(1:4)
            % separate by good packages
            out_idx = find(0<out & out<7); % 6 susbs we have
            first_byte_position = min(out_idx);
            last_byte_position = max(out_idx);
            
            %probably 1 x or 1 x y11
            left_out=out(last_byte_position:end); % uint16, since out is uint16
            % totaly right input, like 1 x y z
            good_out=out(first_byte_position:last_byte_position-1); % uint16
    
            % find all new frames for all subs
            find_new_frames=find(good_out==14);
    
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
                    % disp('azaza-1')
                    % disp('azaza0')
        % F(2) = parfeval(p,@X2,0);
        % F(3) = parfeval(p,@X3,0);
        % F(4) = parfeval(p,@X4,0);
        % F(5) = parfeval(p,@X5,0);
        % F(6) = parfeval(p,@X6,0);

            % % MAKE redraw only if all is ready, since drawnos is expensive
            
            % while (redraw_1==false)
            %     disp('not yet..')
            % end
        % fetchOutputs(F)
        % completedIdx = fetchNext(F)
            % if (redraw_1==true)
                % drawnow;
                % M_1
                % disp('azaza')
            %     redraw_1=false;
            % end
            % if (redraw_2==true)
            %     drawnow;
            %     redraw_2=false;
            % end
            % if (redraw_3==true)
            %     drawnow;
            %     redraw_3=false;
            % end
            % if (redraw_4==true)
            %     drawnow;
            %     redraw_4=false;
            % end
            % if (redraw_5==true)
            %     drawnow;
            %     redraw_5=false;
            % end
            % if (redraw_6==true)
            %     drawnow;
            %     redraw_6=false;
            % end

            % X1();
            X2();
            X3();
            X4();
            % X5();
            % X6();
            % if (redraw_1==true)
            %     drawnow;
            %     disp('frame_1')
            %     redraw_1=false;
            % end

            if (redraw_2==true)
                drawnow;
                disp('frame_2')

                redraw_2=false;
            end

            if (redraw_3==true)
                drawnow;
                disp('frame_3')

                redraw_3=false;
            end

            if (redraw_4==true)
                drawnow;
                disp('frame_4')

                redraw_4=false;
            end

            % if ( (redraw_1 == true) & (redraw_2 ==true) & (redraw_3 ==true) )% & redraw_2 & redraw_3 & redraw_4 & redraw_5 & redraw_6)
            %     drawnow;
            %     counter=counter+1;
            %     redraw_1=false;
            %     redraw_2=false;
            %     redraw_3=false;
            % end

            % if ( (redraw_1 == true) & (redraw_2 ==true) & (redraw_3 ==true) & (redraw_4 ==true) & (redraw_5 ==true) & (redraw_6 ==true) )% & redraw_2 & redraw_3 & redraw_4 & redraw_5 & redraw_6)
            %     drawnow;
            %     counter=counter+1;
            %     redraw_1=false;
            %     redraw_2=false;
            %     redraw_3=false;
            %     redraw_4=false;
            %     redraw_5=false;
            %     redraw_6=false;
            % end

        end % if buffer is not empty
    end % while 1
    
    disp(['FPS is ', num2str(counter/1000)]);
    disp(['Matrix is ',  num2str(length(A_sep{2})/2) 'x' num2str(len)  ]);
    disp(['Total points/s ',  num2str(counter/1000*len*length(A_sep{2})/2) ]);
    
    
    %% NESTED FUNCTION (SINCE SHARED MEMOTY, MATLAB DOENST HAVE POINTERS! ONLY IN MEX type..)    
    %% careful about A_sep size.. ALSO WE HAVE ZEROS at the end of A_1, since preallocated..
    
    % X1
    % function X1()%good_out,new_frame_1_idx,len_1_before)
    %     % disp)
    %     find_1_all_idx = find(good_out==1); % find indexes of all points 
    %     if (new_frame_1_idx == 0) % no new frame for sub_1
    %         len_1 = length(find_1_all_idx); % how many points in this package
    %         % fill array from last good_out
    %         for i=len_1_before+1:len_1_before+len_1
    %             A_1(3*i-2:3*i) = good_out(find_1_all_idx(i-len_1_before):find_1_all_idx(i-len_1_before)+2);
    %         end
    %         len_1_before=len_1_before+len_1;
        
    %     else % we have new frame, so first fill before new_line ant htne after new_line
    %         len_1=find(find_1_all_idx==new_frame_1_idx)-1; % how many points until new frame
    %         for i=len_1_before+1:len_1_before+len_1
    %             A_1(3*i-2:3*i) = good_out(find_1_all_idx(i-len_1_before):find_1_all_idx(i-len_1_before)+2);
    %         end
    
    %         %%% SEPARATION %%%
    %         new_lines=find(A_1==13);
    %         len=length(new_lines)/2;
    %         if (len~=0) % sometimes we can read only new frame, without new_line

    %             % remove last 2 digits from 13 13 13
    %             clean_new_lines=zeros(1,len,'uint32');
    %             for i=1:len
    %                 clean_new_lines(i)=new_lines(2*i-1);
    %             end
            
    %             %% ASSUME, that row cannot start from new line !!!
    %             A_sep=cell(1,len+1); % preallocated memory, carefull size
            
    %             % clean_new_lines(1)
    %             % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
    %             A_sep{1}=A_1(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
    %             for i=2:len % if <1 not processing.
    %                 A_sep{i} = A_1(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
    %             end
    %             zero_index=find(A_1==0,1,'first')-1;
                
    %             clean_new_lines(len)+2
    %             zero_index

    %             A_sep{len+1}=A_1(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                
    %             for i=1:len+1
    %                 size_A_sepi=length(A_sep{i})/3;
    %                 for j=1:size_A_sepi
    %                     if (A_sep{i}(3*(j-1)+2)==0)
    %                         % disp('zeros')
    %                         M_1(temp_row_1,j)=250;
    %                     else
    %                         % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
    %                         try
    %                             M_1(temp_row_1, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
    %                         catch
    %                             disp('wasted M_1');
    %                         end % try
    %                     end
    %                 end
    %                 temp_row_1=temp_row_1+1; % next line
    %             end  % for i
    %             temp_row_1=1;
    %         end % len ~=0
    %         %%% END SEPARATION %%%


    %         set(pl(1),'CData',M_1);
    %         redraw_1=true;    

    %         %% Previous frame is done -> A_1 is complete -> prcess it
    %         M_1=zeros(maximum_y_points_1,maximum_x_points_1,'uint8');
    %         % disp('new frame 1')
    %         A_1=zeros(1,3*maximum_x_points_1*maximum_y_points_1,'uint32'); % +1 since new line saved in this array

    %         % fill array, which after new frame
    %         len_1_full=length(find_1_all_idx); % all points
    %         len_1=find(find_1_all_idx==new_frame_1_idx);
    %         for i=1:len_1_full-len_1
    %             A_1(3*i-2:3*i) = good_out(find_1_all_idx(i+len_1):find_1_all_idx(i+len_1)+2);
    %         end
    
    %         len_1_before=len_1_full-len_1;
    %         new_frame_1_idx=0;
    %     end % new_frame_1
    % end % X1 function


    

    function X2()
        find_2_all_idx = find(good_out==2); % find indexes of all points 
        if (new_frame_2_idx == 0) % no new frame for sub_2
            len_2 = length(find_2_all_idx); % how many points in this package
            % fill array from last good_out
            for i=len_2_before+1:len_2_before+len_2
                A_2(3*i-2:3*i) = good_out(find_2_all_idx(i-len_2_before):find_2_all_idx(i-len_2_before)+2);
            end
            len_2_before=len_2_before+len_2;
        
        else % we have new frame, so first fill before new_line ant htne after new_line
            len_2=find(find_2_all_idx==new_frame_2_idx)-1; % how many points until new frame
            for i=len_2_before+1:len_2_before+len_2
                A_2(3*i-2:3*i) = good_out(find_2_all_idx(i-len_2_before):find_2_all_idx(i-len_2_before)+2);
            end


            %%% SEPARATION %%%
            new_lines=find(A_2==13);
            len=length(new_lines)/2;
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
                zero_index=find(A_2==0,1,'first')-1;
                

                % clean_new_lines(len)+2
                % zero_index
                

                A_sep{len+1}=A_2(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                
                for i=1:len+1
                    size_A_sepi=length(A_sep{i})/3;
                    for j=1:size_A_sepi
                        if (A_sep{i}(3*(j-1)+1)==0)
                            M_2(temp_row_2,j)=250;
                        else
                            % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                            try
                                M_2(temp_row_2, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                            catch
                                disp('wasted M_2');
                            end % try
                        end
                    end
                    temp_row_2=temp_row_2+1; % next line
                end  % for i
                temp_row_2=1;
            end % len ~=0
            %%% END SEPARATION %%%

            set(pl(2),'CData',M_2);
            redraw_2=true;    

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


    function X3()
        find_3_all_idx = find(good_out==3); % find indexes of all points 

        if (new_frame_3_idx == 0) % no new frame for sub_3
            len_3 = length(find_3_all_idx); % how many points in this package
            % fill array from last good_out
            for i=len_3_before+1:len_3_before+len_3
                A_3(3*i-2:3*i) = good_out(find_3_all_idx(i-len_3_before):find_3_all_idx(i-len_3_before)+2);
            end
            len_3_before=len_3_before+len_3;
        
        else % we have new frame, so first fill before new_line ant htne after new_line
            len_3=find(find_3_all_idx==new_frame_3_idx)-1; % how many points until new frame
            for i=len_3_before+1:len_3_before+len_3
                A_3(3*i-2:3*i) = good_out(find_3_all_idx(i-len_3_before):find_3_all_idx(i-len_3_before)+2);
            end
    
            % SEPARATE
            new_lines=find(A_3==13);
            len=length(new_lines)/2;
            if (len~=0) % sometimes we can read only new frame, without new_line
                % disp('len_new_lines')
                % remove last 2 digits from 13 13 13
                clean_new_lines=zeros(1,len,'uint32');
                for i=1:len
                    clean_new_lines(i)=new_lines(2*i-1);
                end
        
                %% ASSUME, that row cannot start from new line !!!
                A_sep=cell(1,len+1); % preallocated memory, carefull size
        
                % clean_new_lines(1)
                % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
                A_sep{1}=A_3(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
                for i=2:len % if <1 not processing.
                    A_sep{i} = A_3(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
                end
                zero_index=find(A_3==0,1,'first')-1;
                A_sep{len+1}=A_3(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                
                % for i=1:length(A_sep)
                %    A_sep{i}
                % end
                
                for i=1:len+1
                    size_A_sepi=length(A_sep{i})/3;
                    for j=1:size_A_sepi
                        if (A_sep{i}(3*(j-1)+1)==0)
                            M_3(temp_row_3,j)=250;
                        else
                            % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                            try
                                M_3(temp_row_3, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                            catch
                                disp('wasted M_3');
                            end % try
                        end
                    end
                    temp_row_3=temp_row_3+1; % next line
                end  % for i
                temp_row_3=1;
            end % len ~=0

            % END SEPARATE

            set(pl(3),'CData',M_3);
            redraw_3=true;    

            %% Previous frame is done -> A_3 is complete -> prcess it
            M_3=zeros(maximum_y_points_3,maximum_x_points_3,'uint8');
            % disp('new frame 1')
            A_3=zeros(1,3*maximum_x_points_3*maximum_y_points_3,'uint32'); % +1 since new line saved in this array
            % class(A_3)

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
        
        else % we have new frame, so first fill before new_line ant htne after new_line
            len_4=find(find_4_all_idx==new_frame_4_idx)-1; % how many points until new frame
            for i=len_4_before+1:len_4_before+len_4
                A_4(3*i-2:3*i) = good_out(find_4_all_idx(i-len_4_before):find_4_all_idx(i-len_4_before)+2);
            end
    

            % SEPARATE
            new_lines=find(A_4==13);
            len=length(new_lines)/2;
            if (len~=0) % sometimes we can read only new frame, without new_line
                % disp('len_new_lines')
                % remove last 2 digits from 13 13 13
                clean_new_lines=zeros(1,len,'uint32');
                for i=1:len
                    clean_new_lines(i)=new_lines(2*i-1);
                end
        
                %% ASSUME, that row cannot start from new line !!!
                A_sep=cell(1,len+1); % preallocated memory, carefull size
        
                % clean_new_lines(1)
                % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
                A_sep{1}=A_4(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
                for i=2:len % if <1 not processing.
                    A_sep{i} = A_4(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
                end
                zero_index=find(A_4==0,1,'first')-1;
                A_sep{len+1}=A_4(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                
                % for i=1:length(A_sep)
                %    A_sep{i}
                % end
                
                for i=1:len+1
                    size_A_sepi=length(A_sep{i})/3;
                    for j=1:size_A_sepi
                        if (A_sep{i}(3*(j-1)+1)==0)
                            M_4(temp_row_4,j)=250;
                        else
                            % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
                            try
                                M_4(temp_row_4, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
                            catch
                                disp('wasted M_4');
                            end % try
                        end
                    end
                    temp_row_4=temp_row_4+1; % next line
                end  % for i
                temp_row_4=1;
            end % len ~=0

            % SEPARATE


            set(pl(4),'CData',M_4);
            redraw_4=true;    

            %% Previous frame is done -> A_4 is complete -> prcess it
            M_4=zeros(maximum_y_points_4,maximum_x_points_4,'uint8');
            % disp('new frame 1')
            A_4=zeros(1,3*maximum_x_points_4*maximum_y_points_4,'uint32'); % +1 since new line saved in this array
            % class(A_4)

            % fill array, which after new frame
            len_4_full=length(find_4_all_idx); % all points
            len_4=find(find_4_all_idx==new_frame_4_idx);
            for i=1:len_4_full-len_4
                A_4(3*i-2:3*i) = good_out(find_4_all_idx(i+len_4):find_4_all_idx(i+len_4)+2);
            end
    
            len_4_before=len_4_full-len_4;
            new_frame_4_idx=0;
        end % new_frame_4

   
    end



%     function X5()
%         find_5_all_idx = find(good_out==5); % find indexes of all points 

%         if (new_frame_5_idx == 0) % no new frame for sub_5
%             len_5 = length(find_5_all_idx); % how many points in this package
%             % fill array from last good_out
%             for i=len_5_before+1:len_5_before+len_5
%                 A_5(3*i-2:3*i) = good_out(find_5_all_idx(i-len_5_before):find_5_all_idx(i-len_5_before)+2);
%             end
%             len_5_before=len_5_before+len_5;
        
%         else % we have new frame, so first fill before new_line ant htne after new_line
%             len_5=find(find_5_all_idx==new_frame_5_idx)-1; % how many points until new frame
%             for i=len_5_before+1:len_5_before+len_5
%                 A_5(3*i-2:3*i) = good_out(find_5_all_idx(i-len_5_before):find_5_all_idx(i-len_5_before)+2);
%             end
        
%             % SEPARATE
%             new_lines=find(A_5==13);
%             len=length(new_lines)/2;
%             if (len~=0) % sometimes we can read only new frame, without new_line
%                 % disp('len_new_lines')
%                 % remove last 2 digits from 13 13 13
%                 clean_new_lines=zeros(1,len,'uint16');
%                 for i=1:len
%                     clean_new_lines(i)=new_lines(2*i-1);
%                 end
        
%                 %% ASSUME, that row cannot start from new line !!!
%                 A_sep=cell(1,len+1); % preallocated memory, carefull size
        
%                 % clean_new_lines(1)
%                 % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
%                 A_sep{1}=A_5(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
%                 for i=2:len % if <1 not processing.
%                     A_sep{i} = A_5(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
%                 end
%                 zero_index=find(A_5==0,1,'first')-1;
%                 A_sep{len+1}=A_5(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                
%                 % for i=1:length(A_sep)
%                 %    A_sep{i}
%                 % end
                
%                 for i=1:len+1
%                     size_A_sepi=length(A_sep{i})/3;
%                     for j=1:size_A_sepi
%                         if (A_sep{i}(3*(j-1)+1)==0)
%                             M_5(temp_row_5,j)=250;
%                         else
%                             % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
%                             try
%                                 M_5(temp_row_5, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
%                             catch
%                                 disp('wasted M_5');
%                             end % try
%                         end
%                     end
%                     temp_row_5=temp_row_5+1; % next line
%                 end  % for i
%                 temp_row_5=1;
%             end % len ~=0
% % SEPARATE


%             set(pl(5),'CData',M_5);
%             redraw_5=true;    

%             %% Previous frame is done -> A_5 is complete -> prcess it
%             M_5=zeros(maximum_y_points_5,maximum_x_points_5,'uint8');
%             % disp('new frame 1')
%             A_5=zeros(1,3*maximum_x_points_5*maximum_y_points_5,'uint32'); % +1 since new line saved in this array
%             % class(A_5)

%             % fill array, which after new frame
%             len_5_full=length(find_5_all_idx); % all points
%             len_5=find(find_5_all_idx==new_frame_5_idx);
%             for i=1:len_5_full-len_5
%                 A_5(3*i-2:3*i) = good_out(find_5_all_idx(i+len_5):find_5_all_idx(i+len_5)+2);
%             end
        
%             len_5_before=len_5_full-len_5;
%             new_frame_5_idx=0;
%         end % new_frame_5


%     end





%     function X6()
%         find_6_all_idx = find(good_out==6); % find indexes of all points 

%         if (new_frame_6_idx == 0) % no new frame for sub_6
%             len_6 = length(find_6_all_idx); % how many points in this package
%             % fill array from last good_out
%             for i=len_6_before+1:len_6_before+len_6
%                 A_6(3*i-2:3*i) = good_out(find_6_all_idx(i-len_6_before):find_6_all_idx(i-len_6_before)+2);
%             end
%             len_6_before=len_6_before+len_6;
        
%         else % we have new frame, so first fill before new_line ant htne after new_line
%             len_6=find(find_6_all_idx==new_frame_6_idx)-1; % how many points until new frame
%             for i=len_6_before+1:len_6_before+len_6
%                 A_6(3*i-2:3*i) = good_out(find_6_all_idx(i-len_6_before):find_6_all_idx(i-len_6_before)+2);
%             end
    
%             % SEPARATE
%             new_lines=find(A_6==13);
%             len=length(new_lines)/2;
%             if (len~=0) % sometimes we can read only new frame, without new_line
%                 % disp('len_new_lines')
%                 % remove last 2 digits from 13 13 13
%                 clean_new_lines=zeros(1,len,'uint16');
%                 for i=1:len
%                     clean_new_lines(i)=new_lines(2*i-1);
%                 end
        
%                 %% ASSUME, that row cannot start from new line !!!
%                 A_sep=cell(1,len+1); % preallocated memory, carefull size
        
%                 % clean_new_lines(1)
%                 % SOME TIMES ERROR HERE!! because clean_new_lines can be 1x0. FIXED!!!
%                 A_sep{1}=A_6(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
%                 for i=2:len % if <1 not processing.
%                     A_sep{i} = A_6(clean_new_lines(i-1)+2:clean_new_lines(i)-2);
%                 end
%                 zero_index=find(A_6==0,1,'first')-1;
%                 A_sep{len+1}=A_6(clean_new_lines(len)+2:zero_index);  % outside for, since end.. 
                
%                 % for i=1:length(A_sep)
%                 %    A_sep{i}
%                 % end
                
%                 for i=1:len+1
%                     size_A_sepi=length(A_sep{i})/3;
%                     for j=1:size_A_sepi
%                         if (A_sep{i}(3*(j-1)+1)==0)
%                             M_6(temp_row_6,j)=250;
%                         else
%                             % REMOVE 10, %% -> ACCURACY is no more, than 1/256, since M_! is uin8
%                             try
%                                 M_6(temp_row_6, j)=A_sep{i}(3*(j-1)+2)*80*(10-1) / ( A_sep{i}(3*(j-1)+3) ); % in
%                             catch
%                                 disp('wasted M_6');
%                             end % try
%                         end
%                     end
%                     temp_row_6=temp_row_6+1; % next line
%                 end  % for i
%                 temp_row_6=1;
%             end % len ~=0


%             set(pl(6),'CData',M_6);
%             redraw_6=true;    

%             %% Previous frame is done -> A_6 is complete -> prcess it
%             M_6=zeros(maximum_y_points_6,maximum_x_points_6,'uint8');
%             % disp('new frame 1')
%             A_6=zeros(1,3*maximum_x_points_6*maximum_y_points_6,'uint32'); % +1 since new line saved in this array
%             % class(A_6)

%             % fill array, which after new frame
%             len_6_full=length(find_6_all_idx); % all points
%             len_6=find(find_6_all_idx==new_frame_6_idx);
%             for i=1:len_6_full-len_6
%                 A_6(3*i-2:3*i) = good_out(find_6_all_idx(i+len_6):find_6_all_idx(i+len_6)+2);
%             end
    
%             len_6_before=len_6_full-len_6;
%             new_frame_6_idx=0;
%         end % new_frame_6
        
%     end % function X6


    

    % function pause the program
    function delay_ms(seconds)
        tic;
        while toc < seconds/1000
        end
    end



end % main