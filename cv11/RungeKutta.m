function RungeKutta

%demonstrace metody Runge-Kuta ctvrteho radu pro reseni obycejnych diferencialnich rovnic
%
%budeme resit harmonicky oscilator, tedy rovnici y''+omega^2*y=0
%napred musime rovnici druheho radu prevest na soustavu rovnic prvniho radu
%takto
%y'=z
%z'=-omega^2*y
%to jeste prepiseme jako ze u'=f(t,u), tedy u=[y,z]
%a dale budeme chtit pocatecni stav takovy, ze rychlost na pocatku je v0=0 a
%vychylka y0 je nenulova

v0=0; % rychlost je nula, tedy y'(0)=v(0)=v0=z1(0)=0
y0=1; % vychylka na pocatku je nenulova
T=20; % budeme integrovat 20 sekund
h=0.5; % pouzijeme krok h, vsimnete si ze je relativne veliky v porovnani s Eulerovou metodou
omega=0.5; % nastavime uhlovou rychlost

u=[y0,v0]; % nastavime na zacatek promennou u

f=inline(sprintf('[u(2),-%g^2*u(1)]',omega),'t','u'); % definice funkce f, plati ze u'=f(t,u)

pocetKroku=T/h; % celkovy pocet kroku
for i=0:pocetKroku
   
   t=i/pocetKroku*T; % spocteme cas odpovidajici kroku
   
   subplot(211);
   hold on;% nastavime grafy aby se nemazali, ale aby se jen pridavali objekty do existujicich grafu
   plot(t,u(1),'.'); % zobrazime aktualni polohu
   hold off;
   subplot(212);
   hold on;
   plot(t,u(2),'.'); % zobrazime aktualni rychlost
   hold off;
   
   % zacina vlastni krok runge-kuta
   k1 = f(t,u);
   k2 = f(t+h/2, u+h/2*k1);
   k3 = f(t+h/2, u+h/2*k2);
   k4 = f(t+h, u+h*k3);
   u=u+h/6*(k1+2*k2+2*k3+k4);
   
end;

subplot(211);
title('Poloha');
xlabel('t [s]');
ylabel('y [m]');

subplot(212);
title('Rychlost');
xlabel('t [s]');
ylabel('v [m/s]');

end
