[a,b,c] = centroids();
file=input('Enter the filename of a bottle image(remember the .bmp): ');
I = imread(filename);
[ h1, h2, ~ ] = momentos_Hu(I);
%calculates the distance from the Hu moment to each centroid
adistance = sqrt(((h1-a(1))^2)+((h2-a(2))^2)); 
bdistance = sqrt(((h1-a(1))^2)+((h2-a(2))^2));
cdistance = sqrt(((h1-a(1))^2)+((h2-a(2))^2));

%If the distance is equal between the two smallest the distance defaults to
%point a.
type = 'a';
smallest = adistance;
if bdistance < smallest 
    smallest = bdistance;
    type = 'b';
end
if cdistance < smallest
    smallest = cdistance;
    type = 'c';
end
disp('distance to A centroid is: ');
disp(adistance);
disp('distance to B centroid is: ');
disp(bdistance);
disp('distance to C centroid is: ');
disp(cdistance);
disp('So we can conclude the bottle most likely is of type');
disp(type);
