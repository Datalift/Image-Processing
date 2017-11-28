function [m00,m01,m02,m10,m11,m12,m20,m21,m30,m03] = raw_moments(I)
%RAW_MOMENTS Is used to calculate the raw moments of an image to prepare
% a feature extraction
%   Detailed explanation goes here
[max, may] = size(I);

m00 = 0;
m01 = 0;
m02 = 0;
m10 = 0;
m11 = 0;
m12 = 0;
m20 = 0;
m21 = 0;
m30 = 0;
m03 = 0;
for x = 1:max
    for y = 1:may
        m00 = m00 + I(x,y);
        m01 = m01 + y.^1 * I(x,y);
        m02 = m02 + y.^2 * I(x,y);
        m10 = m10 + x.^1 * I(x,y);
        m11 = m11 + x.^1 * y.^1 * I(x,y);
        m12 = m12 + x.^1 * y.^2 * I(x,y);
        m20 = m20 + x.^2 * I(x,y);
        m21 = m21 + x.^2 * y.^1 * I(x,y);
        m30 = m30 + x.^3 * I(x,y);
        m03 = m03 + y.^3 * I(x,y);
    end
end
disp(m00);
disp(m01);
disp(m10);
disp(m02);
disp(m10);
disp(m11);
disp(m12);
disp(m20);
disp(m21);
disp(m30);
disp(m03);