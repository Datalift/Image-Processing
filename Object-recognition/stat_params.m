function [ centroid, covar_matrix ] = stat_params( imvect )
%STAT_PARAMS Computes the statistical parameters of Hu moments of 15 images
%   We are going to compute the centroid in 7 dimensions of the Hu
%   parameters of 15 images of the same class, as well as the covar for
%   that same class.
%   Andrés González 2017.
HM = zeros(15);
for x = 1:15
    HM(x) = momentos_Hu(imvect(x));
end
%Calculating centroid in 7 dimensions
centroid = zeros(7,1);
for x = 1:7
    for y = 1:15
        centroid(x) = centroid(x) + HM(x,y);
    end
end
for x = 1:7
    centroid(x) = centroid(x)./15;
end
% Using the Hu moments of 15 images we calculate the Mu 
mu = zeros(7,1);
for y = 1:15
    for x = 1:7
        mu(x) = mu(x) + HM(x,y); 
    end
end
for x = 1:15
    mu(x) = mu(x)./15;
end
expected = 0;
for x = 1:15
    expected = expected + mu(x);
end
expected = expected./15;
% Covar matrices are calculated from the means (one covar matrix for each
% image).
covar_matrices = zeros(7,7,15);
for im = 1:15
    for i = 1:7
        for j = 1:7
            op = (HM(i,im)-mu(i))*(HM(j,im)-mu(j));
            covar_matrices(i,j,im) = expected*op;
        end
    end
end
covar_matrix = 0;
for im = 1:15
    covar_matrix = covar_matrix + covar_matrices(:,:,im);
end
return
end