function chyba_metody

function y = f(x)
    y = sin(x);
end

function y = df(x)
    y = cos(x);
end

function y = num1_df(x, h)
    y = ( f(x+h) - f(x) ) / h;
end

function y = num2_df(x, h)
    y = ( f(x+h/2) - f(x-h/2) ) / h;
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

figure
hold on
semilogx(krok, der_a, 'r', 'DisplayName', 'Ananlyticka hodnota')
semilogx(krok, der_1, 'g', 'DisplayName', 'Metoda prvniho radu')
semilogx(krok, der_2, 'b', 'DisplayName', 'Metoda druheho radu')
legend
hold off

figure
hold on
loglog(krok, abs((der_1-der_a)./der_a), 'g')
loglog(krok, abs((der_2-der_a)./der_a), 'b')
legend('Chyba metody 1. radu', 'Chyba metody 2. radu')
hold off

end
