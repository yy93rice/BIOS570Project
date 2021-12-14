function dt = rs1_pos(t,RS)

kfa = 1*10^-11; kfb = 0;
k1 = 0.1; k_1 = 10; k2 = 10^6; k_2 = 10^-1;
kdm = 10^-3; 
kpa = 10^-3; kpb = 10^-2; 
kdp = 10^-2;


L = RS(1); RA = RS(2); RB = RS(3); RBL = RS(4); P = RS(5);

dRAdt = kfa-k1*RA+k_1*RB-kdm*RA;
% Some attempts at fine-adjusting the equations with the k2*L*RB term
% if k2*L*RB >= RS(3)
%     dRBdt = kfb-k_1*RB-RS(3)+k_2*RBL-kdm*RB;
%     dRBLdt = RS(3)-k_2*RBL-kdm*RBL;
% else
%     dRBdt = kfb-k_1*RB+k1*RA-k2*L*RB+k_2*RBL-kdm*RB;
%     dRBLdt = k2*L*RB-k_2*RBL-kdm*RBL;
% end
dRBdt = kfb-k_1*RB+k1*RA-k2*L*RB+k_2*RBL-kdm*RB;
dRBLdt = k2*L*RB-k_2*RBL-kdm*RBL;
dLdt = 0;
dPdt = kpa*RA+kpb*(RB+RBL)-kdp*P;

dt = [dLdt;dRAdt;dRBdt;dRBLdt;dPdt];

% Forcing the values of all differential to be at least 0
for i = 1:length(RS)
    if RS(i) + dt(i) <= 0
        dt(i) = -RS(i);
    end
end
end