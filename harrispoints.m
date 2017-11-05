%   Script para buscar puntos característicos comunes a dos imágenes,
%   se proporcionan pepsi_left.tif y pepsi_right.tif como ejemplo.

left = imread('pepsi_left.tif');
right = imread('pepsi_right.tif');
%   Se introducen los mismos parámetros al explorar ambas imágenes
sigma = 2;
threshold = 1000;
radius = 10;
%   Decido el tamaño del crop
cropsize = 17; %Square of cropsize*cropsize pixels
centeroffset = ((cropsize-1)/2);
%   Se aplica harris a ambas imágenes

[ciml,rl,cl] = harris(left,sigma,threshold,radius);title('Left corners');
[cimr,rr,cr] = harris(right,sigma,threshold,radius);title('Left corners');

subplot(2,2,1);
imshow(left);
hold on
plot(cl,rl,'ro');

subplot(2,2,2);
imshow(right);
hold on
plot(cr,rr,'mo');

%doing the crosscorelation and drawing the corelated points
vlength = length(cl);

for i = 1:vlength
    
    %Crop a piece of an image
    subplot(2,2,3);
    crop = imcrop(left,[rl(i)-cropsize,cl(i)-cropsize,cropsize,cropsize]);
    imshow(crop);
    title('Template');
    highest = [0 ,0];
    
    %Compare with crosscorrelation
    subplot(2,2,4);
    hold on
    for j=1:vlength
         explored = normxcorr2(crop,right);
            if(highest(2)<=explored(2))
                highest = explored;
                disp(highest(2));
            end
        hold on
        plot(j, explored(rr(j),cr(j)),'.m');
    end
    plot(highest(1),highest(2),'*g');
    pause;
    title('Cr');
end
