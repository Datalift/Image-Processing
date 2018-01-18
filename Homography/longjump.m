n = 4;
for i = 0 : n
  filename = strcat('long_jump_',strcat(num2str(i),'.PNG'));
  image = imread(filename);
  imcell{i+1} = rgb2gray(image);
end
imshow(imcell{i});
[x,y] = ginput(4);
% x = [480;623;570;151];
% y = [58;60;551;534];
for n = 1:4
    hold on
    plot(x(n),y(n),'ro');
end
pause(5);
w = 20;
width = w;
h = 122;
w = w*10;
h = h*10;
x1 = [x';y';[1,1,1,1]];
x2 = [[h,h,1,1];[1,w,w,1];[1,1,1,1]];
H = homography2d(x1,x2);
tf = maketform('projective',H');
figure();
for i = 0:n
    img2 = imtransform(imcell{i+1}, tf, 'XData',[1 h], 'YData', [1 w]);
    imshow(img2);
    [shtx,shty] = ginput(1);
    distancetoboard = width-shty*0.1;
    disp(distancetoboard);
    pause();
end