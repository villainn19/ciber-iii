%Aplicación optimización de un sistema difuso que convierte una señal triangular a seno

close all
clear all
warning off

%Condición inicial

x=[0.2 -1.5  0.2 -1  0.2 -0.5  0.2 0  0.2 0.5  0.2 1  0.2 1.5  0.2 -0.5  0.2 0  0.2 0.5];


%Datos de entrenamiento
Datos;

%Sistema difuso sin optimizar
a=generafis(x);
Sr=evalfis(T,a);
plot(t,T,t,S,t,Sr)

%Opciones algoritmo CN
options = optimset('Display','iter');
x = fminunc(@desempe,x,options)

%Sistema difuso entrenado
a=generafis(x)
Sr=evalfis(T,a);
plot(t,T,t,S,t,Sr)

%Figura del error
e = S - Sr;
plot(e)

%Valor del MSE
mse = (1/length(e))*sum(e.^2)
