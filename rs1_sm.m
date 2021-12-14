function dt = rs1_sm(t,RS)

kfa = 1*10^-11; kfb = 0;
k1 = 0.1; k_1 = 10; k2 = 10^6; k_2 = 10^-1;
kdm = 10^-3; 
kpa = 10^-3; kpb = 10^-2; 
kdp = 10^-2;

if exist('i_t','var') == 0 
    i_t = 1;
end 

for i = 1:5
    RS_sm(i_t,i) = RS(i);
if i_t > 100
    RS_sm_temp = mean(RS_sm((i_t-100):(i_t-1),i));
    RS_sm1(i) = RS_sm_temp;
end

if i_t > 100
    L = RS_sm1(1); RA = RS_sm1(2); RB = RS_sm1(3); RBL = RS_sm1(4); P = RS_sm1(5);
else
    L = RS(1); RA = RS(2); RB = RS(3); RBL = RS(4); P = RS(5);
end 
i_t = i_t+1;

dRAdt = kfa-k1*RA+k_1*RB-kdm*RA;
dRBdt = kfb-k_1*RB+k1*RA-k2*L*RB+k_2*RBL-kdm*RB;
dRBLdt = k2*L*RB-k_2*RBL-kdm*RBL;
dLdt = 0;
dPdt = kpa*RA+kpb*(RB+RBL)-kdp*P;

dt = [dLdt;dRAdt;dRBdt;dRBLdt;dPdt];
end
