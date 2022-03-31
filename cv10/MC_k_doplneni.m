% skript pro vypocet 1D integralu na intervalu <0;1> pomoci metody Monte Carlo

% SKRIPT UPRAVTE TAK, ABY FUNGOVAL PRO VYPOCET 2D INTEGRALU A OTESTUJTE NA
% PRILOZENYCH FUNKCICH

close all
clear all
clc

% 1D funkce pro vypocet integralu

f = inline('sin(x)','x');
vysledek = 0.4596977;   % analyticky vysledek pro sin(x)

% 2D FUNKCE K TESTOVANI FUNKCNOSTI SKRIPTU:

%f = inline('x+y','x','y');
%vysledek = 1;   % analyticky vysledek pro x+y

%f = inline('abs(sin(pi^2.*((x-0.5).^2+(y-0.5).^2)))','x','y');
%vysledek = 0.6551; % analyticky vysledek pro abs(sin)

kroku=10000;

vysl=zeros(kroku,1); % vektor pro ukladani vysledku pro vsechnz pocty kroku

tic % zacatek mereni casu

uspech=0;   % pocet uspesnych pokusu
z=0;  % kumulativni hodnota

for i=1:kroku
  r=rand(1,1);  % nahodne cislo v intervalu (0,1)
  value= f(r);  % vypocteme funkci v nahodnem bode
  z=z+value;    % pricteme ke kumulovane hodnote
  vysl(i)=z/i;  % prumer (kumul. hodnota delena poctem kroku)
end

integral = z/kroku

toc % konec mereni casu

% vykresleni (NAPOVEDA: ZDE NEMUSITE VUBEC NIC MENIT!)
figure
plot(1:kroku,vysl,[1 kroku],[vysledek vysledek])
set(gca, 'XScale', 'log') % semilogaritmicky graf, osa X ma logaritmickou skalu
grid on
title('vyvoj odhadnute hodnoty integralu')

figure
dat=abs(vysl-vysledek);
chyb=(((1:kroku)).^(-1/2));
x=1:kroku;
plot(x,dat,x,chyb);
set(gca, 'XScale', 'log')
title('porovnani absolutni chyby s x^(-1/2)') % vzdy by mela byt mensi - t.j. dukaz odhadu presnosti