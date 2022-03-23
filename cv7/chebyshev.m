function chebyshev

n = 20;  % stupen aproximace (pocet Cebysevovych polynomu)
a = -10; % levy kraj intervalu
b = 10;  % pravy kraj intervalu

bodu = 1000; % pocet bodu, ce kterych chceeme funkci aproximovat


    function func=func(xx) % hodnota funkce pro xx transformovane z <a,b> na <-1,1>
        t = ( xx*(b-a) + (a+b) ) / 2; % "roztahneme" hodnoty z intervalu <-1,1> na <a,b>
        func = t^4 * log(10+abs(t)) * cos(t);  % aproximovana funkce
    end

    function c=c(jj) % koeficienty cj (viz. prednaska)
        yy = 0;
        for ii = 1:n  
            yy = yy + func( cos(pi/n*(ii-0.5)) )  *  cos( pi/n*(ii-0.5)*(jj-1) );
        end
        c = 2*yy/n;
    end

    % transformace z <a,b> do <-1,1>
    function trans=trans(xx)
        trans = ( 2*xx - (a+b) ) / (b-a);
    end

    % rekurentni definice n Cebysevovych polynomu v bode xx
    function T=T(xx)
        T = zeros(n,1);
        T(1) = 1;
        T(2) = xx;
        for ii=3:n
            T(ii) = 2*xx*T(ii-1) - T(ii-2);
        end
    end

ci = zeros(n,1);

for i = 1:n
    ci(i) = c(i);
end

krok = (b-a) / bodu;
x = a;

xarr = zeros(bodu,1);
yarr = zeros(bodu,1);

for i = 1:bodu
    ti=T(trans(x)); % hodnoty Cebysevovych polynomu v bode x
    y = 0.5*ci(1);  % prvni scitanec (v prednasce znaceny c0)
    for j = 2:n     % ci(j) - koeficient cj, ti(j) j-ty polynom v bode x
        y = y + ci(j)*ti(j);  
    end
    xarr(i) = x; % ulozime aktualni x
    yarr(i) = y; % a aktualni y
    x = x+krok;  % posuneme se na dalsi x
end


x1= a:krok:b-krok;
y1= x1.^4.*log(10.0+abs(x1)).*cos(x1);
plot(x1,y1,'b-');
hold on;
plot(xarr,yarr,'r-');
title('Aproximace Cebysevovymi polynomy');
hold off;
figure;
plot(x1,yarr'-y1);
title('Chyba aproximace');

end