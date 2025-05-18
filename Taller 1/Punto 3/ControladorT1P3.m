function Ft = ControladorT1P3(X)
 %Sensores
 A = smf(X(4),[0.909 1.21])
 B = smf(X(3),[0.558 0.754])
 C = smf(X(2),[0.306 0.502])
 D = smf(X(1),[0.0537 0.25])

 %Funciones de activacion
 q1=max((1-C),min((1-A),B))
 q2=1-D
 q3=1-B

 % Salida
 Ft=0.1*q1+0.2*q2+0.3*q3
