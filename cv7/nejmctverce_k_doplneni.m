%% Linearni regrese

% data
x = 1:20;
y = 1:20;
% pouzijeme funkci poissrnd, ktera nageneruje data s poissonovskym rozdelenim
ySum = poissrnd(y);

% napocitame Sk a Tk
S0 = sum(x.^0);
S1 = sum(x.^1);
S2 = sum(x.^2);
T0 = sum(ySum.*x.^0);
T1 = sum(ySum.*x.^1);

% napocitame parametry a a b - pro kvadratickou regresi zde pouzijte
% matlabovsky "backslash(\)"
b= ( S2*T0 - S1*T1 ) / ( S0*S2 - S1^2 );
a= ( S0*T1 - S1*T0 ) / ( S0*S2 - S1^2 );

% nagenerujeme si body x, ve kterych chceme provest interpolaci
xToPrint=1:0.1:20;

% spocteme si hodnotu interpolace
yToPrint=a*xToPrint+b;

% zobrazime
plot(x,ySum,'rx',xToPrint,yToPrint);

%% Kvadraticka regrese

% pozijte tyto data
x2 = 1:20;
y2 = 2*x2-(1/10)*x2.^2;
% opet pridame chybu mereni
y2Sum = poissrnd(y2);

% !BYTEK UZ DOPLNTE SAMI!
% NA KONCI NEZAPOMENTE VYSLEDEK VYKRESLIT PODOBNE JAKO U LINEARNI REGRESE