function P = steadystate1(L)

kfa = 1*10^-11; kfb = 0;
k1 = 0.1; k_1 = 10; k2 = 10^6; k_2 = 10^-1;
kdm = 10^-3; 
kpa = 10^-3; kpb = 10^-2; 
kdp = 10^-2;

K1 = k_1/k1;
K2 = k2/k_2;

P = (kfa/kdp)*(kpa*K1+kpb*(1+K2*L))/(kdm*K1+kdm*(1+K2*L));
