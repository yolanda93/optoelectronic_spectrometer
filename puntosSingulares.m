function [puntos cambios] = puntosSingulares(secuencia)
% 'puntos' es un vector del mismo tamaño que 'secuencia' en el que cada
% elemento del mismo vale '1' en los puntos que se produce un cambio de
% tendencia de 'secuencia' y '0' en caso contrario. La tendencia se define
% de la siguiente manera: Si secuencia(i) <  secuencia(i-1) la tendencia es
% descendente. Si secuencia(i) >  secuencia(i-1) la tendencia es
% ascendente. Si secuencia(i) == secuencia(i-1) la tendencia es plana.
% PRUEBA: la secuencia [2 1 0 0 0 1 2 2 2 1 0 1 2] debería devolver [0 0 1
% 0 1 0 1 0 1 0 1 0 0]  

i=2;
v=1;
puntos(1)=0;

while(i<length(secuencia))
    
if((secuencia(i) <  secuencia(i-1)&&(secuencia(i+1) <  secuencia(i)))||(secuencia(i) >  secuencia(i-1)&&(secuencia(i+1) >  secuencia(i)))||(secuencia(i) == secuencia(i-1)&&(secuencia(i+1) ==  secuencia(i))))%ascendente
    puntos(i)=0; 
    cambios(i)=-9;
else
    puntos(i)=1;
    cambios(i)=secuencia(i);
end
i=i+1;
v=v+1;


end
puntos(length(secuencia))=0;
cambios(length(secuencia))=0;
end

