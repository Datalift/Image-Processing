function [ centroid, covar_matrix ] = stat_params( HM )
%STAT_PARAMS Computes the statistical parameters of Hu moments of 15 images

%   We are going to compute the centroid in 7 dimensions of the Hu
%   parameters of 15 images of the same class, as well as the covar for
%   that same class.
%   Andr�s Gonz�lex 2017.

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

%Calculating Covariance Matrix
covar_matrix = zeros(7,7);
for i = 0:6
    for j = 0:6
        covar_matrix(i,j) = 
    end
end
return
end