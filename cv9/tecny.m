function tecny

%demonstrace metody tecen pro nelinearni rovnice
%spolu s odhadem radu metody

%nadefinujeme f(x) a budeme hledat reseni f(x)=0
f=inline('exp(x)-3');
df=inline('exp(x)');

iteraci=10; % celkovy pocet iteraci

xi=0; % pocatecni body omezujici reseni x(i)
xi_p1=5; % a x(i+1)

epsilon = []; % odhad chyby, tedy rozdil poslednich dvou odhadu korene
reseni = []; % aktualni odhad reseni

for i=1:iteraci
	c=xi_p1-f(xi_p1)/df(xi_p1);
	epsilon(i)=abs(xi-xi_p1);
	xi=xi_p1;
	xi_p1=c;
	reseni(i)=c;
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