clear;
sigma = 15;
b = 0.119;
cx = 255.64;
cy = 201.12;
f = 351.32;
left = imread('pepsi_left.tif');
right = imread('pepsi_right.tif');
[ x1, x2, pairedpts ] = harrispoints( left, right, 0.85);

[ F, inliers ] = ransacfitfundmatrix( x1, x2, 1e-5 );
%The next code is used to test the correctness of ransacfitfundmatrix
subplot(1,2,1);
imshow(left);
subplot(1,2,2);
imshow(right);
subplot(1,2,1);

while true
    selected = ginput(1);
    hold on;
    plot(selected(1),selected(2),'ro');
    
    subplot(1,2,2);
    x = selected(1);
    y = selected(2);
    ln = F*[x;y;1];
    ln = ln./ln(3);
    x0 = [0 size(right,2)];
    y0 = [-ln(3)/ln(2) -ln(1)/ln(2)*x0(2)-ln(3)/ln(2)];
    hold on;
    plot(x0,y0);
end

X = zeros(pairedpts,1);
Y = zeros(pairedpts,1);
Z = zeros(pairedpts,1);
for i= 1:pairedpts
        di = x1(1,i) -x2(1,i);
        X(i) = b*(x1(1,i)-cx)/di;
        Y(i) = b*(x1(2,i)-cy)/di;
        Z(i) = f*b/di;
end

scatter3(X,Y,Z);
hold on;
for i=1:pairedpts
    text(X(i),Y(i),Z(i), num2str(i), 'color', 'k');
end
hold on;
patch(X,Y,Z,'y', 'Faces', [17 11 44 37]);
clear;