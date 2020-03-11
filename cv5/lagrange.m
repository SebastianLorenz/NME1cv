function lagrange

    % funkce, kterou budeme interpolovat
    function y=funkce(x)
        y = 5*x.^5-x.^4+3*x.^2-11*x+7;
        %y = x.^4 .* log(10+abs(x)) .* cos(x) .* exp(-abs(x));
        %y = exp(-x).*sqrt(abs(x));
        %y = 1./(abs(x)+1).*sin(x);
        %y = 1./(1+25*x.^2);
    end

    function y=Lagr(x1, x2, v, ii)
        y=0;
        for kk = 1 : ii 
            index = find(x2 ~= x2(kk)); % vyberu vsechny indexy mimo aktualniho kk
            % x1        - bod ve kterem interpoluji
            % x2        - zname body, ze kterych interpoluji
            % x2(index) - vsechny body mimo x2(ki)
            % v(kk)     - hodnota v aktualnim bode x2(kk)
            y = y + v(kk) * prod(x1-x2(index)) / prod(x2(kk)-x2(index));
        end
    end


a  = -10; % minimum x
b  =  10; % maximum x
cx =  a : (b-a)/1000 : b; % body, ve kterych budeme funkci interpolovat
n  =  26; % nejvyssi stupen interpolace
figure;

for i = 1 : n   % zkousime ruzne stupne interpolacniho polynomu
	step=(b-a)/(i+1); % velikost kroku pro dany stupen interpolace

    xx=zeros(1,i);  % body, ve kterych funkci zname
    val=zeros(1,i); % hodnoty funkce ve znamych bodech
    for j = 1 : i   % presne funkci vyhodnocujeme v i bodech
        xx(j)  = a + j*step;     % ekvidistantni body
        val(j) = funkce(xx(j)); 
    end

    eL=zeros(1,1001); % hodnoty interpolacniho polynomu 
    for k=1:1001
        eL(k) = Lagr(cx(k),xx,val,i); % hodnota polynomu v bode cx(k)
    end;

    eL2=zeros(1,1001); % odhad chyby 
    if i>1
        cx2 = xx(1) : (xx(i)-xx(1))/1000 : xx(i);
    else
        cx2=cx;
    end
    for k=1:1001
        eL2(k)=Lagr(cx2(k),xx,val,i); 
    end
    
    % nakreslime grafy
	subplot(2,1,1), plot(cx,funkce(cx),cx,eL);  % puvodni funkce
	mf=max(abs(funkce(cx)));
	set(gca,'YLim',[-2*mf 2*mf]);
	hold on;
	plot(xx,val,'LineStyle','none','Marker','o','MarkerSize',6,'Color',[1 0 0]); % hodnoty ve znamych bodech
	hold off;
	subplot(2,1,2), plot(cx,funkce(cx)-eL);     % interpolacni polynom
	s=get(gca,'YLim');
	set(gca,'YLim',[-max(abs(s)) max(abs(s))]);
	s=get(gca,'YLim');
	str=sprintf('Stupen polynomu: %d Norma rozdilu: %g',i-1,norm(funkce(cx2)-eL2));
	text(a+(b-a)/10,s(1)+s(2)/3,str,'FontSize',10);	
	
    waitforbuttonpress;
    
end


end
