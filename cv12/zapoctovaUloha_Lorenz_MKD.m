% Zapoctova uloha NME1
% Sebastian Lorenz, 21.5.2016
% Reseni ODR y" = p(x)y' + q(x)y + r(x) metodou konecnych diferenci
% a) y" =(-1/x)y' + (-1/(x^2))y
% b) y" = xy 
% .. sledujte absolutní chybu reseni pri ruznem poctu kroku N

clear all

% funkce p(x),q(x),r(x) jsou definovany v samostatnych souborech
a = 1; % zacatek intervalu
b = 2; % konec intervalu, kde ulohu resime

N = 1000; %pocet ekvidistantnich bodu, ve kterych ulohu resime

disp('Zakladni krok (N=1000): ')
h = (b - a)/(N + 1) % krok

% okrajove podminky:
alfa_a = 0; % pro variantu a)
beta_a = 0.638961;
alfa_b = 1.5; % pro variantu b)
beta_b = 3;

% metoda reseni vede na soustavu rovnic s tridiagonalni matici:
X = linspace((a+h),(b-h),N); % vektor bodu, kde budu pocitat dannou fci
A_a = zeros(N);
A_b = zeros(N);  % zatim nuly
for i = 1:N  % naplnim matici varianty a)
    for j = 1:N
        if i==j  % hlavni diagonala
            A_a(i,j) = (-2) - (h^2)*q_a(X(i)); 
        elseif (i-1)==j  % spodni diagonala
            A_a(i,j) = 1 + (h/2)*p_a(X(i)); % p(a) by se zde nemelo vyskytnout
        elseif (i+1)==j  % horni diagonala
            A_a(i,j) = 1 - (h/2)*p_a(X(i));  % p(b) by se zde nemelo vyskytnout
        else
            A_a(i,j) = 0;
        end
    end
end
for i = 1:N  % naplnim matici varianty b)
    for j = 1:N
        if i==j  % hlavni diagonala
            A_b(i,j) = (-2) - (h^2)*q_b(X(i)); 
        elseif (i-1)==j  % spodni diagonala
            A_b(i,j) = 1 + (h/2)*p_b(X(i));
        elseif (i+1)==j  % horni diagonala
            A_b(i,j) = 1 - (h/2)*p_b(X(i));
        else
            A_b(i,j) = 0;
        end
    end
end

% ted naplnim vektory pravych stran
B_a = zeros(N,1);
B_b = zeros(N,1);
for i = 1:N
    B_a(i) = (h^2) * r_a(X(i));
    B_b(i) = (h^2) * r_a(X(i));
end
B_a(1) = B_a(1) - (1 + (h/2)*p_a(a+h))*alfa_a;
B_a(N) = B_a(N) - (1 - (h/2)*p_a(b-h))*beta_a;
B_b(1) = B_b(1) - (1 + (h/2)*p_b(a+h))*alfa_b;
B_b(N) = B_b(N) - (1 - (h/2)*p_b(b-h))*beta_b;

% vypocitam vektor reseni:
Y_a = transpose(A_a\B_a); % transponuji, abychom s matici dale pracovali, jako s radkovou
Y_b = transpose(A_b\B_b);
Ymaple_a = (638961/1000000)*(sin(log(X))/sin(log(2))); % analyticke reseni z maplu pro a)
% pro variantu b) neni analyticke reseni z maplu moc pekne

% vypocet absolutni chyby reseni:
chyba_a = Y_a - Ymaple_a;

%vykresleni vysledku:

subplot(2,2,1)
plot(X,Y_a,'g')
grid on
title('Reseni pro variantu a) (N=1000)')
xlabel('x')
ylabel('y')
legend('x^2*y"+xy''+y=0 ; pocatecni podminky: y(1)=0, y(2)=0,638961')

subplot(2,2,2)
plot(X,chyba_a,'r')
grid on
title('Absolutni chyba reseni pro variantu a)')
xlabel('x')
ylabel('rozdil y_n-y_a')
legend('y_n-vypocteno numericky; y_a-vypocteno analyticky')

subplot(2,2,3)
plot(X,Y_b,'b')
grid on
title('Reseni pro variantu b) (N=1000)')
xlabel('x')
ylabel('y')
legend('y"=xy ; pocatecni podminky: y(1)=1,5, y(2)=3')

%-----------------------------------------------------------
% reseni varianty b) zavisle na poctu bodu:

n = 500:500:5000;
h_n = (b - a)./(n + 1); % prislusne kroky

for nn = n
    time = tic;
    X_n = linspace((a+h),(b-h),nn);
    A_n = zeros(nn);
    for i = 1:nn  % naplnim matici pro n bodu
        for j = 1:nn
            if i==j  % hlavni diagonala
                A_n(i,j) = (-2) - (h^2)*q_b(X_n(i)); 
            elseif (i-1)==j  % spodni diagonala
                A_n(i,j) = 1 + (h/2)*p_b(X_n(i));
            elseif (i+1)==j  % horni diagonala
                A_n(i,j) = 1 - (h/2)*p_b(X_n(i));
            else
                A_n(i,j) = 0;
            end
        end
    end
    
    B_n = zeros(nn,1); %prava strana
    for i = 1:nn
        B_n(i) = (h^2) * r_a(X_n(i));
    end
    B_n(1) = B_n(1) - (1 + (h/2)*p_b(a+h))*alfa_b;
    B_n(nn) = B_n(nn) - (1 - (h/2)*p_b(b-h))*beta_b;
    
    Y_n = transpose(A_n\B_n); % vypocet reseni
    
    casy(nn/500) = toc(time);
    
    % vykresleni vysledku
    subplot(2,2,4)
    hold on
    grid on
    plot(X_n,Y_n,'Color',[nn/5000 0 nn/5000]) % vykreslim grafy v ruznych barvach
    title('Reseni varianty b) pro ruzne pocty bodu N (od 500 do 5000)')
    xlabel('x')
    ylabel('y')
    
end
legend('N=500','N=1000','N=1500','N=2000','N=2500','N=3000','N=3500','N=4000','N=4500','N=5000')
disp('Casy jednotlivych vypoctu v zavislosti na N: ')
disp([n' casy'])


%-------------------------------------
% funkce:

function [y]=p_a(x)
    y = (-1/x);
end

function [y]=q_a(x)
    y = (-1/(x^2));
end

function [y]=r_a(x)
    y = 0;
end


function [y]=p_b(x)
    y = 0;
end

function [y]=q_b(x)
    y = x;
end

function [y]=r_b(x)
    y = 0;
end
    
    
 
