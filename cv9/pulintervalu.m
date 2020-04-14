function pulintervalu

% demonstrace metody puleni intervalu pro nelinearni rovnice
% spolu s odhadem radu metody

% nadefinujeme f(x) a budeme hledat reseni f(x)=0
f=inline('sin(x)-0.5');

iteraci=20; % celkovy pocet iteraci

a=0; % pocatecni body omezujici reseni
b=1;

epsilon = []; % odhad chyby, tedy delku intervalu <a,b> v jednotlivych krocich
reseni = []; % aktualni odhad reseni

for i=1:iteraci
	c=(a+b)/2;
	epsilon(i)=b-a;
	reseni(i)=(a+b)/2;
	if f(a)*f(c)<0
		b=c;
	else
		a=c;
	end;
end;

koren=reseni(end) % odhad konecneho reseni
chyba=epsilon(end) % odhadem konecne chyby

% zobrazime vyvoj reseni v zavislosti na iteracich vlevo
subplot(131);
plot(1:iteraci,reseni);
title('Vyvoj reseni');
xlabel('iterace');
ylabel('reseni');

% zobrazime vyvoj chyby v zavislosti na iteracich uprostred
subplot(132);
plot(1:iteraci,epsilon);
title('Vyvoj chyby');
xlabel('iterace');
ylabel('\epsilon');

% zobrazime zavislost log epsilon_i+1 na log epsilon_i
subplot(133);
x=log10(epsilon(1:(length(epsilon)-1)));
y=log10(epsilon(2:(length(epsilon))));
plot(x,y);
title('log \epsilon_{i+1} na log \epsilon_i');
xlabel('log \epsilon_{i}');
ylabel('log \epsilon_{i+1}');

% provedeme fit daty primkou
p=polyfit(x,y,1);

% smernice (tedy i rad) je
p(1)

end