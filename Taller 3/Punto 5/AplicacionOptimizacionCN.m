%Aplicaci�n optimizaci�n de un controlador difuso PD utilizando
%cuasi-Newton

close all
clear all
warning off

%Variable global
global CdifusoPD

%Condici�n inicial
X=[-5.00 -0.5...
    0.14  0.0...
    5.00  0.5...
   -5.00 -0.5...
    0.14  0.0...
    5.00  0.5...
    0.25 -1.4...
    0.29 -0.7...
    0.08  0.0...
    0.29  0.7...
    0.25  1.4];

%Controlador difuso inicial
CdifusoPD = generafis(X);

%Opciones del proceso de optimizaci�n
options = optimset('Display','iter','MaxIter',20);

%Optimizaci�n con cuasi-Newton 
X = fminunc(@fobj,X,options);

%Construir un nuevo controlador difuso
CdifusoPD = generafis(X);

%Realizar la simulaci�n del sistema de control
[ts,xs,ys] = sim('ModeloControlPDR16');
plot(ts,ys);

%C�lculo del MSE
mse = fobj(X)
