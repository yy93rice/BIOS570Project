% 1. Calibration of the model
% a. Setting up the equilibrium. All initial concentrations are set equal to 0
% time span is set to 10000 though it appears that 3000 may be sufficient

tspan1 = [1:10000];
y1_0 = [0;0;0;0;0];

[t1,y1] = ode23(@rs1_sm,tspan1,y1_0);

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

