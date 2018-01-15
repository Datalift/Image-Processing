downsample = 4.1;
f = 525;
kx = 1;
ky = 1;
tita = 90;
x0 = 319.5;
y0 = 239.5;
xmax = x0*2;
ymax = y0*2;
image_RGB = imread('person_rgb.png');
imshow(image_RGB);
pause(1);
image_depth = imread('person_depth.png');
imshow(image_depth);
pause(1);

X = zeros(xmax,ymax);
Y = zeros(xmax,ymax);
Z = image_depth./5000;

for xp = 1:639 %x prime
    for yp = 1:480 %y prime
        lambda = image_depth(xp,yp);
        X(xp,yp) = lambda*((xp-x0)/f);
        Y(xp,yp) = lambda*((yp-y0)/f);
    end
end

plot3DScene(X,Y,Z,image_RGB,downsample);