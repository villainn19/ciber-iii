function mse=desempe(x)
%Funci�n de desempe�o

%Cargar los datos de entrenamiento
Datos;

%Generar el sistema difuso
a=generafis(x);

%Evaluar el sistema difuso
Sr=evalfis(T,a);

%Calcular el �ndice de desempe�o
mse=1/length(T)*sum((S-Sr).^2);
