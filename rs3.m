function dt = rs3(t,RS)

kfa = 10^-11; kfb = 0;
k1 = 0.1; k_1 = 10; k2 = 10^6; k_2 = 10^-1;
%kdma = 10^-3; kdmb = 10^-3;
kma = 9.1*10^-3; kta = 9.1*10^-2; kmb = 9.1*10^-2; ktb = 9.1*10^-3;
kdm = 10^-3; kdt = 10^-3;
kp = 10^-2; 
kdp = 10^-2;

L = RS(1); RA = RS(2); RB = RS(3); RBL = RS(4); M = RS(5); T = RS(6); P = RS(7);

dLdt = 0;
dRAdt = kfa-RA*(k1+kma+kta)+k_1*RB;
dRBdt = kfb-RB*(k_1+kmb+ktb)+k1*RA-k2*L*RB+k_2*RBL;
dRBLdt = k2*L*RB-RBL*(k_2+kmb+kfb);
dMdt = kma*RA+kmb*(RB+RBL)-kdm*M;
dTdt = kta*RA+ktb*(RB+RBL)-kdt*T;
dPdt = kp*M-kdp*P;

dt = [dLdt;dRAdt;dRBdt;dRBLdt;dMdt;dTdt;dPdt];

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