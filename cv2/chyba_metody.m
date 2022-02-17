function chyba_metody

% program po��t� a vykresluje chybu metody numerick�ho v�po�tu derivace
% funkce sin(x) metodami 1. a 2. ��du


function y = f(x)
    y = sin(x); % derivovan� funkce
end

function y = df(x)
    y = cos(x); % analytick� hodnota derivace funkce
end

function y = num1_df(x, h)
    y = ( f(x+h) - f(x) ) / h; % v�po�et derivace metodou kone�n�ch diferenc� 1. ��du
end

function y = num2_df(x, h)
    y = ( f(x+h/2) - f(x-h/2) ) / h; % v�po�et derivace metodou kone�n�ch diferenc� 2. ��du
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

% Vykreslen� v�sledk�:
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