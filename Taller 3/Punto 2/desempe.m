function mse=desempe(x)
%Función de desempeño

%Cargar los datos de entrenamiento
Datos;

%Generar el sistema difuso
a=generafis(x);

%Evaluar el sistema difuso
Sr=evalfis(T,a);

%Calcular el índice de desempeño
mse=1/length(T)*sum((S-Sr).^2);
