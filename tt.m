clear; clc

% dfdfd

delete(instrfindall);
if(~exist('s','Var'))
    ser_list=seriallist()
    serial_port=ser_list(1)
    % getting data by bytes, so 8 bits
    % 3.5Mhz is working!!
    s = serial(serial_port,'BaudRate',4000000,'DataBits',8,'InputBufferSize',480000); %20k is 1250points * 4 byte each, so take 40k.
    fopen(s);     
end

flushinput(s);
delay_ms(1000);

%fwrite(s, 'd')

left_out=[]
start_ok=false;

fileID = fopen('serial_checking_tt.txt','w');
while 1
     if (s.BytesAvailable>7)
          % [out, count] = fread(s,s.BytesAvailable,'uint16')
            % out = [left_out; fread(s,s.BytesAvailable,'uint16')]; % both of them 16 bit -> it also 16bit; PREALLOCATED is not needed in such cases

            out=fread(s,s.BytesAvailable,'uint16');
            out(1:3)
            find(out==1792)



            fprintf(fileID,'%d\n',out);


            % if out(2) > 400
            %     out(2)
            % end

            % out(1)
            % TOF()
            % separate by good packages
            % out_idx = find(out<3); % 6 susbs we have
            % first_byte_position = min(out_idx);
            % last_byte_position = max(out_idx);
            
            % %probably 1 x or 1 x y11
            % left_out=out(last_byte_position:end); % uint16, since out is uint16
            
            % % totaly wright input, like 1 x y z
            % good_out=out(first_byte_position:last_byte_position-1); % uint16
            % % disp([out(1) out(2) out(3)])
            % A=TOF(good_out);
            % % A(1)
     end

     delay_ms(100);
end


    
function TOF_AR = TOF(A)%,CLK_PERIOD,CALIB_PERIODS)
    % try
        % size_B=length(A)/4;
        size_B=length(A)/3;
        TOF_AR=zeros(1,size_B);
        for i=1:1:size_B
            disp('mesurement')
            TOF_AR(i)=(A(3*(i-1)+2)*80*(10-1))/(A(3*(i-1)+3)); % time offset & 0.15m
% (A(3*(i-1)+2)*80*(10-1))/(A(3*(i-1)+3))
           % TOF_AR(i)=(A(4*(i-1)+2)*80*(10-1))/(A(4*(i-1)+4)-A(4*(i-1)+3)); % time offset & 0.15m
             % 10^9*(A(4*(i-1)+2)*125*10^-9*(10-1)/(A(4*(i-1)+4)-A(4*(i-1)+3)))*0.15-2.9
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


% clear; clc


% % if(~exist('s','Var'))
%     ser_list=seriallist();
%     serial_port=ser_list(1)
%     % getting data by bytes, so 8 bits
%     % 3.5Mhz is working!!
    
%     i=3499990;
%     while 1

%       i=i+1;
%       if (mod(i,25)==0)
%         i
%       end

%       s = serial(serial_port,'BaudRate',i,'DataBits',8,'InputBufferSize',160000); %20k is 1250points * 4 byte each, so take 40k.
%       try
%         fopen(s);     
%         fclose(s)
%         disp('WORRKING')
%         disp(i)
%       end
    
%     end

% % end

% % flushinput(s);
% % delay_ms(1000);

% %fwrite(s, 'd')

% % while 1
% %      if (s.BytesAvailable>7)
% %           [out, count] = fread(s,s.BytesAvailable,'uint16')
% %           % TOF(out)
% %      end

% %      delay_ms(100);
% % end





% % function delay_ms(seconds)
% % % function pause the program
% %     tic;
% %     while toc < seconds/1000
% %     end
% % end