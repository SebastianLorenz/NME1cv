function chebp

% zobrazi Cebysevovy polynomu radu 0 - 5

x=-1:0.001:1;

T0=x*0+1;
T1=x;
T2=2*x.*T1-T0;
T3=2*x.*T2-T1;
T4=2*x.*T3-T2;
T5=2*x.*T4-T3;

plot(x,T0,x,T1,x,T2,x,T3,x,T4,x,T5);
legend('T0','T1','T2','T3','T4','T5');

end
