function strelba

    function dy = kanon(t,y)
        % y je vektor obsahujici hodnoty 4 promennych
        % y = [x  dx   y  dy ]
        dy = zeros(4,1);
        g=1;
        k=1;
        v=sqrt(y(2)^2+y(4)^2);
        dy(1) = y(2);
        dy(2) = -k*v*y(2);
        dy(3) = y(4);
        dy(4) = -k*v*y(4)-g;
        end
        
    function [value,isterminal,direction] = event(t,y,P1)
        % pomocna funkce definujici detekci nulove vysky 
        value = y(3);     % vyska = 0
        isterminal = 1;   % signal pro zastaveni integrace
        direction = -1;           
        end

tspan = [0,5];
% u = [x  dx   y  dy ]
theta = 45/180*pi;  % prvni pokusny uhel 45 stupnu
v  = 4;             % rychlost v0
y0 = [0  v*cos(theta) 0 v*sin(theta)]; % pocatecni podminky

ode = @(t,y) kanon(t,y);            % soustava diferencialnich rovnic
opt = odeset('Events',@event);      % parametry pro Matlab resic ODE

[t,y] = ode45(ode, tspan, y0,opt);  % explicitni RK4 metoda

% Plot of the solution
%plot(y(:,1),y(:,3))
%y(size(y,1),1)
%axis([0 1 0 1]);


% metoda strelby
thMin=5;    
thMax=45;
thMin=45;
thMax=80;
Cil=2.5;
while thMax-thMin > 1e-1
  thNew=(thMax-thMin)/2 + thMin; % novy pokusny uhel - puleni intervalu

  % pozor, strilim!:
    theta = thNew/180*pi; % novy pokusny uhel
    v  = 4;
    y0 = [0  v*cos(theta) 0 v*sin(theta)]; % pocatecni podminky
    [t,y] = ode45(ode, tspan, y0,opt);     % reseni RK4 metodou
    zasah=y(size(y,1),1);
    [thMin thMax  thNew  zasah];

  % kam jsem se strefil?
    if Cil > zasah % nedostrelim
      thMax=thNew;
    else         % prestrelim
      thMin=thNew;
    end;

    % vykreslim drahu
    plot(y(:,1),y(:,3))
    y(size(y,1),1)
    axis([0 3 0 3]);
    hold on;
    k = waitforbuttonpress % jednotlive drahy vykreslujeme po zmacknuti libovolneho tlacitka
end;
Reseni=thNew

end
