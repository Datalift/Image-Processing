function angles = supersobel(nombre, threshold)
% SUPPERSOBEL Gets an input image and detects the borders by
% means of sobel.

%   The function gets an image and the border detection threshold as the parameters
%   and shows the result for horizontal and vertical sovel and an image of the combination
%   of the original image overlayed with the edges detected shown in green colour,
%   Then returns a matrix with a value of angle of the derivative for each pixel.
    subplot(2,2,1);imshow(nombre);title('Imagen original');
    
    %Horizontal sobel calculation
    mask = fspecial('sobel');
    horsob = conv2(mask, nombre);
    horsob = horsob(2:(end-1),3:end);
    horsob = horsob - threshold;
    subplot(2,2,2);imshow(uint8(abs(horsob)));title('Imagen Sobel horizontal');
    
    %Vertical sobel calculation
    mask = mask';
    versob = conv2(mask,nombre);
    versob = versob(3:end,2:(end-1));
    versob = versob - threshold;
    subplot(2,2,3);imshow(uint8(abs(versob)));title('Imagen Sobel vertical');
    
    %Sobel is created from the combination of both convolutions
    sobel = imadd(versob,horsob);
    
    %Sobel image is normalized
    aux = 255 * sobel ./ max(max(sobel));
    %We select what we want in colour
    mask = (aux > 50);
    %Three identical images for the three components of rgb
    im_modulo_r = nombre;
    im_modulo_g = nombre;
    im_modulo_b = nombre;
    % Pixels marked by mask are given 255 in green component = [0 255 0]
    im_modulo_r(mask) = 0;
    im_modulo_g(mask) = 255;
    im_modulo_b(mask) = 0;
    % Bands are created
    im_modulo_rgb = cat(3,im_modulo_r,im_modulo_g,im_modulo_b);

    subplot(2,2,4); imshow(uint8(abs(im_modulo_rgb))); title('sobel');
    
end

