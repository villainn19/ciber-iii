%Aplicación de redes neuronales para la predicción de una señal ECG

close all
clear all
warning off

%Primero se cargan los datos de la señal ECG
load DatosECG.mat

%Tomando el máximo y el mínimo
minimo = min(ecg_x1);
maximo = max(ecg_x1);

%Se presentan los datos
plot(ecg_x1)

%Pasando la señal a simulink
N = length(ecg_x1);
time = 1:N;
ecgData = [time' ecg_x1'];

%Generando los respectivos retardos de la señal en simulink
sim('Simulacion1ECGR16')

%Para el entrenamiento se toma 70% de datos
Xecg = XECG(1:14,:)';
Yecg = YECG(1:14,1)';
t=1:14;
plot(t,Yecg)

%Red neuronal feed forward de dos capas metodo de entrenamiento backpropagation
R=[minimo maximo;minimo maximo;minimo maximo];
net = newff(R,[2 2 1],{'purelin' 'purelin' 'purelin'},'trainlm');

%Simulación de la red sin entrenar
y = sim(net,Xecg);
figure
plot(t,Yecg,t,y)
 
%Parámetros de entrenamiento
net.trainParam.epochs = 10;
net.trainParam.goal = 0.0001;

%Entrenamiento de la red
net = train(net,Xecg,Yecg);

%Simulación de la red entrenada
y = sim(net,Xecg);
figure
plot(t,Yecg,t,y)

%Comparación con todos los datos
Xecg2 = XECG';
Yecg2 = YECG';
y2 = sim(net,Xecg2);
t2 = 1:length(y2);
plot(t2,Yecg2,'b',t2,y2,'r')

%Figura del error
e = Yecg2-y2;
figure
plot(e)

%Valor del MSE
mse = (1/length(e))*sum(e.^2)
