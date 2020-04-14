function simplexm
% viz. http://en.wikipedia.org/wiki/Nelder%E2%80%93Mead_method

function f=f(x1,x2)
	f=100*(x1-x2^2)^2+(1-x1)^2;
	% f=x1^2+x2^2;
end

alpha = 1; % koeficient zmeny velikosti pri reflexi
gamma = 2; % koeficient zvetseni
rho = 0.5; % koeficient zmenseni

c = zeros(2,1);

% 3 pocatecni body (ve 2D prostoru)
x = [0.1 -15.2; 4.7 19; 14.8 5.9];

% hodnoty v pocatecnich bodech
y(1)=f(x(1,1),x(1,2));
y(2)=f(x(2,1),x(2,2));
y(3)=f(x(3,1),x(3,2));

for k=1:30
	% body chceme mit serazene y(1)<y(2)<y(3)
	if y(3) < y(2) % prohozeni 2 a 3
		[x(2,1), x(3,1)] = deal(x(3,1), x(2,1));
		[x(2,2), x(3,2)] = deal(x(3,2), x(2,2));
		[y(2), y(3)] = deal(y(3), y(2));
	end
	if y(2) < y(1) % prohozeni 1 a 2
		[x(1,1), x(2,1)] = deal(x(2,1), x(1,1));
		[x(1,2), x(2,2)] = deal(x(2,2), x(1,2));
		[y(1), y(2)] = deal(y(2), y(1));
		if y(3) < y(2) % prohozeni 2 a 3
			[x(2,1), x(3,1)] = deal(x(3,1), x(2,1));
			[x(2,2), x(3,2)] = deal(x(3,2), x(2,2));
			[y(2), y(3)] = deal(y(3), y(2));
		end
	end
	
	% vypis hodnot
	x
	y

	% vypocet x0 (c(i)) v tezisti vsech bodu krome posledniho
	for i=1:2
		c(i) = 0;
		for j=1:2
			c(i) = c(i) + x(j,i)/2;
		end
	end
	
	% reflexe (oproti tezisti)
	for i=1:2
		xt(i) = c(i) + alpha*( c(i)-x(3,i) );
	end
	yt = f(xt(1), xt(2));
	
	
	if yt<y(3) % pokud je ozrcadleny bod nizsi, nez nas nejvyssi
		for i=1:2 % nahradime posledni novym
			x(3,i) = xt(i);
		end
		y(3) = yt; 
		if yt<y(1) % pokud je nizsi, nez nas nejnizsi
			for i=1:2 % provedeme reflexi se zvetsenim (oproti tezisti) s koeficientem gamma
				xe(i) = c(i) + gamma*( xt(i)-c(i) );
			end
			ye = f(xe(1), xe(2));
			if ye<yt  % pokud je vysledek lepsi, nez samotna reflexe
				for i=1:2 % nahradime posledni bod novym
					x(3,i) = xe(i);
				end
				y(3) = ye;
			end
		end
	end
	
	if yt>y(2) % pokud je ozrcadleny bod vetsi, nez nas prostredni
		for i=1:2 % provedeme zmenseni (oproti tezisti) s koeficientem rho
			xc(i) = c(i)+rho*( x(3,i)-c(i) );
		end
		yc = f(xc(1),xc(2));
		if yc<y(3) % pokud je novy bod nizsi, nez nas nejvyssi
			for i=1:2 % vymenime je
				x(3,i) = xc(i);
			end
			y(3) = yc;
		else % v opacnem pripade provedeme zmenseni ve vsech smerech (2,3) k minimu (1)
			for i=2:3 % zmensujeme smery 2 a 3, na minimum nesahame
				for j=1:2 % zmenseni (v puvodnich smerech) s koeficientem rho
					x(i,j) = x(1,j) + rho*( x(i,j)-x(1,j) );
				end
				y(i) = f( x(i,1), x(i,2) );
			end
		end
	end
end
			
		
		



end