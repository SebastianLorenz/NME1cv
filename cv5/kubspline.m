

l = load('spline.dat.txt');

n = size(l,1); % pocet zadanych bodu
bodu = 100;    % pocet bodu pro vyhodnoceni

x = l(:,1); % zadane body x
y = l(:,2); % zadane hodnoty y


% napred najdeme hodnoty druhe derivace

y2  = zeros(n,1); % druha derivace
rho = zeros(n,1); % pomocna promenna pro vypocet druhe derivace
mu  = zeros(n,1); % y'' se vypocte ze soustavy s tridiag. matici

% koeficienty tridiag. matice pro vypocet y'' a jeji prava strana
a = zeros(n,1);
b = zeros(n,1);
c = zeros(n,1);
f = zeros(n,1);

for i = 2 : n-1   % koeficienty z podminky spojitosti prvni derivace
    c(i) = ( x(i)   - x(i-1) ) / 6;
    a(i) = ( x(i+1) - x(i-1) ) / 3;
    b(i) = ( x(i+1) - x(i)   ) / 6;
    f(i) = ( y(i+1) - y(i)   ) / ( x(i+1) - x(i)   ) ...
         - ( y(i)   - y(i-1) ) / ( x(i)   - x(i-1) );
end

for i = 2 : n-1   % reseni soustavy s tridiagonalni matici pro nalezeni y'' (primy beh)
   mu(i+1)  = -b(i) / ( c(i)*mu(i) + a(i) );
   rho(i+1) = ( f(i) - c(i)*rho(i) ) / ( c(i)*mu(i) + a(i) );
end

for i = n-1 : -1 : 2  % zpetny beh vypoctu y''
    y2(i) = mu(i+1)*y2(i+1) + rho(i+1);
end



% hledani hodnot interpolacniho splinu v novych bodech

krok = (x(n)-x(1))/(bodu-1); % velikost kroku pro body ve kterych budeme funkci interpolovat
xn = x(1) : krok : x(n);     % pole bodu, ve kterych interpolujeme
yn = zeros(size(xn,2),1);    % pole hodnot interpolacniho splinu v bodech xn

for i = 1 : bodu  % i iteruje pres pole bodu pro vysledek interpolace
    j = 1;        % j je index do pole znamych hodnot
    while x(j)<=xn(i)  % najdeme znamy bod vpravo od mista, kde hledame hodnotu
        if (j==n)
            break;
        end
        j = j+1;
    end
    j = j-1; % posuneme se doleva
    
    % koeficienty interpolacniho splinu
    An = ( x(j+1) - xn(i) ) / ( x(j+1) - x(j) );
    Bn = 1 - An;
    Cn = ( An^3 - An ) * (x(j+1) - x(j))^2 / 6;
    Dn = ( Bn^3 - Bn ) * (x(j+1) - x(j))^2 / 6;
    
    % hodnota interpolacniho splinu v bode i
    yn(i) = An*y(j) + Bn*y(j+1) + Cn*y2(j) + Dn*y2(j+1);
    
end

plot(xn, yn);
hold on;
plot(x,y,'rx');
hold off;

