function gaussseidel

% Zvolme dve matice, A bude konvergovat, B nebude
A=[5 1 1; 2 7 3; 2 3 8];
B=[5 15 1; 8 7 3; 2 3 8];

% zvolime pravou stranu
y=[1;1;1];

% nastavime uvodni odhad reseni
xUvodni=[1;2;3];

% zvolime pocet iteraci, po ktere budeme chtit sledovat jak se reseni chova
iteraci=100;

% spocteme si reseni matic A a B primou metodou, pro kontrolu postupu
reseniA=A\y;
reseniB=B\y;

% v prubehu iteraci si budeme pamatovat velikost vektoru reseni v i-tem kroku, 
% dale "vzdalenost" reseni v i-tem kroku od skutecneho reseni spocitaneho primou metodou

% budeme iterovat matici A
x=xUvodni;
L=tril(A,-1);
U=triu(A,1);
D=A-L-U;
F=-inv(D+L)*U;
G=inv(D+L);
for i=1:iteraci
	velikostReseniA(i)=norm(x);        % jen pro zobrazovani
	velikostChybyA(i)=norm(x-reseniA); % jen pro zobrazovani
	x=F*x+G*y;                         % toto je vlastni vypocet 
end;

% budeme iterovat matici B
x=xUvodni;
L=tril(B,-1);
U=triu(B,1);
D=B-L-U;
F=-inv(D+L)*U;
G=inv(D+L);
for i=1:iteraci
	velikostReseniB(i)=norm(x);        % jen pro zobrazovani
	velikostChybyB(i)=norm(x-reseniB); % jen pro zobrazovani
	x=F*x+G*y;                         % vlastni vypocet
end;

% zobrazime si jak to vypada
subplot(211);
plot(1:iteraci,velikostReseniA,1:iteraci,velikostReseniB);
title('norma reseni v i-tem kroku');
xlabel('iteraci');
ylabel('norma reseni');
legend('matice A - konverguje','matice B - diverguje');
set(gca,'YScale','log');

subplot(212);
plot(1:iteraci,velikostChybyA,1:iteraci,velikostChybyB);
title('norma odchylky od skutecneho reseni');
xlabel('iteraci');
ylabel('norma odchylky');
legend('matice A - konverguje','matice B - diverguje');
set(gca,'YScale','log');

end