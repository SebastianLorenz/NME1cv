%% Nasobeni matic

A = [1 2 3 4 5; 6 7 8 9 10; -1 -2 -3 -4 -5; -6 -7 -8 -9 -10]

B = [4 2 1; 1 2 4; 1 1 1; 2 2 2; 4 4 4]

C = A*B

D = maticoveNasobeni(A,B)

%% Gaussova eliminace

A = [1 1 1; 1 2 2; 3 2 1];
b = [1; 2; 3];

[U,b_u] = gaussElim(A,b)

%% Zpetny beh

x = zpetnyBeh(U,b_u) % jak jsme to spocitali my

%% LU dekompozice

[L,U] = luDekomp(A)

% vypiseme kontrolni soucin
disp('L*U = ');
disp(L*U);  