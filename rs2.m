function dt = rs2(t,RS)

kfa = 10^-11; kfb = 0;
k1 = 0.1; k_1 = 10; k2 = 10^6; k_2 = 10^-1;
kdma = 10^-3; kdmb = 10^-3;
kp = 10^-2; 
kdp = 10^-2;

L = RS(1); RA = RS(2); RB = RS(3); RBL = RS(4); P = RS(5);

dRAdt = kfa-k1*RA+k_1*RB-kdma*RA;
dRBdt = kfb-k_1*RB+k1*RA-k2*L*RB+k_2*RBL-kdmb*RB;
dRBLdt = k2*L*RB-k_2*RBL-kdmb*RBL;
dLdt = 0;
dPdt = kpa*(RA+RB+RBL)-kdp*P;

dt = [dLdt;dRAdt;dRBdt;dRBLdt;dPdt];

for i = 1:length(RS)
    if RS(i) + dt(i) <= 0
        dt(i) = -RS(i);
    end
end
end

% Initial set
% kfa = 10^-11; kfb = 0;
% k1 = 0.1; k_1 = 10; k2 = 10^6; k_2 = 10^-1;
% kdm = 10^-3; 
% kpa = 10^-3; kpb = 10^-2; 
% kdp = 10^-2;
% RA = 0; RB = 0; RBL = 0; P = 0;