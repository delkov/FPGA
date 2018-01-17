clear; clc
delete(instrfindall);

main();

function main()

    % we shoul plot tep_row +1!! since if overflow program is still working!!!!
    maximum_x_points= 100; % make it bigger 5% 
    maximum_y_points= 150; % make it bigger 5%
    color=[0 255];
    
    M_1=zeros(maximum_y_points,maximum_x_points,'uint8');
    M_2=zeros(maximum_y_points,maximum_x_points,'uint8');
    M_3=zeros(maximum_y_points,maximum_x_points,'uint8');
    
    A_1=zeros(1,4*(maximum_x_points+1)*maximum_y_points,'uint32'); % +1 since new line saved in this array. Don't forget about x4;
    


    if(~exist('s','Var'))
        ser_list=seriallist();
        serial_port=ser_list(1);
        % getting data by bytes, so 8 bits
        s = serial(serial_port,'BaudRate',4000000,'DataBits',8,'InputBufferSize',160000); %20k is 6000 points * 8 byte each, so take 40k.
        fopen(s);     
    end
    
    if ~exist('h','Var')   
        h=figure('ToolBar','none','units','normalized','outerposition',[0 0 1 1]);
        % cla
        ax = axes('Parent', h);
        [ha, pos] = tight_subplot(1,3,[0 0],[.01 .01],[.01 .01]);
        axes(ha(1));
        pl(1)=imagesc(M_1,[color(1) color(2)]);
        axes(ha(2));
        pl(2)=imagesc(M_2,[color(1) color(2)]);
        axes(ha(3));
        pl(3)=imagesc(M_3,[color(1) color(2)]);
        
        set(ha,'YTickLabel',[]) 
        set(ha,'YTick',[])
        set(ha,'XTick',[])
        % set(ha,'Box','off')1
        % colorbar;
        colormap('jet');
    end
    
    % wait initialization of frames % co.
    delay_ms(1000);
    
    % flush serial to avoid overflow
    flushinput(s);
    
    left_out=uint16([]); % to make good out 16bit
    len_1_before=0;
    new_frame_1_idx=0;
    temp_row=1;%maximum_y_points;
    
    while 1
        if (s.BytesAvailable>7)
            % uint16 is fine, since calib2 ~ 27k
            % join with prev. left_out
            out = [left_out; fread(s,s.BytesAvailable,'uint16')]; % both of them 16 bit -> it also 16bit; PREALLOCATED is not needed in such cases
    
            % separate by good packages
            out_idx = find(out<7); % 6 susbs we have
            first_byte_position = min(out_idx);
            last_byte_position = max(out_idx);
            
            %probably 1 x or 1 x y11
            left_out=out(last_byte_position:end); % uint16, since out is uint16
            % totaly wright input, like 1 x y z
            good_out=out(first_byte_position:last_byte_position-1); % uint16
            %% END separate by good packages1
    
    
            % find all new frames for all subs
            find_new_frames=find(good_out==14);
    
            for i=1:3:length(find_new_frames)
                switch good_out(find_new_frames(i)-1) % detect, which submodule
                    case 1
                        % index (in good_out array) of submodule, which have next 14
                        new_frame_1_idx=find_new_frames(i)-1;
                    case 2
                        % index (in good_out array) of submodule, which have next 14
                        new_frame_2_idx=find_new_frames(i)-1;
                    case 3
                        % index (in good_out array) of submodule, which have next 14
                        new_frame_3_idx=find_new_frames(i)-1;

                    otherwise
                        disp('wrong submodule for new frame..')
                end
            end
    
    
            find_1_all_idx = find(good_out==1); % find indexes of all points 
            find_2_all_idx = find(good_out==2); % find indexes of all points 
            find_3_all_idx = find(good_out==3); % find indexes of all points 
    

            if (new_frame_1_idx == 0) % no new frame for sub_1
                len_1 = length(find_1_all_idx); % how many points in this package
                % fill array from last good_out
                for i=len_1_before+1:len_1_before+len_1
                    A_1(4*i-3:4*i) = good_out(find_1_all_idx(i-len_1_before):find_1_all_idx(i-len_1_before)+3);
                end
                len_1_before=len_1_before+len_1;
            
    
            else % we have new frame, so first fill before new_line ant htne after new_line
                % disp('new frame')
                len_1=find(find_1_all_idx==new_frame_1_idx)-1; % how many points until new frame
                for i=len_1_before+1:len_1_before+len_1
                    A_1(4*i-3:4*i) = good_out(find_1_all_idx(i-len_1_before):find_1_all_idx(i-len_1_before)+3);
                end
    
                % A_1
                SEP_1();
                % M_1
    
                set(pl(1),'CData',M_1);
                set(pl(2),'CData',M_1);
                set(pl(3),'CData',M_1);
                drawnow;
    
                M_1=zeros(maximum_y_points,maximum_x_points,'uint8');
    
    
    
                %% Previous frame is done -> A_1 is complete -> prcess it
                disp('new frame')
                A_1=zeros(1,4*(maximum_x_points+1)*maximum_y_points,'uint32'); % +1 since new line saved in this array
                % class(A_1)


                % fill array, which after new frame
                len_1_full=length(find_1_all_idx); % all points
                len_1=find(find_1_all_idx==new_frame_1_idx);
                for i=1:len_1_full-len_1
                    A_1(4*i-3:4*i) = good_out(find_1_all_idx(i+len_1):find_1_all_idx(i+len_1)+3);
                end
    
                len_1_before=len_1_full-len_1;
                new_frame_1_idx=0;
            end % new_frame_1
    
    









        end % if buffer is not empty
    end % while 1
    
    
    
    
    %% careful about A_sep size.. ALSO WE HAVE ZEROS at the end of A_1, since preallocated..
    function SEP_1() 
        % disp(A_1)
        % size(A_1)   
        new_lines=find(A_1==13);
        len=length(new_lines)/3;

        % disp('len_new_lines')
        % len

        % remove last 2 digits from 13 13 13
        clean_new_lines=zeros(1,len,'uint16');
        for i=1:len
            clean_new_lines(i)=new_lines(3*i-2);
        end

        %% ASSUME, that row cannot start from new line !!!
        A_sep=cell(1,len+1); % preallocated memory, carefull size

        % clean_new_lines(1)
        A_sep{1}=A_1(1:clean_new_lines(1)-2); % process first line, outside loop, since start from 1, but not new_lines
        for i=2:len % if <1 not processing.
            A_sep{i} = A_1(clean_new_lines(i-1)+3:clean_new_lines(i)-2);
        end
        zero_index=find(A_1==0,1,'first')-1;
        A_sep{len+1}=A_1(clean_new_lines(len)+3:zero_index);  % outside for, since end.. 
    
    
        for i=1:length(A_sep)
           A_sep{i}
        end
    
        for i=1:len+1
            size_B=length(A_sep{i})/4;
            % TOF_AR=zeros(1,size_B,'uint8');  %% -> ACCURACY is no more, than 1/256
            
            for j=1:size_B
                if (A_sep{i}(4*(j-1)+2)==0)
                    % TOF_AR(j)=250;
                    M_1(temp_row,j)=250;
                else
                    % REMOVE 10
                    % TOF_AR(j)= 10*A_sep{i}(4*(j-1)+2)*80*(10-1) / ( A_sep{i}(4*(j-1)+4)-A_sep{i}(4*(j-1)+3) ); % in ns
                    M_1(temp_row, j)=10*A_sep{i}(4*(j-1)+2)*80*(10-1) / ( A_sep{i}(4*(j-1)+4)-A_sep{i}(4*(j-1)+3) ); % in
                end
            end
            
            % try
                % M_1(temp_row, 1:size_B) = TOF_AR; %uint8 = uint8
            % catch
                % disp('wasted')
            % end
    
            temp_row=temp_row+1;
            % temp_row=temp_row-1;
            
        end  % for i
    
        temp_row=1;%maximum_y_points;
    
    end % end SEP function
    
    
    
    % function pause the program
    function delay_ms(seconds)
        tic;
        while toc < seconds/1000
        end
    end



end % main