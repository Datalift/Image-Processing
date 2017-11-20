%Function that uses crec_recur.m to segmentate a region of an image.

toler = 25;%The maximum deviation of the average when evaluating a point
global im1;%The otiginal image
global media;%The dynamic average
global points_in_region;%The number of points added to the segmented region
global region;%The segmented region
im1 = imread('rice.png');
points_in_region = 0;
region = im1*0;

%Show image and let user chose seed point
h=imshow(im1);
[x, y] = ginput(1);
x = uint8(x);
y = uint8(y);
media = double(im1(y,x));

crec_recur(x, y, toler); %Apply crec_recur at chosen point

%Once we have the region we overlay it on the original image in green
%We select what we want in colour
mask = (region > 0);
%Three identical images for the three components of rgb
im_modulo_r = im1;
im_modulo_g = im1;
im_modulo_b = im1;
% Pixels marked by mask are given 255 in green component = [0 255 0]
im_modulo_r(mask) = 0;
im_modulo_g(mask) = 255;
im_modulo_b(mask) = 0;
% Bands are created
im_modulo_rgb = cat(3,im_modulo_r,im_modulo_g,im_modulo_b);

delete(h);%Delete previously shown image to substitute by segmented image

imshow(uint8(abs(im_modulo_rgb)));%Show new Image with region coloured green