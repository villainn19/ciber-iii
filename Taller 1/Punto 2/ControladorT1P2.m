function Ft = ControladorT1P2(h)
%Eng
if h < -2.0
    Eng = 1
else
    Eng = 0
end
%Enp
if h>-2.0 && h<0
    Enp = 1
else
    Enp = 0
end
 %Epp
if h > 0 && h<2.0
    Epp = 1
else
    Epp = 0
end
  %Epg
if h>2.0
    Epg = 1
else
    Epg = 0
end
%Control
V1 = Eng;
V2 = Enp;
V3 = 0;
V4 = Epp;
V5 = Epg;

%Salida
Ft = -0.9*V1 -0.87*V2+0*V3+0.87*V4+0.9*V5
