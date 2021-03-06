% Abrir espectrůmetro
x = iniciarSesion;

% Leer datos con controlAutExp
[y,z] = controlAutExp;

% Normalizar

 senalNormalizada = normalizar(y);

% Cerrar espectrůmetro

cerrarSesion;

% Pintar los datos

figure
plot(x, senalNormalizada);
xlim([min(x) max(x)]);
ylim([0 1]);
xlabel('longitud de onda (nm)');
ylabel('intensidad (unidades arbitrarias)');
