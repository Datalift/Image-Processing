function [ ptsl, ptsr, pairedpts ] = harrispoints( left, right, thresh )
%HARRISPOINTS  Function relating harris points in an image to harris
%points in other image
%   The function needs two images of same resolution, also needs a
%   threshold (otherwise the algorithm could relate two points that are
%   not in the same area in the real world) from 0 to 1.   

%   Crop size is decided for the xcorrelation algorithm.
cropsz = 17;
croffst = (cropsz-1)/2;

pairedpts = 0;
if size(right,3)==3
    right = rgb2gray(right);
end
if size(left,3)==3
    left = rgb2gray(left);
end
%   We introduce the same harris parameters in both images
sigma = 2;
threshold = 1000;
radius = 10;

%   Applying harris to both images
[~,rl,cl] = harris(left,sigma,threshold,radius);
[~,rr,cr] = harris(right,sigma,threshold,radius);

vlength = length(cl);

for i = 1:vlength
    crop = imcrop(left,[cl(i)-croffst,rl(i)-croffst,cropsz,cropsz]);
    higst = [0 ,0];
    explored = normxcorr2(crop,right);
    explored = explored((croffst)+1:(end-(croffst))-1 , (croffst)+1:(end-(croffst))-1);
    
    for j=1:vlength
        %   Comparing the cropped image from the left to the image in the
        %   right (and store the explored)
        compareme = [j, explored(rr(j),cr(j))];
        if(higst(2)<compareme(2))
            higst = compareme;%  higst point is stored as candidate
        end
    end
    % Saving points
    if higst(2) > thresh
        pairedpts = pairedpts+1;
        ptcl(pairedpts) = cl(i);
        ptrl(pairedpts) = rl(i);
        ptcr(pairedpts) = cr(higst(1));
        ptrr(pairedpts) = rr(higst(1));
    end
end
ptsl = [ptcl;ptrl;ones(1,pairedpts)];
ptsr = [ptcr;ptrr;ones(1,pairedpts)];
return
end
