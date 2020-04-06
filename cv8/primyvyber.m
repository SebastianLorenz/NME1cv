function pole = primyvyber(pole)
 
    delka = numel(pole);
 
    for i = (1:delka-1)
 
        nejmensi_prvek = pole(i); % zvolime aktualni prvek za ten, se kterym budeme porovnavat
        nejmensi_index = i;       % index tohoto provku
 
        for j = (i:delka)         % projdeme pole od aktualniho (i-teho) prvku do konce
            if pole(j) <= nejmensi_prvek   % pokud je zkoumany (j-ty) prvek mensi
                nejmensi_index = j;        % ulozime si jako nejmensi prvek jeho index
                nejmensi_prvek = pole(j);  % a jeho hodnotu
            end                              
        end
 
        if i ~= nejmensi_index % pokud se nejmensi index zmenil
            pole([nejmensi_index i]) = pole([i nejmensi_index]); % prohodime aktualni a nalezeny prvek
        end
        
        % protoze jsme prosli cely zbytek pole, je ted na i-tem miste i-ty
        % nejmensi prvek, a muzeme pokracovat tridenim zbytku pole
 
    end
end