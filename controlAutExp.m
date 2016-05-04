function [lectura tiempoIntegracion] = controlAutExp
% TiempoIntegracion = T(milisegundos) antes de saturaci�n
% lectura =valor CCD antes de TiempoIntegracion
d=0.5;
beta=1/2;
alfa=2;

maximo=65535;
tiempoIntAux=10;
tiempoIntegracion=tiempoIntAux+d;
lectura=leerCCD(tiempoIntegracion);

while ( tiempoIntegracion>1&&abs(tiempoIntAux-tiempoIntegracion)>0)%no permitimos valores menores que 1, paramos al llegar a un error 0.

    if(tiempoIntegracion>2048)
         tiempoIntegracion=tiempoIntAux;
         d=d*beta;
    end
   lectura=leerCCD(tiempoIntegracion);
        % Se considerar� que hay saturaci�n cuando el m�ximo de la se�al tenga un
        % valor de 65535 (2^16 - 1),
        % fprintf(' maximo de lectura es %d  \n',max(lectura));
        tiempoIntAux= tiempoIntegracion;
           if(max(lectura)>=maximo)
               d=d*beta;
               d=abs(d);
              tiempoIntegracion=tiempoIntegracion-d;
                 
               fprintf('reducimos el paso %d  \n',d);
               fprintf(' se ha saturado con tiempo de integracion %d  \n',tiempoIntegracion);
           else
             % Aumentamos el paso
              d=d*alfa; % Aumentamos el paso
              d=abs(d);
              tiempoIntegracion=tiempoIntegracion+d;
           
               fprintf('No se ha saturado  \n');
              fprintf(' tiempo de integracion %d  \n',tiempoIntegracion);
           end

end
% Se considerar� una se�al demasiado fuerte aquella que, incluso para 1 ms,
% produce saturaci�n. En ese caso 'tiempoIntegracion' devolver� 0.
 if(tiempoIntAux<=1)  
    tiempoIntegracion=0;
 else
    tiempoIntegracion=tiempoIntAux;
 end
  fprintf(' TIEMPO DE INTEGRACION FINAL:  %d \n',tiempoIntegracion);

end

