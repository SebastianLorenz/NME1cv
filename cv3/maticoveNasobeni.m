function C = maticoveNasobeni(A,B)

sA = size(A);
sB = size(B);

if sA(2)==sB(1)

    C = zeros(sA(1),sB(2));

    for i = 1:sA(1)         % zvolim i-ty radek matice A
        for j = 1:sB(2)     % a j-ty sloupec matice B
            for k = 1:sA(2) % projdu zaroven cely i-ty radek A a j-ty sloupec B
                         % poscitam vynasobene hodnoty a ulozim je do prvku C(i,j)
                C(i,j) = C(i,j) + A(i,k)*B(k,j);
            end
        end
    end

else
    C = NaN;
end

end