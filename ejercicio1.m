

% Abrir espectr�metro
x = iniciarSesion;

% Leer datos con controlAutExp
[y,z] = controlAutExp;

% Cerrar espectr�metro

cerrarSesion;

% Pintar los datos

figure
plot(x,y);
xlim([min(x) max(x)]);
ylim([0 2^16-1]);
xlabel('longitud de onda (nm)');
ylabel('intensidad (unidades arbitrarias)');
