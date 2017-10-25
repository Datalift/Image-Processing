% this script adds Gaussian noise to an image and then 
% cleans it by averaging, median and gaussian filters
original = imread('photo.jpg');
original = rgb2gray( original(:,:,1:3) );
gnoise = imnoise(original,'gaussian');
subplot(2,2,1); imshow(gnoise); title('Gaussian noise');
f = ones(3,3) / 9;
avgs = imfilter(gnoise,f);
subplot(2,2,2); imshow(avgs); title('Averaging smoothing');
medians = medfilt2(gnoise,[3 3]);
subplot(2,2,3); imshow(medians); title('Median smoothing');
gsmoothing = imgaussfilt(gnoise);
subplot(2,2,4); imshow(gsmoothing); title('Gaussian smoothing'); 
