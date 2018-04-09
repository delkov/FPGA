try
    flushinput(s); % lags sometime..
    fclose(s);    
catch
    %warning('serial not opened');
end

clear all;
clc;

%%% constants %%%
% maximum_number_points=3500;
maximum_x_points= 800;
maximum_y_points= 130;
sampling_time=1; % in ms0
% time_offset=19;
color=[0 20];
%%% 

if(~exist('s','Var'))
    serial_port='COM3';
    s = serial(serial_port,'BaudRate',500000,'DataBits',8,'InputBufferSize',80000); %20k is 1250points * 4 byte each, so take 40k.
    fopen(s);     
end

M=zeros(maximum_y_points,maximum_x_points);

if ~exist('h','Var')   
    h = figure('ToolBar','none');
    ax = axes('Parent', h);
    %set(ax,'XLim',[1,maximum_x_points],'YLim',[1,maximum_y_points]);
    %[~,pl]=contour(M);
    pl=surf(M,'EdgeColor','none');
    colorbar;
    view(0,90);
    colormap('jet');
    caxis([color(1) color(2)]);
    set(gca,'xlim',[1 maximum_x_points],'ylim',[1 maximum_y_points]);
    set(gca,'YDir','reverse')
end


delay_ms(10); % delay to initialize figure & co
count_old=1;
temp_row=maximum_y_points-1;
left_out=[];

while 1
    if (s.BytesAvailable>8)
        % input_buffer=s.BytesAvailable;
        [out,count]=fread(s,s.BytesAvailable,'uint16');        
        disp('Received Bytes');
        disp(count*2);
        
        % if (count>10000)
            % M=zeros(maximum_y_points,maximum_x_points);
        % end

        out=[left_out; out];
        first_byte_position=find(out==1,1,'first');
        last_byte_position=find(out==1,1,'last');
        left_out=out(last_byte_position:end);

        good_out=[out(first_byte_position:last_byte_position-1)];

        % make separation by lines %
        [A_sep, start_new_row]=SEP(good_out);
        len_A_sep=length(A_sep);

        if (len_A_sep-1==0)  % no new lines input
            disp('SINGLE LINE')
            len_A_sepi_last=length(A_sep{len_A_sep});

            if (start_new_row==1)
                temp_row=temp_row-1;
                count_old=1;
            end

            try
                M(temp_row, count_old:count_old+len_A_sepi_last/4-1) = TOF(A_sep{len_A_sep});
            catch
                disp('size erro')
            end
            count_old=count_old+len_A_sepi_last/4; % shift +1 already included
        else  % we have at least one new line
            % processing from 1 to last-1 lines
            for i=1:len_A_sep-1
                disp('MANY LINES')
                len_A_sepi=length(A_sep{i});
                % disp('start_new_row')
                % disp(start_new_row)
                if (start_new_row) %% directly jump to the next row, no need to write to prev. line
                   disp('start new row')
                    if (i==1) % jump to next row only once
                        % disp('i==1 start new row')
                        temp_row=temp_row-1;
                        % disp('NEW_TEMP, i==1')
                        % remove all if exceeds 
                        if (temp_row<0)
                            temp_row=maximum_y_points-1;
                            % M=zeros(maximum_y_points,maximum_x_points);
                        end
                    end
                    %M(temp_row, 1:len_A_sepi/4)
                    try
                        M(temp_row, 1:len_A_sepi/4) = TOF(A_sep{i});  
                        temp_row=temp_row-1;
                    catch
                        disp('size error')
                    end
                    % disp('NEW_TEMP, i!=1')
                    % remove all if exceeds 
                    if (temp_row<1)
                        temp_row=maximum_y_points-1;
                        % M=zeros(maximum_y_points,maximum_x_points);
                    end
                %% should write previous row up to the end and than jump to new one
                else 
                    disp('start new row 0')
                    if (i==1)
                        % disp('i =1 start new row 0')
                        % len_A_sepi/4
                        % TOF(A_sep{i});
                        try
                            M(temp_row,count_old:count_old+len_A_sepi/4-1) = TOF(A_sep{i});
                            temp_row=temp_row-1;
                        catch
                            disp('size error')
                        end
                        % disp('NEW_TEMP, i==1')
                        if (temp_row<1)
                            temp_row=maximum_y_points-1;
                            % M=zeros(maximum_y_points,maximum_x_points);
                        end
                        count_old=1;
                    else % just new lines now.. already read data for past line
                        % disp('start new row 0, i != 0')
                        try
                            M(temp_row, 1:len_A_sepi/4) = TOF(A_sep{i});  
                            temp_row=temp_row-1;
                        catch
                            disp('size error')
                        end
                        % disp('NEW_TEMP, i!=1')
                        if (temp_row<1)
                            temp_row=maximum_y_points-1;
                            % M=zeros(maximum_y_points,maximum_x_points);
                        end
                    end
                end % new row
            end  % for

            %% WERE many lines, process last line
            if (len_A_sep==1 & start_new_row==1)
            % if (start_new_row==1)
                temp_row=temp_row-1;
            end

            disp('PROCESS LAST LINE')
            len_A_sepi_last=length(A_sep{len_A_sep});
            % disp(A_sep{len_A_sep});
            count_old=1;
            try
                M(temp_row, count_old:count_old+len_A_sepi_last/4-1) = TOF(A_sep{len_A_sep});
                count_old=len_A_sepi_last/4+1;
            catch
                disp('size error')
            end
        end % check how many lines





    if ~ishandle(h)   

    h = figure('ToolBar','none');
    ax = axes('Parent', h);
    %set(ax,'XLim',[1,maximum_x_points],'YLim',[1,maximum_y_points]);
    %[~,pl]=contour(M);
    pl=surf(M,'EdgeColor','none');
    colorbar;
    view(0,90);
    colormap('jet');
    caxis([color(1) color(2)]);
    set(gca,'xlim',[1 maximum_x_points],'ylim',[1 maximum_y_points]);
    M=zeros(maximum_y_points,maximum_x_points);

    set(pl,'ZData',M);
