imcell = cell(15,1);
for i = 1 : 15
  filename = strcat('botella_A_',strcat(num2str(i),'.bmp'));
  image = imread(filename);
  imcell{i} = image;
end
[centroid, covar_matrix] = stat_params(imcell);
hold on
Visualization(centroid, covar_matrix, 'ro');
hold off
for i = 1 : 15
  filename = strcat('botella_B_',strcat(num2str(i),'.bmp'));
  image = imread(filename);
  imcell{i} = image;
end
[centroid, covar_matrix] = stat_params(imcell);
hold on
Visualization(centroid, covar_matrix, 'ro');
hold off
for i = 1 : 15
  filename = strcat('botella_C_',strcat(num2str(i),'.bmp'));
  image = imread(filename);
  imcell{i} = image;
end
[centroid, covar_matrix] = stat_params(imcell);
hold on
Visualization(centroid, covar_matrix, 'ro');
hold off