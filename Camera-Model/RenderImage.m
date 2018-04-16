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

image_depth = imread('person_depth.png');
imshow(image_depth); % The depth image also has to be rotated

X = zeros(ymax,xmax);
Y = zeros(ymax,xmax);
Z = zeros(ymax,xmax);

for yp = 1:ymax %y prime
    for xp = 1:xmax %x prime
        Z(yp,xp) = double(image_depth(yp,xp))/5000;
        X(yp,xp) = Z(yp,xp)*((xp-x0)/f);
        Y(yp,xp) = Z(yp,xp)*((yp-y0)/f);
    end
end
t = [0;0;0.5];
R = eye(3,3);
Zero = zeros(3,1);
T1 = [R t; Zero',1];
x_proj = imwarp(X, T1);
y_proj = imwarp(Y, T1);
image_depth = imwarp(image_depth, T1);

renderNewImage(x_proj,y_proj,depth_transformad,image_RGB);