function angles = supersobel(nombre, threshold)
% SUPPERSOBEL Gets an input image and detects the borders by
% means of sobel.

%   The function gets an image and the border detection threshold as the parameters
%   and shows the result for horizontal and vertical sovel and an image of the combination
%   of the original image overlayed with the edges detected shown in green colour,
%   it then returns a matrix with a value of angle of the derivative for each pixel.
    subplot(2,2,1);imshow(nombre);title('Imagen original');
    
    %Calculo del sobel horizontal
    mask = fspecial('sobel');
    horsob = conv2(mask, nombre);
    horsob = horsob - threshold;
    subplot(2,2,2);imshow(uint8(abs(horsob)));title('Imagen Sobel horizontal');
    
    %Calculo del sobel vertical
    mask = mask';
    versob = conv2(mask, nombre);
    versob = versob - threshold;
    subplot(2,2,3);imshow(uint8(abs(versob)));title('Imagen Sobel vertical');
    
    %test
    sobel = imadd(versob,horsob,'uint8');
    greenoverlay = cat(3,sobel*0,sobel,sobel*0);
    subplot(2,2,4);imshow(greenoverlay);title('Sobel');
end

