[a,b,c] = centroids();
filename=input('Enter the filename of a bottle image:','s');
filename = [ filename '.bmp' ];
I = imread(filename);

h = momentos_Hu(I);
%calculates the distance from the Hu moment to each centroid
adistance = sqrt(((h(1)-a(1))^2)+((h(2)-a(2))^2)); 
bdistance = sqrt(((h(1)-b(1))^2)+((h(2)-b(2))^2));
cdistance = sqrt(((h(1)-c(1))^2)+((h(2)-c(2))^2));

%If the distance is equal between the two smallest the distance defaults to
%point a.
type = 'A';
smallest = adistance;
if bdistance < smallest 
    smallest = bdistance;
    type = 'B';
end
if cdistance < smallest
    smallest = cdistance;
    type = 'C';
end

disp('distance to A cluster centroid is: ');
disp(adistance);
disp('distance to B cluster centroid is: ');
disp(bdistance);
disp('distance to C cluster centroid is: ');
disp(cdistance);
disp('So we can conclude the bottle most likely is of type: ');
disp(type);
