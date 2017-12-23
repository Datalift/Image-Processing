for i = 1 : 15
  filename = strcat('botella_A_',strcat(num2str(i),'.bmp'));
  I = imread(filename);
  HA(i) = momentos_Hu(I);
end
for i = 1 : 15
  filename = strcat('botella_B_',strcat(num2str(i),'.bmp'));
  I = imread(filename);
  HB(i) = momentos_Hu(I);
end
for i = 1 : 15
  filename = strcat('botella_C_',strcat(num2str(i),'.bmp'));
  I = imread(filename);
  HC(i) = momentos_Hu(I);
end
disp(HA);
disp(HB);
disp(HC);