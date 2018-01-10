function [ c1, c2, c3 ] = centroids()
%CENTROIDS Summary of this function goes here
%   Detailed explanation goes here
cx = 0;
cy = 0;
for i = 1 : 15
  filename = strcat('botella_A_',strcat(num2str(i),'.bmp'));
  I = imread(filename);
  h = momentos_Hu(I);
  hold on
  plot(h(1),h(2),'go');
  cx = (cx + h(1));
  cy = (cy + h(2));
end
cx = cx/15;
cy = cy/15;
c1 = [ cx, cy ];
plot(cx,cy,'g*');
cx = 0;
cy = 0;
for i = 1 : 15
  filename = strcat('botella_B_',strcat(num2str(i),'.bmp'));
  I = imread(filename);
  h = momentos_Hu(I);
  plot(h(1),h(2),'ro');
  cx = (cx + h(1));
  cy = (cy + h(2));
end
cx = cx/15;
cy = cy/15;
c2 = [ cx, cy ];
plot(cx,cy,'r*');
cx = 0;
cy = 0;
for i = 1 : 15
  filename = strcat('botella_C_',strcat(num2str(i),'.bmp'));
  I = imread(filename);
  h = momentos_Hu(I);
  plot(h(1),h(2),'bo');
  cx = (cx + h(1));
  cy = (cy + h(2));
end
cx = cx/15;
cy = cy/15;
c3 = [ cx, cy ]; 
plot(cx,cy,'b*');
return
end
