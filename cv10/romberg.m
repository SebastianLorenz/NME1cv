function romberg

f = inline('sin(x)*exp(cos(x))','x');

% slozene lichobeznikove pravidlo
function [integral] = lichobeznik(funkce,odkud,kam,krok)
    xArr=odkud:krok:kam;
    integral=0;
    for x=xArr
        % secteme vsechny funkcni hodnoty, ktere se opakuji dvakrat
    	integral=integral+funkce(x);
    end;
    % a odecteme povoliny kraju
    integral=integral-0.5*funkce(xArr(1))-0.5*funkce(xArr(size(xArr,2)));
    integral=integral*krok;
end

integ=zeros(4,1);
h0=0.1;
for i=1:4,
%  h=h0^(i)
  h=h0/(2^(i-1))
  integ(i)=lichobeznik(f,0,pi,h);
end;
integ

%presna hodnota:
v=(exp(1)-exp(-1));

figure
plot(1:4,integ,'*-',[1 4], [v v]);

figure
r1=4/3*integ(2)-1/3*integ(1)
plot(1:4,integ,'*-',[1 4], [v v], [1 2], [r1 r1]);

figure
r2=64/45*integ(3)-20/45*integ(2)+1/45*integ(1)
plot(1:4,integ,'*-',[1 4], [v v], [1 2], [r1 r1], [1 3], [r2,r2]);

end
