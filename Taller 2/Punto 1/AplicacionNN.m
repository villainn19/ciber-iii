%Aplicación red neuronal aproximación de funciones

close all
clear all
warning off

%Realizar la simulación
sim('Datos1R16')

%Cargar datos
load Datos

%Rango de la entrada
R = [-1 1];

%Configuración capas y neuronas
S = [4 4 4 4 1];

%Red neuronal FF
net = newff(R,S,{'tansig','purelin','tansig','purelin','tansig','purelin'})

%Tiempo
t=ScopeData(:,1)';

%Datos entrada
P = ScopeData(:,2)';
 
%Datos salida
T = ScopeData(:,3)';

%Simulación sin entrenar
Y = sim(net,P);
plot(t,T,t,Y)

%Entrenamiento
net.trainParam.min_grad=0.00001;
net = train(net,P,T)

%Simulación con entrenamiento
Y = sim(net,P);
plot(t,T,t,Y)

%Figura del error
e=T-Y;
figure
plot(t,e)

%Valor del MSE
mse = (1/length(e))*sum(e.^2)
