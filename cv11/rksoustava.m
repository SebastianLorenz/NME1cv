function rksoustava

%demonstrace metody Runge-Kuta ctvrteho radu pro reseni soustavy dvou rovnic druheho radu

%problem dvou teles

T=20; % budeme integrovat 20 sekund
h=0.01; % pouzijeme krok h, vsimnete si ze je relativne veliky v porovnani s Eulerovou metodou

%u=[x  dx   y  dy ]
u =[1  -0.3 0 0.3 ]; % pocatecni podminky
axis([-1 1 -1 1]);
f=inline('[w(2),-w(1)*(w(1)^2 + w(3)^2)^(-3/2),w(4), -w(3)*(w(1)^2 + w(3)^2)^(-3/2)]','w'); % definice funkce f, plati ze u'=f(t,u)

pocetKroku=T/h; % celkovy pocet kroku

for i=0:pocetKroku
   r=(u(1)^2+u(3)^2)^(1/2);
   h=1e-1*r^2
   
   t=i/pocetKroku*T; % spocteme cas odpovidajici kroku
   pause(0.01);
   
   hold on;
   plot(u(1),u(3),'r.'); % zobrazime aktualni polohu
   hold off;
   
   % zacina vlastni krok runge-kuta
   k1 = f(u);
   k2 = f(u+h/2*k1);
   k3 = f(u+h/2*k2);
   k4 = f(u+h*k3);
   u=u+h/6*(k1+2*k2+2*k3+k4);
   
end;

end
