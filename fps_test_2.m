nFrames = 50; depth = 2^8; 
stack = uint8(rand(2048, 2048, nFrames) .* depth); 
figure; h = imagesc(stack(:, :, 1)); colormap(gray(depth)); 
t = tic; 
for ii = 1:nFrames 
    set(h, 'CData', stack(:, :, ii)); drawnow; 
end 
disp(['FPS = ', num2str(nFrames/toc(t))]); 