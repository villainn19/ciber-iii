function Ft = ControladorT1P1(X)
 %Sensores
 A = X(4)
 B = X(3)
 C = X(2)
 D = X(1)

 %Funciones de activacion
 q1=max((1-C),min((1-A),B))
 q2=1-D
 q3=1-B

 % Salida
 Ft=0.1*q1+0.2*q2+0.3*q3
