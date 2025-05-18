clc
close all
clear all
warning off

%Optimización empleando AG
%Cantidad de variables
NV = 8;

%Opciones del AG
optionsga = gaoptimset('Display','iter','PopulationSize',25,'Generations',2000,'PlotFcns',{@gaplotbestf,@gaplotbestindiv,@gaplotexpectation,@gaplotstopping});

%Función que implementa la optimización con AG
y = ga(@rastr,NV,optionsga)
