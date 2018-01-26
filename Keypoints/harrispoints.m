%   Script for finding common points between two images
left = imread('pepsi_left.tif');
right = imread('pepsi_right.tif');
thresh = 0.9;
% left = imread('piezas.bmp');
% right = imread('piezas.bmp');    
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
%   Crop size is decided
cropsz = 17;
croffst = (cropsz-1)/2;

%   Applying harris to both images

[ciml,rl,cl] = harris(left,sigma,threshold,radius);title('Left corners');
[cimr,rr,cr] = harris(right,sigma,threshold,radius);title('Left corners');

vlength = length(cl);

    for i = 1:vlength
    %We crop the first image
    subplot(2,2,3);
    crop = imcrop(left,[cl(i)-croffst,rl(i)-croffst,cropsz,cropsz]);
    imshow(crop);
    title('Template');
    higst = [0 ,0];
    explored = normxcorr2(crop,right);
    explored = explored((croffst)+1:(end-(croffst))-1 , (croffst)+1:(end-(croffst))-1);
    h = subplot(2,2,4);
    hold on
    for j=1:vlength
        %   Comparing the cropped image from the left to the image in the
        %   right (and store the explored)
        compareme = [j, explored(rr(j),cr(j))];
        if(higst(2)<compareme(2))
            higst = compareme;%  higst point is stored as candidate
        end
        hold on
        plot(j, explored(rr(j),cr(j)),'.m');
    end
    %Original
    plot(higst(1),higst(2),'*g');
    title('Crop');

    %   Finally we draw both images overlayed with the keypoints plus the
    %   current point being explored
    subplot(2,2,1);
    imshow(left);
    title('Keypoints detected in the left image');
    hold on
    plot(cl,rl,'ro');
    rectangle('Position',[cl(i)-croffst,rl(i)-croffst,cropsz,cropsz],'EdgeColor','g');

    subplot(2,2,2);
    imshow(right);
    title('Keypoints detected in the right image');
    hold on
    plot(cr,rr,'bo');
    if higst(2) > thresh
        rectangle('Position',[cr(higst(1))-croffst,rr(higst(1))-croffst,cropsz,cropsz],'EdgeColor','g');
    end
    pause;
    delete(h);
    end
