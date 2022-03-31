function gaussint

% na kazdem radku je bod a prislusna vaha
vahy = [ -0.987992518	0.03075324221;
-0.9372733924	0.07036604699;
-0.8482065834	0.1071592202;
-0.7244177314	0.139570678;
-0.5709721726	0.1662692057;
-0.3941513471	0.1861609998;
-0.201194094	0.1984314853;
0.0	        0.201194094;
0.201194094     0.1984314853;
0.3941513471	0.1861609998;
0.5709721726	0.1662692057;
0.7244177314	0.139570678;
0.8482065834	0.1071592202;
0.9372733924	0.07036604699;
0.987992518	0.03075324221 ];

f = inline('sin(x)*exp(cos(x))','x');

% integracni meze
a=0;
b=pi;

integral = 0;

m = size(vahy,1);   % pocet bodu

for i=1:m
    % vahy(i,1) da i-ty bod, vahy(i,2) da i-tou vahu
    % body jsou preskalovane z (-1,1) na (a,b)
    integral = integral+vahy(i,2)*f( ( (b-a)*vahy(i,1) + (a+b) )/2 )
end

integral = integral * (b-a)/2

end
