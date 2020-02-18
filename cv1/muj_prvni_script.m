%% zacatek
clear all;
a = [4 5 6];
b = [7 8 9];

%% souciny
skalarni = dot(a,b)
vektorovy = cross(a,b)

%%
A = [4 5 6; 1 2 3];
B = [1 2; 1 2; 1 2];
A*B
a*b'
%%
x1 = linspace(1,5,350);
x2 = logspace(1,3,3);

%%
A = [1 1 1 1; 2 2 2 2; 1 2 3 4; 2 4 6 8];
A(3,4);
A([1,4],:)

%%
%A(1,:) = []
s = size(A)
length([4 5 6])

%%
length(A(:))

%%
B = A'
prevracena = flipud(A) %fliplr(A)

%%
% A = ones(5)
% A = zeros(7,8)
% A = diag([4 5 6 8 9])
% B = [3 3 3 0 0 0 0; 3 3 3 0 0 0 0; 3 3 3 5 0 0 0; 0 0 0 0 8 8 8;0 0 0 0 8 8 8;0 0 0 0 8 8 8;]

M = zeros(6,7);
M(1:3,1:3) = ones(3)*3;
M(3,4) = 5;
M(4:6,5:7) = ones(3)*8;

%%
N = 1.5*M-6;

M*N'

%% 
K = M.*N
K = M./N

%%
M.^2

%%
a = randn(5)
b = rand(5)

%%
v = 1000:-6:100

%%
x = 0:100;
y = sin(x)

%%
a = randn(5);
kladny = (a>=0)

%%
A = [1 1 1 1; 2 2 2 2; 1 2 3 4; 2 4 6 8];
A(A==2) = 10;
A(A<=4) = 0
%%
min(min(A))

%%
x = 0;
for i=[4 8 15 1 2]
    x = x+i;
end
x

%%
clear all
x = linspace(0,2*pi,1000);
y = sin(x);
figure
plot(x,y,'r--')
title('sinus')
xlabel('osa X')
ylabel('osa Y')
axis([0 2*pi -2 2])
hold on
plot(x,cos(x),'k:')

%%
x = linspace(0,2*pi,1000);
y = naseFunkce(x);
figure
plot(x,y)

%%
save('dataProGraf','x','y')

save('dataProGraf','a','b','-append')
%%
load('dataProGraf')