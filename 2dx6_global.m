clear all
clc 
%%% constants %%%
maximum_x_points= 20;
maximum_y_points= 20;
sampling_time=0; % in ms
% time_offset=19;
color=[0 100];
%%% 

global M_1
global M_2
global M_3
global count_old_1
global temp_row_1
global count_old_2
global temp_row_2
global count_old_3
global temp_row_3



count_old_1=1;
temp_row_1=maximum_y_points;
count_old_2=1;
temp_row_2=maximum_y_points;
count_old_3=1;
temp_row_3=maximum_y_points;

M_1=zeros(maximum_y_points,maximum_x_points);
M_2=zeros(maximum_y_points,maximum_x_points);
M_3=zeros(maximum_y_points,maximum_x_points);


if(~exist('s','Var'))
    ser_list=seriallist();
    serial_port=ser_list(1);%'/dev/ttyUSB6';
    s = serial(serial_port,'BaudRate',1000000,'DataBits',8,'InputBufferSize',80000); %20k is 1250points * 4 byte each, so take 40k.
    fopen(s);     
end



if ~exist('h','Var')   
    h = figure('ToolBar','none');
    ax = axes('Parent', h);
    [ha, pos] = tight_subplot(1,3,[0 0],[.01 .01],[.01 .01]); 
    axes(ha(1));
    pl(1)=imagesc(M_1,[color(1) color(2)]);
    axes(ha(2));
    pl(2)=imagesc(M_2,[color(1) color(2)]);
    axes(ha(3));
    pl(3)=imagesc(M_3,[color(1) color(2)]);
    
    set(ha,'YTickLabel',[]) ;
    set(ha,'YTick',[]);
    set(ha,'XTick',[]);
    % set(ha,'Box','off')
    %colorbar;
    colormap('jet');
end

delay_ms(10); % delay to initialize figure & co
left_out=[];

while 1
    if (s.BytesAvailable>7)
        % disp('count_old_1')
        % disp(count_old_1)
        % count_old
    % read from serial
        [out,count]=fread(s,s.BytesAvailable,'uint16');        
        
        out = [left_out; out];
        id1_first = find(out==1, 1, 'first');
        id2_first = find(out==2, 1, 'first');
        id3_first= find(out==3, 1, 'first');
        
        id1_last = find(out==1, 1, 'last');
        id2_last = find(out==2, 1, 'last');
        id3_last = find(out==3, 1, 'last');
        
        first_byte_position = min([id1_first,id2_first,id3_first]);
        last_byte_position = max([id1_last,id2_last,id3_last]);
        

        left_out=out(last_byte_position:end);
        good_out=[out(first_byte_position:last_byte_position-1)];
        
        A_1=[];
        A_2=[];
        A_3=[];
        
        for i=1:4:length(good_out)
            switch good_out(i)
                case 1
                    A_1=[A_1; good_out(i:i+3)];
                case 2
                    A_2=[A_2; good_out(i:i+3)];
                case 3
                    A_3=[A_3; good_out(i:i+3)];
                otherwise
                    % disp('error  switch')
                    good_out(i)
            end
        end
        
        
        % A_1
        % A_2
        % A_3
        
        new_frame_1=find(A_1==14,1,'last');
        if (new_frame_1)
           % disp('new frame 1')
           A_1_new_frame=A_1(new_frame_1+1:end);  
           A_1=A_1(1:new_frame_1-4);
        end
        
        
        
        [A_sep_1, start_new_row_1] = SEP(A_1);
        % [A_sep_2, start_new_row_2] = SEP(A_2);
        % [A_sep_3, start_new_row_3] = SEP(A_3);
        
        % disp('A_sep_1')
        % for i=1:length(A_sep_1)
        %     disp('new')
        %     disp(A_sep_1{i}')
        % end
        
        % tic
        [M_1, count_old_1, temp_row_1] = FILL_MATRIX(M_1, A_sep_1, start_new_row_1, count_old_1, temp_row_1, 1);
        % M_2 = FILL_MATRIX(M_2, A_sep_2, start_new_row_2,2);
        % M_3 = FILL_MATRIX(M_3, A_sep_3, start_new_row_3,3);
        
        
        % % update or reopen if not exist
        % if ~ishandle(h)     
        %     h = figure('ToolBar','none');
        %     ax = axes('Parent', h);
        %     %set(ax,'XLim',[1,maximum_x_points],'YLim',[1,maximum_y_points]);
        %     %[~,pl]=contour(M);
        %     pl=imagesc(M,[color(1), color(2)]);%'EdgeColor','none');
        %     colorbar;
        % %     colormap('jet');
        % %     caxis([color(1) color(2)]);
        % %     set(gca,'xlim',[1 maximum_x_points],'ylim',[1 maximum_y_points]);
        % %     M=zeros(maximum_y_points,maximum_x_points);
        % %     set(pl,'CData',M_1);
        % % % else /
            set(pl(1),'CData',M_1);
            set(pl(2),'CData',M_2);
            set(pl(3),'CData',M_3);
            drawnow
        % % end
        
        
        %delay_ms(100)
        
