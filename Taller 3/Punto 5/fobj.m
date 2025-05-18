function mse=fobj(X)
%Función para calcular el índice de desempeño MSE 

%Variable global del sistema difuso
global CdifusoPD

%Construir un nuevo controlador difuso
CdifusoPD = generafis(X);

%Realizar la simulación del sistema de control
[ts,xs,ys] = sim('ModeloControlPDR16');

%Valor de la refencia
r = 1;

%Cálculo del MSE
mse = 1/length(ys)*sum((r-ys).^2);
