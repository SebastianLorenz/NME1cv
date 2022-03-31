clear all
clc

m = 10; % pocet kroku

a=1; b=5;
%a=pi/6; b= pi/2

% integrovana funkce f je definovana na konci skriptu (MATLAB to tak chce)

r=(b-a)/m; % velikost kroku

% obdelnikova metoa
S=0;
for i=a:r:b-r
	S=S+r*(f(i+r/2));
end
disp(['obdelnikova metoda ']);
S

% lichobeznikova metoda
S=0;
for i=a:r:b-r
	S=S+r*(f(i)+f(i+r))/2;
end
disp(['lichobeznikova metoda ']);
S

% simpsonovo pravidlo
S=0;
for i=a:2*r:b-2*r
	S=S+r/3*(f(i)+4*f(i+r)+f(i+2*r));
end
disp(['simpsonovo pravidlo ']);
S


%--------------
function y=f(x)
	y=sin(x);
    %y=exp(x);
    %y=(sin(x))^3;
end
