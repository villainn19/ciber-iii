function mse=fobj(X)
%Funci�n para calcular el �ndice de desempe�o MSE 

%Variable global del sistema difuso
global CdifusoPD

%Construir un nuevo controlador difuso
CdifusoPD = generafis(X);

%Realizar la simulaci�n del sistema de control
[ts,xs,ys] = sim('ModeloControlPDR16');

%Valor de la refencia
r = 1;

%C�lculo del MSE
mse = 1/length(ys)*sum((r-ys).^2);
