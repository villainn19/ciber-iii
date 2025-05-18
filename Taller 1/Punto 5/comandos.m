%Ejemplo del sistema de lógica difusa de la propina
%implementado en comandos

close all
clear all
warning('off')

%Sistema
a=newfis('RiesgoECV');

%Variable de entrada: Colesterol
a=addvar(a,'input','Colesterol',[0 500]);

%Funciones de pertenencia
a=addmf(a,'input',1,'bueno','trapmf',[-10 -10 180 200]);
a=addmf(a,'input',1,'Regular','trapmf',[190 200 230 240]);
a=addmf(a,'input',1,'malo','trapmf',[230 250 500 500]);
plotmf(a,'input',1)

%Variable de entrada: BMI
a=addvar(a,'input','BMI',[0 40]);

%Funciones de pertenencia
a=addmf(a,'input',2,'bajo','zmf',[17 18.5]);
a=addmf(a,'input',2,'normal','trapmf',[16.89 18.5 24.9 26.89]);
a=addmf(a,'input',2,'sobre_peso','trapmf',[23 25 29.9 32]);
a=addmf(a,'input',2,'obesidad','smf',[28 31]);
plotmf(a,'input',2)

%Variable de entrada: Edad
a=addvar(a,'input','Edad',[0 80]);

%Funciones de pertenencia
a=addmf(a,'input',3,'joven','trapmf',[13 14 26 27]);
a=addmf(a,'input',3,'adulto','trapmf',[26 27 59 60]);
a=addmf(a,'input',3,'anciano','smf',[58 65]);
a=addmf(a,'input',3,'nino','zmf',[10 15]);
plotmf(a,'input',3)

%Variable de entrada: Presion
a=addvar(a,'input','Presion',[0 200]);

%Funciones de pertenencia
a=addmf(a,'input',4,'normal','trapmf',[88 91 119 121]);
a=addmf(a,'input',4,'hipertension','trapmf',[128 130 178 182]);
a=addmf(a,'input',4,'hipotension','zmf',[88 90]);
a=addmf(a,'input',4,'elevada','trapmf',[118 120 129 131]);
a=addmf(a,'input',4,'crisis_hipertension','trapmf',[178 180 250 250]);
plotmf(a,'input',4)

%Variable de entrada: Fumador
a=addvar(a,'input','Fumador',[0 1]);

%Funciones de pertenencia
a=addmf(a,'input',5,'fumador','smf',[0.4 0.6]);
plotmf(a,'input',5)


%Variable de salida: Nivel_de_riesgo
a=addvar(a,'output','Nivel_de_riesgo',[0 1]);

%Funciones de pertenencia
a=addmf(a,'output',1,'bajo','trapmf',[0.13 0.14 0.28 0.29]);
a=addmf(a,'output',1,'medio','trapmf',[0.41 0.43 0.56 0.57]);
a=addmf(a,'output',1,'alto','trapmf',[0.69 0.71 0.84 0.85]);
a=addmf(a,'output',1,'muy_bajo','zmf',[0.12 0.14]);
a=addmf(a,'output',1,'medio_bajo','trapmf',[0.27 0.29 0.42 0.43]);
a=addmf(a,'output',1,'medio_alto','trapmf',[0.55 0.57 0.7 0.71]);
a=addmf(a,'output',1,'muy_alto','smf',[0.83 0.85]);
plotmf(a,'output',1)

%Reglas de inferencia
ruleList=[
    1 2 1 1 -1 4 1 1
    1 2 4 1 -1 4 1 1
    1 2 2 1 -1 4 1 1
    1 2 3 1 -1 1 1 1
    3 4 1 2 -1 3 1 1
    3 4 2 2 1 7 1 1
    3 4 2 2 -1 3 1 1
    3 3 2 2 -1 3 1 1
    3 3 2 2 1 7 1 1
    3 3 3 2 1 7 1 1
    3 3 1 2 1 3 1 1
    3 3 4 2 -1 3 1 1
    3 4 2 4 1 3 1 1
    3 4 2 5 -1 7 1 1
    2 3 3 1 -1 5 1 1
    2 2 1 4 1 2 1 1
    1 1 2 3 1 6 1 1
    3 3 4 4 -1 3 1 1
    2 4 3 4 1 6 1 1
    1 2 2 2 1 3 1 1];

a = addrule(a,ruleList);

%Sistema difuso
fuzzy(a)

%Evaluar el sistema
Y = evalfis( [250;20;40;100;0.5],a)

%Para evaluar varias entradas
Datos =[250 25.56 40 158.2 0.5
        250 25.56 40 158.2 0.6759
        150 24.81 40 92.73 0.3056 
        150 24.81 56 132.7 0.6019
        331.8 24.81 69.09 132.7 0.5463
        ];

Ys = evalfis(Datos,a)

