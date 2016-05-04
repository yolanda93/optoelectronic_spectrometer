% Abrir espectr�metro
x = iniciarSesion;
% Leer datos con controlAutExp
[y,z] = controlAutExp;
% Normalizar la lectura
senalNormalizada = normalizar(y);
% Calcular los puntos singulares sobre la se�al
[puntos cambios] = puntosSingulares(senalNormalizada);
senalNormalizada
cambios

% Cerrar espectr�metro
cerrarSesion;
% Pintar los datos
figure
plot(x,senalNormalizada,'r');hold on;
i=1;
plot(x,cambios,'bo');

xlim([min(x) max(x)]);
ylim([0 1]);
xlabel('longitud de onda (nm)');
ylabel('intensidad (unidades arbitrarias)');
