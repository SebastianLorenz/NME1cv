function [L,U] = luDekomp(A)

n = size(A,1);    % rozmer matice (delka radku - je to jedno, matice je ctvercova)

% pripravime si matice velikosti n x n pro vysledek
U = zeros(n); % horni matice je uplne prazdna
L = eye(n);   % dolni matice je jednotkova (pro kontrolni soucin potrebujeme 1 na diagonale)

for diagonala = 1 : n               % pro prvky na diagonale
    for sloupec = diagonala : n     % projdeme radek po sloupcich zleva od diagonaly do konce
        soucet = 0;
        for k = 1 : diagonala-1     % L z predchozich sloupcu a U z predchozich radku
            soucet = soucet + L(diagonala,k) * U(k,sloupec);
        end
        U(diagonala,sloupec) = A(diagonala,sloupec) - soucet;
    end
    
    for radek = diagonala+1 : n     % projdeme sloupec po radcich shora do konce, bez diagonaly
        soucet = 0;
        for k = 1 : diagonala-1     % L z predchozich sloupcu a U z naddiagonalni casti sloupce
            soucet = soucet + L(radek,k) * U(k,diagonala);
        end
        L(radek,diagonala) = ( A(radek,diagonala) - soucet) / U(diagonala,diagonala);
    end
end

end
