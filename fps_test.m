x_size=300;
y_size=10;





h=figure('ToolBar','none','units','normalized','outerposition',[0 0 1 1], 'color', 'black');

color=[0 40];
M=randn(y_size,x_size);


[ha, pos] = tight_subplot(1,2,[0 0],[.02 .02],[.01 .01]);

ax=gca;
axes(ha(1));
pl(1)=imagesc(M,[color(1) color(2)]);
ax.Color=[0 0 0];
ax.YTick = [0:1:30];
ax.XTick = [0:1:30];
ax.YAxisLocation = 'left';
ax.XColor=[1,1,1];
ax.YColor=[1,1,1];
ax.XLim=[1, x_size];
ax.YLim=[1, y_size];

ax=gca;
axes(ha(2));
pl(2)=imagesc(M,[color(1) color(2)]);
ax.Color=[0 0 0];
ax.YTick = [0:1:30];
ax.XTick = [0:1:30];
ax.YAxisLocation = 'left';
ax.XColor=[1,1,1];
ax.YColor=[1,1,1];
ax.XLim=[1, x_size];
ax.YLim=[1, y_size];


% set(gcf, 'Renderer', 'painters') 
set(gcf, 'GraphicsSmoothing','off') 



tic
for i=1:100
	M=randn(y_size,x_size);
	set(pl,'CData',M);
	% drawnow limitrate nocallbacks
	drawnow limitrate
end

toc