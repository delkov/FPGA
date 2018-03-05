clear; clc

nFrames = 50; depth = 2^8; 
stack = uint8(rand(2048, 2048, nFrames) .* depth); 

figure; h = image(stack(:, :, 1)); colormap(gray(depth)); 
    

    color=[0 10];
    show_x_min=0;
    show_x_max=2048;
    show_y_min=0;
    show_y_max=2048;

ax=gca;
ax.CLim = [10 20]; % color limit


        ax.XLim=[show_x_min, show_x_max];
        ax.YLim=[show_y_min, show_y_max];

        % set(ax, 'xlimmode','manual',...
        %    'ylimmode','manual',...
        %    'zlimmode','manual',...
        %    'climmode','manual',...
        %    'alimmode','manual');

        



t = tic; 
for ii = 1:nFrames 
    set(h, 'CData', stack(:, :, ii)); drawnow; 
end 
disp(['FPS = ', num2str(nFrames/toc(t))]); 