im = imread('mijeta.jpg');
figure, subplot(1,2,1), imshow(im), title('Imagen original')
%data = reshape(im, nPixels, 1); %Image as a vector 

%RGB space must be created
im_modulo_r = im(:,:,1);
im_modulo_g = im(:,:,2);
im_modulo_b = im(:,:,3);
ncPixels = prod(size(im_modulo_r));
im_modulo_r = reshape(im_modulo_r,ncPixels,1); 
im_modulo_g = reshape(im_modulo_g,ncPixels,1);
im_modulo_b = reshape(im_modulo_b,ncPixels,1);
data = cat(2,im_modulo_r,im_modulo_g,im_modulo_b);

pert = kmeans(double(data), 2);
clus=reshape(pert, size(im(:,:,1))); %Vector Image back to a matrix 
im_clust=uint8(255*(clus-1)./(max(max(clus))-1));
subplot(1,2,2), imshow(im_clust), title('Imagen segmentada')