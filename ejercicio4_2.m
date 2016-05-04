% Abrir espectr�metro
x = iniciarSesion;
% Leer datos con controlAutExp
[y,z] = controlAutExp;
% Normalizar la lectura
senalNormalizada = normalizar(y);
% Sacar la magnitud de la FFT
fft_magnitud=abs(fft(senalNormalizada));
% Generar el filtro de Butterworth
fc = 0.01;
order =1 ; % Filter order
[B,A] = butter(order,fc);
% Filtrar la se�al con filtfilt
 filtrada = filtfilt(B, A, senalNormalizada);
% Calcular los puntos singulares sobre la se�al filtrada
[puntos cambios] = puntosSingulares(filtrada);
% Cerrar espectr�metro
cerrarSesion;


% Pintar la FFT

figure
stem((0:2047)/1024,fft_magnitud,'g');

xlim([0 0.05]);

xlabel('frecuencia normalizada');



% Pintar la se�al normalizada, el filtrado de �sta y los puntos singulares
% evaluados sobre la primera

%figure
figure

plot(x,senalNormalizada,'b');hold on; %senal sin filtrar
plot(x,filtrada,'g');hold on;%senal filtrada
plot(x,cambios,'ro');%senal filtrada

xlim([min(x) max(x)]);
ylim([0 1]);
xlabel('longitud de onda (nm)');
ylabel('intensidad (unidades arbitrarias)');

