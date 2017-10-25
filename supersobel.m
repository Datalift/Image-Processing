function angles = supersobel(nombre, threshold)
%SUPPERSOBEL Summary of this function goes here
%   Detailed explanation goes here
    subplot(2,2,1);imshow(nombre);title('Imagen original');
    
    %Calculo del sobel horizontal
    mask = fspecial('sobel');
    horsob = conv2(mask, nombre);
    subplot(2,2,2);imshow(uint8(abs(horsob)));title('Imagen Sobel horizontal');
    
    %Calculo del sobel vertical
    mask = mask';
    versob = conv2(mask, nombre);
    subplot(2,2,3);imshow(uint8(abs(versob)));title('Imagen Sobel vertical');
    
    %test
    sobel = imadd(versob,horsob,'uint8');
    sobel = sobel*3;
    greenoverlay = cat(3,sobel*0,sobel,sobel*0);
    subplot(2,2,4);imshow(greenoverlay);title('Sobel');
end

