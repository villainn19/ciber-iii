%Aplicación ANFIS convertir una señal triangular a seno

close all
clear all
warning off

%Simulación del sistema
sim('DatosSR16');
 
%Señal de entrada
x = simout(:,1);
 
%Señal de salida
y = simout(:,2);
 
%Gráfica de la señal
figure
hold on
plot(x,'r');
plot(y,'b');
hold off
 
%Épocas de entrenamiento 
epoch_n = 250;
 
%Generación del sistema difuso
in_fis  = genfis1([x y],5,'gbellmf','linear');
 
%Entrenamiento del sistema difuso
out_fis = anfis([x y],in_fis,epoch_n);
 
%Resultado del entrenamiento
ys = evalfis(x,out_fis);
 
%Resultados
figure
hold on
plot(x,'r');
plot(y,'b');
plot(ys,'g');
hold off
legend('Triangular','Seno','ANFIS');
 
%Figura del error
e=y-ys;
figure
plot(e)
 
%Error cuadrático medio
N = length(e);
ECM = (1/N)*sum(e.^2)