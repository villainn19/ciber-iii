%Aplicación para el modelamiento de un sistema dinámico con redes neuronales
%Realizando la codificación de los datos en simulink

close all
clear all
warning off

%Realizar la simulación del modelo
sim('DatosPaso1R16')
%sim('DatosAleatoriosR16');

%Lectura de datos de simulink
P=PP';
T=TT';

%Valores máximos y mínimos
MinMax = [min(P')' max(P')'];

%Red neuronal
net=newff(MinMax,[2 1],{'tansig' 'purelin'});

%Entrenamiento de la red neuronal
net.trainParam.epochs = 500;
net = train(net,P,T);

%Resultado de la red neuronal
Y = sim(net,P);

%Presentación del resultado
t = 1:length(Y);
plot(t,T,'r',t,Y,'b')

%Figura del error
e = T - Y;
plot(e)

%Valor del MSE
mse = (1/length(e))*sum(e.^2)