else 


        set(pl,'ZData',M);
        drawnow
end
    end % if there is buffer
    delay_ms(sampling_time);
end % while



function [A_sep, start_new_row] = SEP(A)
    new_lines=find(A==2);
    len=length(new_lines);

    if (len>0)
        if (new_lines(1)==2)
            start_new_row=1;
            for i=1:len-1 % if <1 no processing.
                A_sep{i} = A(new_lines(i)+1:new_lines(i+1)-2);   
            end    
            A_sep{len}=A(new_lines(len)+1:end);
        else
            start_new_row=0;
            A_sep{1}=A(1:new_lines(1)-2);
            for i=2:1:len % if <1 no processing.
                A_sep{i} = A(new_lines(i-1)+1:new_lines(i)-2);
            end    
            A_sep{len+1}=A(new_lines(len)+1:end);  
        end
    else
        disp('no new lines..')
        start_new_row=0;
        A_sep{1}=A; 
    end % len > 0
end % function


    
function TOF_AR = TOF(A)%,CLK_PERIOD,CALIB_PERIODS)
    % try
        size_B=length(A)/4;
        TOF_AR=zeros(1,size_B);
        for i=1:1:size_B
            TOF_AR(i)=10^9*(A(4*(i-1)+2)*125*10^-9*(10-1)/(A(4*(i-1)+4)-A(4*(i-1)+3)))*0.15-2.9; % time offset & 0.15m

           % TOF_AR(i)=A(4*(i-1)+2);%*125*10^-9*(10-1)/(A(4*(i-1)+4)-A(4*(i-1)+3)))*0.15-2.9; % time offset & 0.15m


        end

    
    % catch
        % disp('size error')
        % TOF_AR=fliplr(TOF_AR)
    % end
end

function delay_ms(seconds)
% function pause the program
    tic;
    while toc < seconds/1000
    end
end