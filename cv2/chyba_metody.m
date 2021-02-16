function chyba_metody

% program poèítá a vykresluje chybu metody numerického výpoètu derivace
% funkce sin(x) metodami 1. a 2. øádu


function y = f(x)
    y = sin(x); % derivovaná funkce
end

function y = df(x)
    y = cos(x); % analytická hodnota derivace funkce
end

function y = num1_df(x, h)
    y = ( f(x+h) - f(x) ) / h; % výpoèet derivace metodou koneèných diferencí 1. øádu
end

function y = num2_df(x, h)
    y = ( f(x+h/2) - f(x-h/2) ) / h; % výpoèet derivace metodou koneèných diferencí 2. øádu
end

x = pi/6
h = x;  % Pocatecni hodnota h

der_a = []; % Hodnota derivace analyticky
der_1 = []; % Derivace metodou prvniho radu
der_2 = []; % Derivace metodou druheho radu
krok  = []; % Seznam pouzitych velikosti kroku

% Hledame hodnoty derivace v bode x v zavislosti na kroku h
while h > eps(1)
    der_a = [der_a df(x)];
    der_1 = [der_1 num1_df(x,h)];
    der_2 = [der_2 num2_df(x,h)];
    krok  = [krok h];
    h = 0.9 * h;
end

% Vykreslení výsledkù:
figure
hold on
semilogx(krok, der_a, 'r', 'DisplayName', 'Ananlyticka hodnota')
semilogx(krok, der_1, 'g', 'DisplayName', 'Metoda prvniho radu')
semilogx(krok, der_2, 'b', 'DisplayName', 'Metoda druheho radu')
legend
xlabel('Velikost kroku h')
ylabel('Vypoctena hodnota derivace v bode')
hold off


figure
hold on
loglog(krok, abs((der_1-der_a)./der_a), 'g')
loglog(krok, abs((der_2-der_a)./der_a), 'b')
legend('Chyba metody 1. radu', 'Chyba metody 2. radu')
xlabel('Velikost kroku h')
ylabel('Velikost chyby metody')
hold off

end