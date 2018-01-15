I = imread('bernabeu.jpg');
I = rgb2gray(I);
imshow(I);
% x = [518;836;750;117];
% y = [258;294;662;464];
[x,y] = ginput(4);
for n = 1:4
    hold on
    plot(x(n),y(n),'ro');
end

% w = 68;
% h = 105;
h = input('input height of the stadium ');
w = input('input width of the stadium ');
w = w*20;
h = h*20;
x1 = [x';y';[1,1,1,1]];
x2 = [[h,h,1,1];[1,w,w,1];[1,1,1,1]];
H = homography2d(x1,x2);

tf = maketform('projective',H');
img2 = imtransform(I, tf, 'XData',[1 h], 'YData', [1 w]);
figure();
imshow(img2);

chiquito = imread('chiquito.jpg');
chiquito = imresize(chiquito,[w h]);
img2 = chiquito;
imshow(img2);
inv_tf = fliptform(tf);
img2 = imtransform(chiquito, inv_tf, 'XData',[1 h], 'YData', [1 w]);
imshow(img2);
newchiquito = zeros(768,1024)
for x = 1:768
    for y = 1:1024
        newchiquito(x,y) = img2(x,y);
        if img2(x,y) ~= 0
            I(x,y) = 0;
        end    
    end
end
imshow(I+uint8(newchiquito));