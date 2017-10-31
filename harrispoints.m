sigma = 2;
threshold = 1000;
radius = 10;
[cim,r,c] = harris(left,sigma,threshold,radius,1);
imshow([cim,r,c]);
