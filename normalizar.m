function senalNormalizada = normalizar(senal)
    % Eliminar offset
%Se restará el offset, calculado como la media de los 16 primeros pixeles
%del espectro recibido

    % Normalizar
    
   
   offset=mean(senal(1:16));
   senalAux=senal-offset;
   senalNormalizada= senalAux/max(senalAux); %Se divide por el valor max.
   
  
   
   
end