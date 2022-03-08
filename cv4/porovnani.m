function porovnani

% zvolme pocet iteraci
iteraci=100;

% zvolime nahodnou matici, uvidime jeslti bude konvergovat, ke ktere 
% pricteme jednotkovou diagonalni, zvysime tak pravdepodobnost ze vse bude konvergovat
A=rand(3)/2+eye(3)/2

% zvolime pozadovane reseni, ze ktereho napocitame pravou stranu
origReseni=[1;1;1];

% najdeme pravou stranu
y=A*origReseni

% zvolime nahodny uvodni odhad ze ktereho budeme iterovat
uvodniOdhad=rand(3,1);

% zvolime omega pro superrelaxaci, nebude optimalni, nevadi
omega=1.6;

% PROSTA ITERACE
	% spocteme si matici B jako I-A
	B=eye(size(A))-A;
	
	F=B;
	G=eye(size(F));

    x=uvodniOdhad;
	for i=1:iteraci
		x=F*x+G*y;
		vzdProstaIterace(i)=norm(x-origReseni);
	end;


% JACOBI

	L=tril(A,-1);
	R=triu(A,1);
	D=A-L-R;
	
	F=-inv(D)*(L+R);
	G=inv(D);

	x=uvodniOdhad;
	for i=1:iteraci
		x=F*x+G*y;
		vzdJacobi(i)=norm(x-origReseni);
	end;

% GAUSS-SEIDEL

	L=tril(A,-1);
	R=triu(A,1);
	D=A-L-R;

	F=-inv(D+L)*R;
	G=inv(D+L);

	x=uvodniOdhad;
	for i=1:iteraci
		x=F*x+G*y;
		vzdGaussSeidel(i)=norm(x-origReseni);
	end;


% SUPERRELAXACE + GAUS-SEIDEL

	L=tril(A,-1);
	R=triu(A,1);
	D=A-L-R;

	% toto je ze seidela
	F=-inv(D+L)*R;
	G=inv(D+L);

	x=uvodniOdhad;
	for i=1:iteraci
		xkp1=F*x+G*y;
		x=omega*(xkp1-x)+x;
		vzdSuperRelaxace(i)=norm(x-origReseni);
	end;

    
% SUPERRELAXACE s opt. omega

	L=tril(A,-1);
	R=triu(A,1);
	D=A-L-R;
	
	% toto je ze seidela
	F=-inv(D+L)*R;
	G=inv(D+L);

    r = max(abs(eig(F)));                % spektralni polomer matice F
    omega = 2/( 1+sqrt(abs(1-max(r))) ); % optimalni omega
    
	x=uvodniOdhad;
	for i=1:iteraci
		xkp1=F*x+G*y;
		x=omega*(xkp1-x)+x;
		vzdSuperRelaxaceOmega(i)=norm(x-origReseni);
	end;    


% ZOBRAZIME

	osaX=1:iteraci;

	plot(osaX,vzdProstaIterace,osaX,vzdJacobi,osaX,vzdGaussSeidel, ...
         osaX,vzdSuperRelaxace,osaX,vzdSuperRelaxaceOmega);
	% zobrazime legendu
	legend('Prosta iterace','Jacobi','Gauss-Seidel','Superrelaxace', 'SOR s volbou omega');
	% nastavime osu Y jako logaritmickou
	set(gca,'YScale','log');

end