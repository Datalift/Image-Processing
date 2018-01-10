I = imread('bernabeu.jpg');
I = rgb2gray(I);
imshow(I);
[x,y] = ginput(4);
% x = [520,836,750,117];
% y = [258,292,664,462];
for n = 1:4
    hold on
    plot(x(n),y(n),'ro');
end
pause(1);
% h = input('input height of the stadium');
% w = input('input width of the stadium');
h = 105*20;
w = 68*20;
x1 = [x;y;[1,1,1,1]];
x2 = [[1,w,1,w];[1,1,h,h];[1,1,1,1]];
H = homography2d(x1,x2);
tf = maketform('projective',H');
img2 = imtransform(I, tf, 'XData',[1 w], 'YData', [1 h]);
figure();
imshow(img2);