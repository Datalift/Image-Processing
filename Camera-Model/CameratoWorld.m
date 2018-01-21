downsample = 2;
f = 525;
kx = 1;
ky = 1;
tita = 90;
x0 = 319.5;
y0 = 239.5;
xmax = x0*2+1;
ymax = y0*2+1;

image_RGB = imread('person_rgb.png');
imshow(image_RGB);
image_RGB = imrotate(image_RGB, 180); % Image rotated (pinhole model). 
pause();
image_depth = imread('person_depth.png');
imshow(image_depth); % The depth image also has to be rotated.
image_depth = imrotate(image_depth,180);
pause();

X = zeros(ymax,xmax);
Y = zeros(ymax,xmax);
Z = image_depth;

for yp = 1:ymax %y prime
    for xp = 1:xmax %x prime
        lambda = image_depth(yp,xp);
        X(yp,xp) = lambda*((xp-0)/f);
        Y(yp,xp) = lambda*((yp-0)/f);
    end
end

plot3DScene(X,Y,Z,image_RGB,downsample);