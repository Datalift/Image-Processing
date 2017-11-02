%   Script para buscar puntos caracter�sticos comunes a dos im�genes,
%   se proporcionan pepsi_left.tif y pepsi_right.tif como ejemplo.

left = imread('pepsi_left.tif');
right = imread('pepsi_right.tif');
%   Se introducen los mismos par�metros al explorar ambas im�genes
sigma = 2;
threshold = 1000;
radius = 10;
%   Se aplica harris a ambas im�genes

[ciml,rl,cl] = harris(left,sigma,threshold,radius);title('Left corners');
[cimr,rr,cr] = harris(right,sigma,threshold,radius);title('Left corners');

subplot(1,2,1);
imshow(left);
hold on
plot(cl,rl,'ro');

subplot(1,2,2);
imshow(right);
hold on
plot(cr,rr,'mo');

