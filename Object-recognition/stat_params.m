function [ centroid, covar_matrix ] = stat_params( HM )
%STAT_PARAMS Computes the statistical parameters of Hu moments of 15 images

%   We are going to compute the centroid in 7 dimensions of the Hu
%   parameters of 15 images of the same class, as well as the covar for
%   that same class.
%   Andrés Gonzálex 2017.

%Calculating centroid
centroid = zeros(7,1);
for x = 0:6
    for y = 0:14
        centroid(x) = centroid(x) + HM(x,y);
    end
end
for x = 0:6
    centroid(x) = centroid(x)./15;
end

% Calculating Covariance Matrix (There is one for each Image)
% we need mu which are the means of these hu moments.
% we have x which are the hu moments of 15 images.
mu = zeros(7,1);
for x = 0:14
    for y = 0:6
        mu(x) = mu(x) + HM(x,y); 
    end
    mu(x) = mu(x)/15;
end

covar_matrix = zeros(7,7);
for i = 0:6
    for j = 0:6
        op = HM()
        covar_matrix = expected(op);
    end
end

return
end