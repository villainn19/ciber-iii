function a=generafis(x)
%Función para generar el sistema difuso

%Entrada, salida y funciones de pertenencia
a=newfis('signalts');
a=addvar(a,'input','X',[-1.5 1.5]);
a=addmf(a,'input',1,'MB','gaussmf',[abs(x(1)) x(2)]);
a=addmf(a,'input',1,'B','gaussmf',[abs(x(3)) x(4)]);
a=addmf(a,'input',1,'MEB','gaussmf',[abs(x(5)) x(6)]);
a=addmf(a,'input',1,'M','gaussmf',[abs(x(7)) x(8)]);
a=addmf(a,'input',1,'MEA','gaussmf',[abs(x(9)) x(10)]);
a=addmf(a,'input',1,'A','gaussmf',[abs(x(11)) x(12)]);
a=addmf(a,'input',1,'MA','gaussmf',[abs(x(13)) x(14)]);
%plotmf(a,'input',1)

a=addvar(a,'output','Y',[-1.5 1.5]);
a=addmf(a,'output',1,'B','gaussmf',[abs(x(15)) x(16)]);
a=addmf(a,'output',1,'M','gaussmf',[abs(x(17)) x(18)]);
a=addmf(a,'output',1,'A','gaussmf',[abs(x(19)) x(20)]);
%plotmf(a,'output',1)

%Reglas del sistema difuso
ruleList=[
  	1 1 1 1
   	2 1 1 1
    3 1 1 1
    4 2 1 1
    5 3 1 1
    6 3 1 1
    7 3 1 1];

%Sistema difuso
a = addrule(a,ruleList);
