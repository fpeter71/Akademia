% just show: showcap('something.cap', '');
% show and covert to avi: showcap('something.cap', 'something.avi');

function showcap(filename, savedavifilename)

if ~isempty(savedavifilename)
    aviobj = avifile(savedavifilename, 'FPS', 24, 'Compression', 'None');
end
disp(filename);

fileID = fopen(filename);
% header of the cap file
A = fread(fileID,[4,1],'uint32');
X = A(1);
Y = A(2);
bytesperframe = A(3);
framesinvideo = A(4);    

% frames
for frame=1:framesinvideo
    % single frame content: x*y byte and a timestamp
    tmp = fread(fileID,[X,Y],'uint8');
    if isempty(tmp)
        break
    end
    minute = fread(fileID,[1,1],'uint32');
    nsec = fread(fileID,[1,1],'uint32');

    % decode of linux timestamp to msecs
    if frame == 1  
        timestampbase = minute*1e3 + nsec / 1e6 ;
    end
    timestamp = minute*1e3 + nsec / 1e6 - timestampbase;

    % the current grayscale image:
    currentframe = tmp';
    
    % avi file saving, first a bit contrast strech and coversion to RGB
    RGB = zeros(size(currentframe,1),size(currentframe,2),3);  
    contraststreched = currentframe-min(min(currentframe));
    contraststreched = contraststreched/max(max(contraststreched))*0.9;
    RGB(:,:,1)=contraststreched;
    RGB(:,:,2)=contraststreched;
    RGB(:,:,3)=contraststreched;

    % show the image
    figure(1)
    imagesc(RGB);
    colormap(gray)
  %  title(sprintf('filename: %s, timestamp: %.1f sec', filename, timestamp/1e3))
    drawnow

    % save fram to the avi file
    if ~isempty(savedavifilename)
        aviobj = addframe(aviobj,RGB);  
    end
    
end


clf
imagesc(currentframe);
colormap(gray);

BW = or(conv2(currentframe, [1 1 1;0 0 0;-1 -1 -1], 'valid')>5, conv2(currentframe, [1 1 1;0 0 0;-1 -1 -1]', 'valid')>5); 
%imagesc(currentframe);

hold on
% lines
[H,T,R] = hough(BW);
P  = houghpeaks(H,20);
lines = houghlines(BW,T,R,P, 'MinLength', 40,'FillGap',800 );
HorizontalPoints = [];
max_len = 0;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    
    % determine the endpoints of the longest line segment
    diffline = lines(k).point1 - lines(k).point2;
    len = norm(diffline);
    skew = atan2(diffline(1), diffline(2)) / pi * 180;
    
    % filter non hor or ver
    if abs(abs(skew) - 180)<20
        plot(xy(:,1),xy(:,2),'k-.');
        HorizontalPoints(end+1) = xy(1,1);
    end
end
hold off
mean(diff(sort(HorizontalPoints)))





% close cap and avi files
fclose(fileID);
if ~isempty(savedavifilename)
    aviobj = close(aviobj);
end



