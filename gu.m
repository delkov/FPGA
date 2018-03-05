% function myui
%     % Create a figure and axes
%     f = figure('Visible','off');
%     ax = axes('Units','pixels');
%     surf(peaks)
    
%     % Create pop-up menu
%     popup = uicontrol('Style', 'popup',...
%            'String', {'parula','jet','hsv','hot','cool','gray'},...
%            'Position', [20 340 100 50],...
%            'Callback', @setmap);    
    
%    % Create push button
%     btn = uicontrol('Style', 'pushbutton', 'String', 'Clear',...
%         'Position', [20 20 50 20],...
%         'Callback', 'cla');       

%    % Create slider
%     sld = uicontrol('Style', 'slider',...
%         'Min',1,'Max',50,'Value',41,...
%         'Position', [400 20 120 20],...
%         'Callback', @surfzlim); 
                    
%     % Add a text uicontrol to label the slider.
%     txt = uicontrol('Style','text',...
%         'Position',[400 45 120 20],...
%         'String','Vertical Exaggeration');

%     % guidata(f,sld)
    
%     get(sld)
%     % Make figure visble after adding all components
%     f.Visible = 'on';
%     % This code uses dot notation to set properties. 
%     % Dot notation runs in R2014b and later.
%     % For R2014a and earlier: set(f,'Visible','on');
    
%     function setmap(source,event)
%         val = source.Value;
%         maps = source.String;
%         % For R2014a and earlier: 
%         % val = get(source,'Value');
%         % maps = get(source,'String'); 

%         newmap = maps{val};
%         colormap(newmap);
%     end

%     function surfzlim(hFigure,event,handles)
%         val = 51 - hFigure.Value;
%         % get(handles.togglebutton1, 'Value')
%         % handles
%         % gcbo
%          handles = guidata(hFigure)
%          set(txt,'String',val)
%          % handles
%          % sld
%          % sliderValue = get(handles,'Value')

%  % handles = guihandles(source)

%         % For R2014a and earlier:
%         % val = 51 - get(source,'Value');
%         % get(gca,'txt')
%         zlim(ax,[-val val]);
%     end
% end
% figure();

function myui
bg = uibuttongroup('Visible','off',...
                  'Position',[0 0 1 .075],...
                  'HandleVisibility','off');
              
% Create three radio buttons in the button group.
S.r1 = uicontrol(bg,'Style',...
                  'radiobutton',...
                  'String','Option 1',...
                  'Units', 'normalized',...
                  'OuterPosition',[0.05 0 0.5 0.8],...
                  'HandleVisibility','off');
              
S.r2 = uicontrol(bg,'Style','radiobutton',...
                  'String','Option 2',...
                  'Units', 'normalized',...
                  'OuterPosition',[0.15 0 0.5 0.8],...
                  'HandleVisibility','off');

S.r3 = uicontrol(bg,'Style','radiobutton',...
                  'String','Option 3',...
                  'Units', 'normalized',...
                  'OuterPosition',[0.25 0 0.5 0.8],...
                  'HandleVisibility','off');

S.sl = uicontrol(bg,'Style','slider',...
                  'String','Distance range',...
                  'Units', 'normalized',...
                  'OuterPosition',[0.35 0.2 0.2 0.4],...
                  'HandleVisibility','on',...
                  'min',1,'max',100,'val',10,...  
                  'Callback', @slider_callback);

  % Add a text uicontrol to label the slider.
S.ed = uicontrol(bg,'Style','edit',...
                  'String', '10',...
                  'Units', 'normalized',...
                  'InnerPosition',[0.55 0.2 0.05 0.4],...
                  'HandleVisibility','on');

btn = uicontrol(bg, 'Style', 'pushbutton', 'String', 'Flip',...
                  'Units', 'normalized',...
                  'OuterPosition',[0.62 0.2 0.05 0.4],...
                  'HandleVisibility','on',...
                  'Callback', @reverse_image);       


btn1 = uicontrol(bg, 'Style', 'pushbutton', 'String', 'Pause',...
                  'Units', 'normalized',...
                  'OuterPosition',[0.82 0.2 0.05 0.4],...
                  'HandleVisibility','on',...
                  'val',1,...
                  'Callback', @pause_callback); 


btn2 = uicontrol(bg, 'Style', 'pushbutton', 'String', 'EXIT',...
                  'Units', 'normalized',...
                  'OuterPosition',[0.875 0.2 0.05 0.4],...
                  'HandleVisibility','on',...
                  'Value',0,...
                  'Callback', @exit_callback); 

% Make the uibuttongroup visible after creating child objects. 
bg.Visible = 'on';


% function reverse_image(source, event)


% end


set([S.sl,S.ed],'call',{@ed_call,S});  % Shared Callback.
function [] = ed_call(varargin)
[h,S] = varargin{[1,3]};  % Get calling handle and structure.

switch h  % Who called?
    case S.ed
        L = get(S.sl,{'min','max','value'});  % Get the slider's info.
        E = str2double(get(h,'string'));  % Numerical edit string.
        if E >= L{1} && E <= L{2}
            set(S.sl,'value',E)  % E falls within range of slider.
        else
            set(h,'string',L{3}) % User tried to set slider out of range. 
        end
    case S.sl
        set(S.ed,'string',get(h,'value')) % Set edit to current slider.
    otherwise
        % Do nothing, or whatever.
end
end



    function pause_callback(source,event)
      str=get(source,'String');
      if strcmp(str,'Pause')
        set(source,'String', 'Play')
      else
        set(source,'String', 'Pause')
      end

    end



    function exit_callback(source,event)
      get()
      get(source,'Value')
    end





end