function myui

% h=figure('Position',pos(3,:),'MenuBar', 'none', 'ToolBar','none','units','normalized','outerposition',[0 0 1 1], 'color', 'black');
baud_rate=4000000;
% buffer_size=100000; % in bytes
pos = get(0,'MonitorPositions');
hfig = figure('Position',pos(2,:),'MenuBar', 'none', 'ToolBar','none');

bg = uibuttongroup('Visible','off',...
                  'Position',[0 0 .1 1],...
                  'SelectionChangedFcn',@bselection);
              
% Create three radio buttons in the button group.
r1 = uicontrol(bg,'Style',...
                  'radiobutton',...
                  'String','d',...
                  'Units','normalized',...
                  'OuterPosition',[0 0 1 .1],...
                  'HandleVisibility','off');
              
r2 = uicontrol(bg,'Style','radiobutton',...
                  'String','h',...
                  'Position',[10 250 100 30],...
                  'HandleVisibility','off');

              
% Make the uibuttongroup visible after creating child objects. 
bg.Visible = 'on';

    ser_list=seriallist()
    % serial_port=ser_list(1)
    % serial_port=input('Which port?\n')
    % fwrite(s,uint8(user_input),'uint8')
    % serial_port='/dev/ttyUSB1'
    % getting data by bytes, so 8 bits
    s = serial(ser_list(1),'BaudRate',baud_rate,'DataBits',8); %20k is 6000 points * 8 byte each, so take 40k.
    % callback genetration

    % s.ByteOrder = 'bigEndian';
    % s.ByteOrder = 'littleEndian';
    % s.BytesAvailableFcnCount = size_to_read;
    % s.BytesAvailableFcnMode = 'byte';
    % s.BytesAvailableFcn = {@READY_TO_READ};
    fopen(s);     

    function bselection(source,event)
       display(['Current: ' event.NewValue.String]);

% end

    % user_input=input('Which command?\n','s');
    fwrite(s,uint8(event.NewValue.String),'uint8')



    end
end