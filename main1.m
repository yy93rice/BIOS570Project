% 1. Calibration of the model
% a. Setting up the equilibrium. All initial concentrations are set equal to 0
% time span is set to 10000 though it appears that 3000 may be sufficient
% time span is set to 10000 though it appears that 3000 may be sufficient
% Switch out rs1 for rs2 or rs3 for models of other types of riboswitches

tspan1 = [0:10000];
y1_0 = [0;0;0;0;0];

[t1,y1] = ode23(@rs1,tspan1,y1_0);

plot_title = ["A" "B" "BL" "P"];
y_labels = ["[A] (M)" "[B] (M)" "[BL] (M)" "[P] (M)"];
for i = 2:5
    subplot(4,1,i-1);
    plot(t1,y1(:,i));
    title(plot_title(i-1));
    ylabel(y_labels(i-1));
end
xlabel('time (s)'); 

y2_0 = mean(y1(9000:10000,:));

%%
% b. Adding ligand. It was assumed that the ligand concentration remains
% constant and is instantly diffused into the cell

tspan2 = [0:1000];
y2_0(1) = 10^-1;
[t2,y2] = ode23(@rs1,tspan2,y2_0);

clf;
plot_title = ["A" "B" "BL" "P"];
y_labels = ["[A] (M)" "[B] (M)" "[BL] (M)" "[P] (M)"];
for i = 2:5
    subplot(4,1,i-1);
    plot(t2,y2(:,i));
    title(plot_title(i-1));
    ylabel(y_labels(i-1));
end
xlabel('time (s)'); 

y3_0 = mean(y2(height(y2)-1000:height(y2),:));

%%
% c. Numerical Integration: To find the steady-state protein concentration at
% different ligand concentrations (increment = sqrt(10))
% Warning: This runs very slowly for high ligand concentrations for some
% reason

tspan_L1 = [0:1000];

L = 10^-10;
i_L = 1;
while L < (10)*1.01
    y2_0(1) = L;
    [t2_L,y2_L] = ode23(@rs1,tspan_L1,y2_0);
    P = mean(y2_L(height(y2_L)-100:height(y2_L),5));
    
    P_L(i_L) = P;
    L_L(i_L) = L;
    
    i_L = i_L + 1;
    L = L*sqrt(10);
end

semilogx(L_L,P_L)

%%
% d. Steady-state approximation: To find the steady-state protein concentration at
% different ligand concentrations (increment = sqrt(10))

L = 10^-10;
i_L = 1;
while L < 10*1.01
    P_ss(i_L) = steadystate1(L);
    L_ss(i_L) = L;

    i_L = i_L + 1;
    L = L*sqrt(10);
end

semilogx(L_ss,P_ss)
xlabel('[L]'); ylabel('[P]');


%%
% e. Plotting [P] vs [L] in log scale for the two sections above.

clf;
subplot(1,2,1);
semilogx(L_L,P_L);
title('Numerical Solution');
xlabel('[L]'); ylabel('[P]');
subplot(1,2,2);
semilogx(L_ss,P_ss);
title('Steady-state Solution')
xlabel('[L]'); ylabel('[P]');

%%
% 2. Using the model for different situations
% a. Fluctuating ligand concentration

tspan2_1= [0:4000];
y2_0(1) = 0;
[t2_1,y2_1] = ode23(@rs1_varL,tspan2_1,y2_0);

clf;
plot_title = ["L" "A" "B" "BL" "P"];
y_labels = ["[L] (M)" "[A] (M)" "[B] (M)" "[BL] (M)" "[P] (M)"];
for i = 1:5
    subplot(5,1,i);
    plot(t2_1,y2_1(:,i));
    title(plot_title(i));
    ylabel(y_labels(i));
end
xlabel('time (s)'); 

%%
% b. Continous dilution due to cell division - Finding an initial equilibrium
tspan1_22 = [0:10000];
y122_0 = [0;0;0;0;0];

[t1_22,y1_22] = ode23(@rs1_varD,tspan1,y122_0);

plot_title = ["A" "B" "BL" "P"];
y_labels = ["[A] (M)" "[B] (M)" "[BL] (M)" "[P] (M)"];
for i = 2:5
    subplot(4,1,i-1);
    plot(t1_22,y1_22(:,i));
    title(plot_title(i-1));
    ylabel(y_labels(i-1));
end
xlabel('time (s)'); 

y222_0 = mean(y1(9000:10000,:));

%%
% c. Continous dilution due to cell division - adding ligands
tspan2_2= [0:8000];
y222_0(1) = 10^-8;
[t2_2,y2_2] = ode23(@rs1_varD,tspan2_2,y222_0);

clf;
plot_title = ["L" "A" "B" "BL" "P"];
y_labels = ["[L] (M)" "[A] (M)" "[B] (M)" "[BL] (M)" "[P] (M)"];
for i = 1:5
    subplot(5,1,i);
    plot(t2_2,y2_2(:,i));
    title(plot_title(i));
    ylabel(y_labels(i));
end
xlabel('time (s)'); 


%%
% 3. Trying to make the values non-negative
% Initial Equilibration by forcing the values to be non-negative

tspan_pos = [0:10000];
y1_0 = [0;0;0;0;0];

[t1_pos,y1_pos] = ode23(@rs1_pos,tspan1,y1_0);

plot_title = ["A" "B" "BL" "P"];
y_labels = ["[A] (M)" "[B] (M)" "[BL] (M)" "[P] (M)"];
for i = 2:5
    subplot(4,1,i-1);
    plot(t1_pos,y1_pos(:,i));
    title(plot_title(i-1));
    ylabel(y_labels(i-1));
end
xlabel('time (s)'); 

y2_0 = mean(y1(9000:10000,:));
