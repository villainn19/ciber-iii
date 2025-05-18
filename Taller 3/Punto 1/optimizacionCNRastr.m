%Optimización empleando CN (rastr)
clc
close all
clear all
warning off

%Dimensiones
X0 = [0.9236   -2.0843    0.0424    0.0690    0.0361    1.0049   -1.0240    0.0291];

%Opciones del algoritmo
options = optimset('Display','iter');

%Función que implementa la optimización con CN
X = fminunc(@rastr,X0,options)
