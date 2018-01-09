function [ centroid, covar_matrix ] = stat_params( imcell )
%STAT_PARAMS Computes the statistical parameters of Hu moments of 15 images
%   We are going to compute the centroid in 7 dimensions of the Hu
%   parameters of 15 images of the same class, as well as the covar for
%   that same class.
%   Andrés González 2017.
HM = zeros(15,7);
for x = 1:15
    I = imcell{x};
    auxvect = momentos_Hu(I);
    for y = 1:7
        HM(x,y) = auxvect(y);
    end
end
% Using the Hu moments of 15 images we calculate the Mu 
mu = zeros(15,1);
for x = 1:15
    for y = 1:7
        mu(x) = mu(x) + HM(x,y);
    end
end
centroid = mu;
for x = 1:15
    mu(x) = mu(x)./15;
end
% Calculation of the expected result.
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
            op = (HM(im,i)-mu(i))*(HM(im,j)-mu(j));
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