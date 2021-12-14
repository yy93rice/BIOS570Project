function dt = rs1_varD(t,RS)

kfa = 1*10^-11; kfb = 0;
k1 = 0.1; k_1 = 10; k2 = 10^6; k_2 = 10^-1;
kdm = 10^-3; 
kpa = 10^-3; kpb = 10^-2; 
kdp = 10^-2;

L = RS(1); RA = RS(2); RB = RS(3); RBL = RS(4); P = RS(5);

%t_d = [1:1200 1800:3000 3600:4800];
t_d = 0;
if ismember(t,t_d) == 1
    i_d = 1;
else
    i_d = 0;
end
t_double = 1200;

dRAdt = kfa-k1*RA+k_1*RB-kdm*RA-i_d*t_double*RA/log(2);
dRBdt = kfb-k_1*RB+k1*RA-k2*L*RB+k_2*RBL-kdm*RB-i_d*t_double*RB/log(2);
dRBLdt = k2*L*RB-k_2*RBL-kdm*RBL-i_d*t_double*RBL/log(2);
dLdt = 0;
dPdt = kpa*RA+kpb*(RB+RBL)-kdp*P-i_d*t_double*P/log(2);

dt = [dLdt;dRAdt;dRBdt;dRBLdt;dPdt];
end
