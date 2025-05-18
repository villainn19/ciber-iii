%Optimización empleando CN (griewank)
clc
close all
clear all
warning off

%Dimensiones
X0 = [-0.0498    4.3817   -0.2822   -0.0448    0.1149   -0.1527   -8.7197    0.2236];

%Opciones del algoritmo
options = optimset('Display','iter');

%Función que implementa la optimización con CN
X = fminunc(@griewank,X0,options)
