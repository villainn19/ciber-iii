function CdifusoPD=generafis(X)
%Función para construir un sistema FIS mediante los parámetros del vector x 

%Sistema difuso
a=newfis('CdifusoPD');

%Entradas y salidas
a=addvar(a,'input','error',[-1.5 1.5]);
a=addvar(a,'input','derror',[-1.5 1.5]);
a=addvar(a,'output','accion',[-4 4]);

%Funciones de pertenencia
%Entrada 1
a=addmf(a,'input',1,'Negativo','sigmf',[X(1) X(2)]);
a=addmf(a,'input',1,'Cero','gaussmf',[abs(X(3)) X(4)]);
a=addmf(a,'input',1,'Positivo','sigmf',[X(5) X(6)]);

%Entrada 2
a=addmf(a,'input',2,'Negativo','sigmf',[X(7) X(8)]);
a=addmf(a,'input',2,'Cero','gaussmf',[abs(X(9)) X(10)]);
a=addmf(a,'input',2,'Positivo','sigmf',[X(11) X(12)]);

%Salida
a=addmf(a,'output',1,'MuyNegativo','gaussmf',[abs(X(13)) X(14)]);
a=addmf(a,'output',1,'Negativo','gaussmf',[abs(X(15)) X(16)]);
a=addmf(a,'output',1,'Cero','gaussmf',[abs(X(17)) X(18)]);
a=addmf(a,'output',1,'Positivo','gaussmf',[abs(X(19)) X(20)]);
a=addmf(a,'output',1,'MuyPositivo','gaussmf',[abs(X(21)) X(22)]);

%Reglas difusas
ruleList=[1 1 1 1 1
          1 2 2 1 1
          1 3 2 1 1
          2 1 2 1 1
          2 2 3 1 1
          2 3 4 1 1
          3 1 4 1 1
          3 2 4 1 1
          3 3 5 1 1];

a=addrule(a,ruleList);
%plotmf(a,'input',1)

%Actualizando la salida de la función 
CdifusoPD=a;

end