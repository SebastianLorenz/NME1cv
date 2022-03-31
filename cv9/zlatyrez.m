function zlatyrez
%priklad minimalizace funkce jedne promenne metodou zlateho rezu

%zadejme si funkci -sin(x)
f=inline('-sin(x)','x');

%na zacatku nastavme uvodni body metody a < c , minimum by melo byt nekde
%kolem pi/2=1.5708, a bude mezi temito dvema body, bod b budeme dopocitavat
a=0;
c=pi;

%nastavme presnost, se kterou chceme nalezt minimum
presnost=1e-3;

%ulozime si zlaty rez
zlatyRez=(3-sqrt(5))/2;

%napocteme prvni nastrel bodu b
b=a+zlatyRez*(c-a);

%hledani probiha v cyklu
while 1,
    if (c-a) < presnost, % skoncime, pokud je minimum urceno dostatecne presne
        break;
    end;
    
    if (b-a)/(c-a)<0.5,
        % nyni mame body a<b<c, pokud bod b je v leve casti intervalu < a,c >,
        % ponechame ho tam, a dopocitame bod x
        x=a+(1-zlatyRez)*(c-a);
    else
        % pokud je bod b v prave casti intervalu < a,c > (tzn vznikl v prubehu
        % iteraci), preznacime ho na x a dopocteme polohu bodu b
        x=b;
        b=a+zlatyRez*(c-a);
    end;
    % nyni mame a<b<x<c, zjistime ve kterem intervalu je minimum
    if f(a)>=f(b) & f(b)<=f(x), % minimum je v intervalu < a,x >, ten navic obsahuje bod b
        c=x; % presuneme pravy konec intervalu do bodu x, bod b nechame na svem miste
    else % minimum je v intervalu < b,c >, ten navic obsahuje bod x
        tmp=b;
        b=x; % bod x se stane novym bodem b
        a=tmp; % levy okraj presuneme do puvodniho bodu b
    end;
    [a c]
end;

sprintf('Minimum je na intervalu  < %g,%g > ',a,c)

end