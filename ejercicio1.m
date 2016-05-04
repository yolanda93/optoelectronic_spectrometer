

% Abrir espectrómetro
x = iniciarSesion;

% Leer datos con controlAutExp
[y,z] = controlAutExp;

% Cerrar espectrómetro

cerrarSesion;

% Pintar los datos

figure
plot(x,y);
xlim([min(x) max(x)]);
ylim([0 2^16-1]);
xlabel('longitud de onda (nm)');
ylabel('intensidad (unidades arbitrarias)');
