function createfigure(X1, YMatrix1,name)
figure1 = figure('Color',[1 1 1]);
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
plot1 = plot(X1,YMatrix1,'Parent',axes1,'LineWidth',2);
set(plot1(1),'Color',[0 0 1],'DisplayName','¦Ë = 1');
set(plot1(2),'Color',[0 1 0],'DisplayName','¦Ë = 3');
set(plot1(3),'Color',[1 0 0],'DisplayName','¦Ë = 5');
xlabel('P');
ylabel('C(Regional Coverage)');
title(name);
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.188790462157355 0.676923076923077 0.210030755917301 0.187667887667888]);

