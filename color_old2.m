try
    flushinput(s); % lags sometime..
    fclose(s);    
catch
    %warning('serial not opened');
end

clear all;

clc;

%

new_line = uint8([hex2dec('A0'),hex2dec('B0'),hex2dec('C0')]);
new_frame = uint8([hex2dec('D0'),hex2dec('E0'),hex2dec('F0')]);
new_line_h = uint32(new_line(1))*65536 + uint32(new_line(2))*256 + uint32(new_line(3));
new_frame_h = uint32(new_frame(1))*65536 + uint32(new_frame(2))*256 + uint32(new_frame(3));


%maxY = 250;
%maxX = 500;
maxY = 130;
maxX = 130;
N = 2000; %sampling bytes


Raw_image = uint32(zeros(maxX, maxY));

Raw_image = Raw_image + 10000000;
Raw_data = uint32(zeros(fix(N/3+5),1));
%good_out = (zeros(N,1));

%% constants %%%
% maximum_number_points=3500;
maximum_x_points= maxX;
maximum_y_points= maxY;
sampling_time=1; % in ms0
% time_offset=19;
%color=[3.09 3.26];
%color = [1500 400000];
color = [0 8000];
%%% 

if(~exist('s','Var'))
    serial_port='/dev/ttyACM0';
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
    colormap('gray');
    caxis([color(1) color(2)]);
    set(gca,'xlim',[1 maximum_x_points],'ylim',[1 maximum_y_points]);
    set(gca,'YDir','reverse')
end


delay_ms(10); % delay to initialize figure & co
count_old=1;
temp_row=maximum_y_points-1;
left_out=[];


x = 1; y = 1;
start = 0;

while 1
    if (s.BytesAvailable>=N)
        [out,count]=fread(s,s.BytesAvailable,'uint8');        
        disp('Received Bytes');
        disp(count);
        %{
        
        k=find(out==new_frame(1),1,'first')
        if (out(k+1)==new_frame(2))
          if (out(k+2)==new_frame(3))
            frame_start = k;
          end
        end
              
      k=find(out==new_frame(1),1,'last')
        if (out(k+1)==new_frame(2))
          if (out(k+2)==new_frame(3))
            frame_finish = k;
          end
        end
       %} 
      start = start +1;  
        
      %k=find(out==new_line(1),1,'first')
      for k=1:(N-9)
         if (out(k)==new_line(1))
            if (out(k+1)==new_line(2))
              if (out(k+2)==new_line(3))
                line_start = k;
                break;
              end
            end
         end
      end   
              
    %  kf=find(out==new_line(1),2,'last')
      for k=(N-9):(-1):1
         if (out(k)==new_line(1))
            if (out(k+1)==new_line(2))
              if (out(k+2)==new_line(3))
                line_finish = k;
                break;
              end
            end
         end 
      end    
      
     if (exist('left_out')>0)
        good_out = [left_out; out(1:line_finish-1)];
      %  start = 1;
     else
        good_out = [out(line_start:line_finish-1)];
        %start = 0;
     end
     
     left_out = [out(line_finish:end)];
     ff = size(good_out,1);
     
      k = 1; 
      for i=1:3:(ff-2)
        Raw_data(k)=uint32(good_out(i))*65536+ uint32(good_out(i+1))*256+uint32(good_out(i+2));
       % disp(i);
      %  disp(dec2hex(Raw_data(k)));
        k = k +1;
      end
      
      z = 1;
      while (z<=fix(ff/3)) 
        if (Raw_data(z)== new_line_h)
          y = y + 1
          x = 1; 
          disp('kuku');
        elseif (Raw_data(z)== new_frame_h) 
          x = 1; 
          y = 1;
          disp('koko');
         % start  = start*2;
        else
            if (start>1)
                Raw_image(y,x) = Raw_data(z);
            end    
            x = x + 1
        end
            
        z = z + 1
        if (x>maxX) || (y>maxY)
         %   x = 1;
          %  y  = 1;
           % clear Raw_image;
           % Raw_image = zeros(maxX, maxY);
        end  
        
      end
      
   % M = sqrt(log(double(Raw_image+1)));
    M = (Raw_image);  
  
    if ~ishandle(h)   
        h = figure('ToolBar','none');
        ax = axes('Parent', h);
        %set(ax,'XLim',[1,maximum_x_points],'YLim',[1,maximum_y_points]);
        %[~,pl]=contour(M);
        pl=surf(M,'EdgeColor','none');
        colorbar;
        view(0,90);
        colormap('gray');
        caxis([color(1) color(2)]);
        set(gca,'xlim',[1 maximum_x_points],'ylim',[1 maximum_y_points]);
        M=zeros(maximum_y_points,maximum_x_points);
        set(pl,'ZData',M); 
    else 


        set(pl,'ZData',M);
        drawnow
    end
      
     %   clear good_out;
    end % len > 0
end % function


    


fclose(s);

delete(s);

function TOF_AR = TOF(A)%,CLK_PERIOD,CALIB_PERIODS)
    % try
        size_B=length(A)/4;
        TOF_AR=zeros(1,size_B);
        for i=1:1:size_B
            TOF_AR(i)=10^9*(A(4*(i-1)+2)*125*10^-9*(10-1)/(A(4*(i-1)+4)-A(4*(i-1)+3)))*0.15-2.9; % time offset & 0.15m
        end

end

function delay_ms(seconds)
    tic;
    while toc < seconds/1000
    end
end