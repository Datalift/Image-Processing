function Visualization( cent, covar, lineSpec )
%VISUALIZATION Summary of this function goes here
%   Detailed explanation goes here
pint = covar(1:2,1:2);
error_ellipse(pint);
plot(cent(1),cent(2),lineSpec)
end

