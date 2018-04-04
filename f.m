clear; clc;
delete(instrfindall); % remove already opened serial

% for serial
baud_rate=4000000;
buffer_size=100000; % in bytes

% if(~exist('s','Var'))
    ser_list=seriallist()
    for i=1:1:length(ser_list)
        if (contains(ser_list(i), '/dev/ttyUSB'))
            ser_number=i;
        end
    end




    serial_port=ser_list(ser_number)
    % serial_port=input('Which port?\n')
    % fwrite(s,uint8(user_input),'uint8')
    % serial_port='/dev/ttyUSB1'
    % getting data by bytes, so 8 bits
    s = serial(ser_list(ser_number),'BaudRate',baud_rate,'DataBits',8,'InputBufferSize',buffer_size); %20k is 6000 points * 8 byte each, so take 40k.
    % callback genetration

    % s.ByteOrder = 'bigEndian';
    % s.ByteOrder = 'littleEndian';
    % s.BytesAvailableFcnCount = size_to_read;
    % s.BytesAvailableFcnMode = 'byte';
    % s.BytesAvailableFcn = {@READY_TO_READ};
    fopen(s);     
% end

    % user_input=input('Which command?\n','s');
    fwrite(s,uint8('f'),'uint8')
    % swapbytes(uint8('d'))

    % fwrite(s,uint8('f'),'uint8')
    clear 