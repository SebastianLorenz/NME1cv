function muller

	function f=f(x)
		f=4*x^3 - 2*x^2 - 4*x - 3;
	end

presnost=1.0e-6;

n=1;

x0=1;
x1=2;
x2=1.1;

y0=f(x0);
y1=f(x1);
y2=f(x2);

while (abs(y2)>presnost)
	
    disp(['Krok ' num2str(n) ' koren ' num2str(x2) ' hodnota ' num2str(y2)]);
    a0=y0/((x0-x1)*(x0-x2));
    a1=y1/((x1-x0)*(x1-x2));
    a2=y2/((x2-x0)*(x2-x1));
    A=a0+a1+a2;
    C=x1*x2*a0 + x0*x2*a1 + x0*x1*a2;
    B=-(x1+x2)*a0 -(x0+x2)*a1 -(x0+x1)*a2;

    xn=(-B+sqrt(B*B-4*A*C))/(2*A);
    xn0=(-B-sqrt(B*B-4*A*C))/(2*A);

    if abs(xn0-x2)<abs(xn-x2)
    	xn=xn0;
    end

    x0=x1;
    x1=x2;
    x2=xn;
    y0=y1;
    y1=y2;
    y2=f(xn);

    n=n+1;
    
end

end

