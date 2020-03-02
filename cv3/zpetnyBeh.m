function x = zpetnyBeh(U,b_u)

n = size(U,2);  % velikost matice

x = zeros(n,1);   % prazdny vektor pro reseni

for k = n : -1 : 1  % hledam reseni od konce (kde je v matici jen jeden nenulovy prvek na konci radku)
    soucet = 0;         
    for j = k+1 : n % do matice dosadim jiz nalezene prvky x
        soucet = soucet + U(k,j)*x(j);
    end
    % odectu od prislusneho radku prave strany a vydelim prvkem v matici
    x(k) = ( b_u(k) - soucet ) / U(k,k);  
end

end
