%   Script for finding common points between two images 

left = imread('pepsi_left.tif');
right = imread('pepsi_right.tif');
%   We introduce the same harris parameters in both images
sigma = 2;
threshold = 1000;
radius = 10;
%   Crop size is decided
cropsize = 17;

%   Applying harris to both images

[ciml,rl,cl] = harris(left,sigma,threshold,radius);title('Left corners');
[cimr,rr,cr] = harris(right,sigma,threshold,radius);title('Left corners');

vlength = length(cl);

for i = 1:vlength
    %We crop the first image
    subplot(2,2,3);
    crop = imcrop(left,[rl(i)-cropsize,cl(i)-cropsize,cropsize,cropsize]);
    imshow(crop);
    title('Template');
    highest = [0 ,0];
    
    h = subplot(2,2,4);
    hold on
    for j=1:vlength
        %   Comparing the cropped image from the left to the image in the
        %   right (and store the explored)
        explored = normxcorr2(crop,right);
        compareme = [j, explored(cr(j),rr(j))];
        if(highest(2)<=compareme(2))
             highest = compareme;%  highest point is stored as candidate
        end
        hold on
        plot(j, explored(rr(j),cr(j)),'.m');
    end
    plot(highest(1),highest(2),'*g');
    title('Crop');
    
    %   Finally we draw both images overlayed with the keypoints plus the 
    %   current point being explored
    subplot(2,2,1);
    imshow(left);
    title('Keypoints detected in the left image');
    hold on
    plot(cl,rl,'ro');
    rectangle('Position',[rl(i)-cropsize,cl(i)-cropsize,cropsize,cropsize],'EdgeColor','g');
    
    subplot(2,2,2);
    imshow(right);
    title('Keypoints detected in the right image');
    hold on
    plot(cr,rr,'bo');
    rectangle('Position',[rr(highest(1))-cropsize,cr(highest(1))-cropsize,cropsize,cropsize],'EdgeColor','g');
    pause;
    delete(h);
end


