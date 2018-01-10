% this script adds Salt & Pepper noise to an image and then 
% cleans it by averaging, median and gaussian filters
original = imread('photo.jpg');
original = rgb2gray( original(:,:,1:3) );
spnoise = imnoise(original,'salt & pepper');
subplot(2,2,1); imshow(spnoise); title('Salt & Pepper noise');
f = ones(3,3) / 9;
avgs = imfilter(spnoise,f);
subplot(2,2,2); imshow(avgs); title('Averaging smoothing');
medians = medfilt2(spnoise,[3 3]);
subplot(2,2,3); imshow(medians); title('Median smoothing');
gsmoothing = imgaussfilt(spnoise);
subplot(2,2,4); imshow(gsmoothing); title('Gaussian smoothing'); 
