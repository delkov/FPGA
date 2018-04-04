props = {'LineStyle','none','Marker','o','MarkerEdge','b','MarkerSize',6};
%% Scatter creation
T = 0;
cla
for i=1:10
	x = rand(1,1000);
	y = rand(1,1000);
	cla
	t = cputime;
	h = scatter( x,y );
	drawnow
	T = T + (cputime-t);
end
fprintf( 'Scatter creations: %.2f\n', T )
 
%% Lines creation
T = 0;
cla
for i=1:10
	x = rand(1,1000);
	y = rand(1,1000);
	cla
	t = cputime;
	h = line( [x;x], [y;y], props{:} );
	drawnow
	T = T + (cputime-t);
end
fprintf( 'Line creations: %.2f\n', T )
 
%% Scatter modification
T = 0;
cla
x = rand(1,1000);
y = rand(1,1000);
h = scatter(x,y);
for i=1:10
	y = rand(1,1000);
	t = cputime;
	set( h, 'YData', y );
	drawnow
	T = T + (cputime-t);
end
fprintf( '\nScatter modifications: %.2f\n', T )
 
%% Lines modification
T = 0;
cla
x = rand(1,1000);
y = rand(1,1000);
h = line( [x;x], [y;y], props{:} );
for i=1:10
	y = rand(1,1000);
	t = cputime;
	set( h, {'YData'}, num2cell([y;y]',2) );
	drawnow
	T = T + (cputime-t);
end
fprintf( 'Line modifications: %.2f\n', T )
 
%% Scatter color creation
T = 0;
cla
for i=1:10
	x = rand(1,1000);
	y = rand(1,1000);
	c = rand(1000,3);
	cla
	t = cputime;
	h = scatter( x,y,50,c );
	drawnow
	T = T + (cputime-t);
end
fprintf( '\nScatter color creation: %.2f\n', T )
 
%% Lines color creation
T = 0;
cla
for i=1:10
	x = rand(1,1000);
	y = rand(1,1000);
	c = rand(1000,3);
	cla
	t = cputime;
	h = line( [x;x], [y;y], props{:} );
	set( h, {'MarkerEdgeColor'}, num2cell(c,2) );
	drawnow
	T = T + (cputime-t);
end
fprintf( 'Line color creation: %.2f\n', T )
 
%% Scatter color modification
T = 0;
cla
x = rand(1,1000);
y = rand(1,1000);
c = rand(1000,3);
h = scatter(x,y,50,c);
for i=1:10
	y = rand(1,1000);
	t = cputime;
	set( h, 'YData', y );
	drawnow
	T = T + (cputime-t);
end
fprintf( '\nScatter color modification: %.2f\n', T )
 
%% Lines modification
T = 0;
cla
x = rand(1,1000);
y = rand(1,1000);
c = rand(1000,3);
h = line( [x;x], [y;y], props{:} );
set( h, {'MarkerEdgeColor'}, num2cell(c,2) );
for i=1:10
	y = rand(1,1000);
	t = cputime;
	set( h, {'YData'}, num2cell([y;y]',2) );
	drawnow
	T = T + (cputime-t);
end
fprintf( 'Line color modification: %.2f\n', T )