%%%% NEW FRAME %%%%        
        if(new_frame_1)
            count_old_1=1;
            temp_row_1=maximum_y_points;
            M_1=zeros(maximum_y_points,maximum_x_points);
        
            [A_sep_1, start_new_row_1] = SEP(A_1_new_frame);
            [M_1, count_old_1, temp_row_1] = FILL_MATRIX(M_1, A_sep_1, start_new_row_1, count_old_1, temp_row_1, 1);
        
            set(pl(1),'CData',M_1);
        % %     % set(pl(2),'CData',M_2);
        % %     % set(pl(3),'CData',M_3);
            drawnow
        end
        
    end % if serial buf is not empty
end % while 1
    
    
    
    
    
    
function [M, count_old, temp_row] = FILL_MATRIX (M, A_sep, start_new_row,count_old, temp_row, module_number)
    global M_1
    global count_old_1
    global temp_row_1  
    
    global M_3
    global count_old_3
    global temp_row_3
    
    global M_2
    global count_old_2
    global temp_row_2
    
    switch module_number
        case 1 
            M=M_1;
            temp_row = temp_row_1;
            count_old = count_old_1;
        case 2 
    
            M=M_2;
            temp_row = temp_row_2;
            count_old = count_old_2;
    
        case 3
            M=M_3;
            temp_row = temp_row_3;
            count_old = count_old_3;
        otherwise
            disp('wrong')
    end

    
    len_A_sep=length(A_sep);
    
    % disp('A_sep')
    % for i=1:length(A_sep)
    %     disp('new')
    %     A_sep{i}
    % end
    
    if (len_A_sep==0) % new lines at the end, so length is 0
        temp_row=temp_row-1;    
    elseif (len_A_sep-1==0)  % no new lines input


        disp('SINGLE LINE')
        len_A_sepi_last=length(A_sep{len_A_sep})/4;
    
    
        if (start_new_row==1)
            disp('start_new_row')
            temp_row=temp_row-1;
            count_old=1;
        end
    
    
        % M(temp_row, count_old:count_old+len_A_sepi_last/4-1) 
        % TOF(A_sep{len_A_sep})
        try
    
            M(temp_row, count_old:count_old+len_A_sepi_last-1) = TOF(A_sep{len_A_sep});
            % disp('FINE')
        catch
            disp('size error1')
        end
        % disp('new count_old')
        count_old=count_old+len_A_sepi_last; % shift +1 already included




    else  % we have at least one new line
        % processing from 1 to last-1 lines
        for i=1:len_A_sep-1
            disp('MANY LINES')
            len_A_sepi = length(A_sep{i})/4;
            if (start_new_row) %% directly jump to the next row, no need to write to prev. line
               disp('start new row')
                if (i==1) % jump to next row
                    temp_row=temp_row-1;
                end
                try
                    M(temp_row, 1:len_A_sepi) = TOF(A_sep{i});  
                    temp_row=temp_row-1;
                catch
                    disp('size error2')
                end
            else 
                disp('NO start new row')
                if (i==1)
                    % M(temp_row,count_old:count_old+len_A_sepi/4-1)
                    % TOF(A_sep{1})
                    try
                        M(temp_row,count_old:count_old+len_A_sepi-1) = TOF(A_sep{i});
                        temp_row=temp_row-1;
                    catch
                        disp('size error3')
                    end
                    count_old=1;
                else % just new lines now.. already write data for past line
                    try
                        M(temp_row, 1:len_A_sepi) = TOF(A_sep{i});  
                        temp_row=temp_row-1;
                    catch
                        disp('size error4')
                    end
                end
            end % new row
        end  % for
    
        %% WERE many lines, process last line since there is continue, so we keep count_old -> process separetly.
        % if (len_A_sep==1 & start_new_row==1)
    
    %%%%%%5 PROBABLY WRONG, SO COMMENT (ITS ALREADY INCLUDE AT THE BEGINING CASE!! %%%%
        % if (start_new_row==1)  % since len_A-sep can be 1..           
        %     temp_row=temp_row-1;
        % end
    %%%%%%%%%%%%%%%%%%%%%%
    
        disp('PROCESS LAST LINE')
        len_A_sepi_last=length(A_sep{len_A_sep})/4;
        % disp('sepi_last was')
        % disp(A_sep{len_A_sep});
        count_old=1;
        % M(temp_row, count_old:count_old+len_A_sepi_last/4-1)
        % A_sep{len_A_sep}
        % TOF(A_sep{len_A_sep})
    
        try
            M(temp_row, count_old:count_old+len_A_sepi_last-1) = TOF(A_sep{len_A_sep});
            count_old=len_A_sepi_last+1;
        catch
            disp('size error5')
        end
    
    end % check how many lines

end % function
    



function [A_sep, start_new_row] = SEP(A)
    new_lines=find(A==13);
    % remove last 2 digits from 13 13 13
    clean_new_lines=zeros(1,length(new_lines)/3);
    for i=1:length(new_lines)/3
        clean_new_lines(i)=new_lines(3*i-2);
    end
    %%

    len=length(clean_new_lines);
    % disp('new lines amounTT');
    % disp(len);
    if (len>0)
    
        if (clean_new_lines(1)==2) % start from new_line, shoul de len part
            start_new_row=1
            for i=1:len-1 % if <1 no processing.
                A_sep{i} = A(clean_new_lines(i)+3:clean_new_lines(i+1)-2); % actually it start from 4:new_lines(i+1)-2
            end    
            A_sep{len}=A(clean_new_lines(len)+3:end); % outside for, since end.. 
        else % should be len+1 part
            start_new_row=0;
            A_sep{1}=A(1:clean_new_lines(1)-2); % process first line, outside for since start from 1m but not new_lines
            for i=2:len % if <1 not processing.
                A_sep{i} = A(clean_new_lines(i-1)+3:clean_new_lines(i)-2);
            end    
            A_sep{len+1}=A(clean_new_lines(len)+3:end);  % outside for, since end.. 
        end
    
    else % no new lines
        disp('no new lines..')
        start_new_row=0;
        A_sep{1}=A; 
    end % len > 0
end % function


function TOF_AR = TOF(A)%,CLK_PERIOD,CALIB_PERIODS)
    try
        size_B=length(A)/4;
        % disp('size_B')
        % disp(size_B)
        TOF_AR=zeros(1,size_B);
        for i=1:1:size_B
            TOF_AR(i)=10^9*(A(4*(i-1)+2)*125*10^-9*(10-1)/(A(4*(i-1)+4)-A(4*(i-1)+3)))*5; % time offset & 0.15m
           % TOF_AR(i)=A(4*(i-1)+2);%*125*10^-9*(10-1)/(A(4*(i-1)+4)-A(4*(i-1)+3)))*0.15-2.9; % time offset & 0.15m
             % 10^9*(A(4*(i-1)+2)*125*10^-9*(10-1)/(A(4*(i-1)+4)-A(4*(i-1)+3)))*0.15-2.9
        end 
    catch
        disp('size error')
        % TOF_AR=fliplr(TOF_AR)
    end
end


% function pause the program
function delay_ms(seconds)
    tic;
    while toc < seconds/1000
    end
end

