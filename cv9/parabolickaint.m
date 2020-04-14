function parabolickaint
%hledani minima parabolickou interpolaci

%zadejme si funkci -sin(x)
f=inline('-sin(x)','x');

%na zacatku nastavme uvodni body metody a < b < c , minimum by melo byt nekde
%kolem pi/2=1.5708
a=0;
b=0.3;
c=pi;

%nastavme presnost, se kterou chceme nalezt minimum
presnost=1e-3;

%hledani probiha v cyklu
while 1,
    if (c-a) < presnost, % skoncime, pokud je minimum urceno dostatecne presne
        break;
    end;
    
    %z a,b,c odhadneme polohu x minima paraboly, kterou jsme prolozili body
    %a,b,c
    x=b-0.5*((b-a)^2*(f(b)-f(c))-(b-c)^2*(f(b)-f(a)))/((b-a)*(f(b)-f(c))-(b-c)*(f(b)-f(a)));
    
    %zjistime, zda nastala situace a < x < b < c nebo a < b < x < c
    if x < b, % nastala situace a < x < b < c
        %zjistime, na kterem intervalu je minimum
        if f(a) > f(x) & f(x) < f(b), % minimum je na intervalu  < a,b > , ktery obsahuje bod x
            c=b; % posuneme pravy okraj do bodu b
            b=x; % treti bod uprostred bude tvoren bodem x
        else % minimum je na intervalu  < x,c > , ktery obsahuje bod b
            a=x; % posuneme levy okraj do bodu x
        end;
    else % nastala situace a < b < x < c
        % zjistime, na kterem intervalu je minimum
        if f(a) > f(b) & f(b) < f(x), % minimum je na intervalu  < a,x >  obsahujicim bod b
            c=x; % posuneme pravy okraj do bodu x
        else % minimum je na intervalu  < b,c >  obsahujicim bod x
            a=b; % posuneme levy okraj do bodu b
            b=x; % treti bod uprostred bude tvoren bodem x
        end;
    end;
end;

sprintf('Minimum je na intervalu  < %g,%g > ',a,c)

end