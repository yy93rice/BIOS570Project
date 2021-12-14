function dt = rs1_varL(t,RS)

kfa = 1*10^-11; kfb = 0;
k1 = 0.1; k_1 = 10; k2 = 10^6; k_2 = 10^-1;
kdm = 10^-3; 
kpa = 10^-3; kpb = 10^-2; 
kdp = 10^-2;

L = RS(1); RA = RS(2); RB = RS(3); RBL = RS(4); P = RS(5);

dRAdt = kfa-k1*RA+k_1*RB-kdm*RA;
dRBdt = kfb-k_1*RB+k1*RA-k2*L*RB+k_2*RBL-kdm*RB;
dRBLdt = k2*L*RB-k_2*RBL-kdm*RBL;
dLdt = (10^-5)/2*(1/(500/2/3.1416))*cos((t-125)/(500/2/3.1416));
dPdt = kpa*RA+kpb*(RB+RBL)-kdp*P;

dt = [dLdt;dRAdt;dRBdt;dRBLdt;dPdt];
end
