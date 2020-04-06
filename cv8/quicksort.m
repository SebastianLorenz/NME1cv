function setridene = quicksort(pole)
 
    if numel(pole) <= 1 % Pole s jednim, nebo zadnym prvkem je setridene       
        setridene = pole;
        return
    end
 
    pivot = pole(end); % vybereme pivot (treba posledni prvek v poli)
    pole(end) = []; 
 
    % Vytvorime dve pomocna pole - jedno obsahuje prvky <= pivot,
    % drhue prvky vetis
    mensi = pole( pole <= pivot );
    vetsi = pole( pole >  pivot );
    
    % Nechame setridit pole mensich prvku, za ne vlozime pivot a
    % na konec pole vetsich prvku. Vysledkem je setridene pole
    setridene = [quicksort(mensi) pivot quicksort(vetsi)];
    
    % Funkci volame rekurzivne. Rekurze se zastavi na podmince pro pole s
    % jednim prvkem, resp. prazdne pole.
 
end