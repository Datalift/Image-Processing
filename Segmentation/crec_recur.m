%Esta funcion calcula hace de manera recursiva el crecimiento de una region de la imagen, 
% partiendo de una semilla en (x,y). El crecimiento se hace sobre sus ocho-vecinos
%   - toler; %desviacion de nivel de gris sobre la media para añadir nuevo pixel
%Los demas datos que se necesitan se ponen como variables globales:
%   - region; %region que va creciendo. Es una matriz del tamaño la imagen, con todo a cero salo la region, a uno. 
%   - media; %media (dinamica) de la region que va creciendo
%   - points_in_region; %numero de puntos en la region que crece
%   - im1; %imagen 

%
%J. Gonzalez - Mayo 2005


function crec_recur(x,y,toler)

%Unas pocas variables globales para no pasasr tantos argumentos en la funcion
global region; %region que va creciendo. Es una matriz del tamaño la imagen, con todo a cero salo la region, a uno. 
global media; %media (dinamica) de la region que va creciendo
global points_in_region; %numero de puntos en la region que crece
global im1; %imagen 


%comprobacion que no estamos fuera de la imagen
if (x <= 0 || x > size(im1,2) || y <= 0 || y > size(im1,1) )
    return;
end
if (region(y,x) == 1) %si esta ya marcado (=1) no hacemos nada y salimos de la funcion
    return;
end

if abs(double(im1(y,x)) - media) < toler %Condicion de añadir pixel
    region(y,x) = 1;
    points_in_region = points_in_region + 1;
    media = (media * points_in_region + double(im1(y,x)))/(points_in_region+1); %calculo dinamico de la media 
        
    % recursion sobre los 8-vecinos
    crec_recur(x-1,y+1, toler);
    crec_recur(x-1,y, toler);
    crec_recur(x-1,y-1, toler);
        
    crec_recur(x,y+1, toler);
    crec_recur(x,y-1, toler);
           
    crec_recur(x+1,y+1, toler);
    crec_recur(x+1,y, toler);
    crec_recur(x+1,y-1, toler);
end