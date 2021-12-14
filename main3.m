tspan1 = [0:10000];
y1_0 = [0;0;0;0;0;0;0];

[t1,y1] = ode23(@rs3,tspan1,y1_0);

plot_title = ["A" "B" "BL" "M" "T" "P"];
for i = 2:7
    subplot(6,1,i-1);
    plot(t1,y1(:,i));
    title(plot_title(i-1));
end

y2_0 = mean(y1(9000:10000,:));

%%

tspan2 = [0:10000];
y2_0(1) = 10^-5;
[t2,y2] = ode23(@rs3,tspan2,y2_0);

clf;
plot_title = ["A" "B" "BL" "M" "T" "P"];
for i = 2:7
    subplot(6,1,i-1);
    plot(t2,y2(:,i));
    title(plot_title(i-1));
end

y3_0 = mean(y2(9000:10000,:));