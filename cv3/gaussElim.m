function [U,b_u] = gaussElim(A,b)

s = size(A,1); % zjistim si velikost matice A

if A(1,1)==0 || s~=length(b) % overuju korektnost vsupu
    [U,b_u] = [NaN,NaN];
else 
    U = A; % na zacatku eliminace zacinam s matici A
    for k = 1:s % postupne po radkach provadim eliminaci
        D(:,:,k) = eye(s); % vytvorim si D s poradim k - treti argument
        for i = k+1:s % do k-teho sloupce D_k pridam prvky podle teorie
            D(i,k,k) = (-1)*(U(i,k)/U(k,k));
        end
        if k==s % posledni D_k bude jen diagonalni s poslednim prvkem nastavenym tak,
            D(k,k,k)=1/U(k,k); % aby nam na konci vysla jednicka
        end
        U = D(:,:,k)*U; % provedu eliminaci v danem radku 
    end
    
    % spocitam L = D_s * ... * D_1, cimz zachytime vsechny provedene operace
    L = eye(s);
    for k = 1:s
        L = D(:,:,k)*L;
    end
    
    b_u = L*b; % provedu stejne operace na pravou stranu
    
end

end