function [m,m10,m01,m11,m20,m02,m21,m12,m30,m03] = central_moments(I)
%CENTRAL_MOMENTS Computes the central moment of a grayscale image
%
%   The input of the function is an image to which we want to calculate the
%   central moments, we are going to use raw_moments() function to make
%   this step easier.
[rm,rm01,rm02,rm10,rm11,rm12,rm20,rm21,rm30,rm03] = raw_moments(I);
%The centroid is calculated
[maxx, maxy] = size(I);
x_ = rm10/rm;
y_ = rm01/rm;

%Although the formula for the central moments is a sum that can be
%implemented as a nested loop it can also be simplified as these 
%asignations. 
m = rm;
m01 = 0;
m10 = 0;
m20 = rm20 - m * x_.^2;
m11 = rm11 - m * x_ * y_;
m02 = rm02 - m * y_.^2;
m30 = rm30 - 3*rm20 * x_ + 2*m * x_.^3;
m03 = rm03 - 3*rm02*y_ + 2*m*y_.^3;
%The following two are just initialized for the loop
m21 = 0;
m12 = 0;
for y=1:maxy
    for x=1:maxx
        m21 = rm21 + (x-x_).^2*(y-y_).^1*double(I(x,y));
        m12 = rm12 + (x-x_).^1*(y-y_).^2*double(I(x,y));
    end
end
return