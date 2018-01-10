function angles = supersobel(imagen, threshold)
% SUPPERSOBEL Gets an input image and detects the borders by
% means of sobel.

%   The function gets an image and the border detection threshold as the 
%   parameters and shows the result for horizontal and vertical sobel and 
%   an image of the combination of the original image overlayed with the 
%   edges detected shown in green colour, Then returns a matrix with a 
%   value of angle of the derivative for each pixel, the normalization
%   of the Sobel matrix makes the threshold useless so Inf is recomended.
    
    if size(imagen,3)==3
        imagen = rgb2gray(imagen);
    end
    
    subplot(2,2,1);imshow(imagen);title('Imagen original');
    
    %Horizontal sobel calculation
    mask = fspecial('sobel');
    horsob = conv2(imagen, mask, 'same');
    horsob = abs(horsob);
    subplot(2,2,2);imshow(uint8(abs(horsob)));
    title('Imagen Sobel horizontal');
    
    %Vertical sobel calculation
    mask = mask';
    versob = conv2(imagen, mask, 'same');
    versob = abs(versob);
    subplot(2,2,3);imshow(uint8(abs(versob)));
    title('Imagen Sobel vertical');
    
    %Sobel is created from the combination of both convolutions
    sobel = abs(imadd(horsob,versob));
    sobel(sobel > threshold) = 0;
    %Sobel image is normalized
    aux = 255 * sobel ./ max(max(sobel));
    %We select what we want in colour
    mask = (aux > 50);
    %Three identical images for the three components of rgb
    im_modulo_r = imagen;
    im_modulo_g = imagen;
    im_modulo_b = imagen;
    % Pixels marked by mask are given 255 in green component = [0 255 0]
    im_modulo_r(mask) = 0;
    im_modulo_g(mask) = 255;
    im_modulo_b(mask) = 0;
    % Bands are created
    im_modulo_rgb = cat(3,im_modulo_r,im_modulo_g,im_modulo_b);
    
    subplot(2,2,4); imshow(uint8(abs(im_modulo_rgb))); title('Sobel');
    
    angles = atan(versob/horsob);
end

