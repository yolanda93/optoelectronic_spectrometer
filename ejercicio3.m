% Abrir espectrómetro
x = iniciarSesion;
% 1. Capturar UV+VIS utilizando 'controlAutExp'
input('Colocar la muestra, encender las fuentes VIS y UV, cerrar la tapa y pulsar ENTER cuando esté listo...')
[uv_vis tiempoInt] = controlAutExp;
% 2. Capturar VIS utilizando 'leerCCD' con el tiempo de integración
% devuelto por controlAutExp
input('Apagar la fuente UV, manteniendo VIS encendida y pulsar ENTER cuando esté listo...')
vis = leerCCD( tiempoInt);

% 3. Capturar UV utilizando 'leerCCD' con el tiempo de integración devuelto
% por controlAutExp
input('Apagar la fuente VIS, encender la fuente UV y pulsar ENTER cuando esté listo...')
uv = leerCCD( tiempoInt);
% 4. Restar VIS a (UV+VIS)
resta = uv_vis-vis;
% 5. Normalizar las tres lecturas y la resta usando 'normalizar'
uv_vis2 = normalizar(uv_vis);
vis2 = normalizar(vis);

uv2 = normalizar(uv);
resta2 = normalizar(resta);

% Cerrar espectrómetro
cerrarSesion;
% 6. Pintar las cuatro señales en la misma figura y comprobar visualmente
% que 'uv' y 'resta' coinciden
figure
plot(x,[uv_vis2' vis2' uv2' resta2']);
xlim([min(x) max(x)]);
ylim([0 1]);
legend('uv+vis','vis','uv','resta');
xlabel('longitud de onda (nm)');
ylabel('intensidad relativa');


