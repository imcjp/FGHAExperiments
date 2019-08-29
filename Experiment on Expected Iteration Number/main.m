clear all;clc;close all;
%% Setting parameters
x=0.08;
yn=0:0.01:10;
tol=eps;
%% Experiments start
n=length(yn);
mn1=zeros(n,1);
mn2=zeros(n,1);
%% Experiments start
for i=1:n
    y=yn(i);
    m1=fzero(@(m)expectedErrOfAlg1(m,x,y,tol),5);
    if y<=1
        m2=nan;
    else
        m2=fzero(@(m)expectedErrOfAlg2(m,x,y,tol),5);
    end
    mn1(i)=m1;
    mn2(i)=m2;
end
%% Show results
figure;
plot(yn,mn1,'Color',[175,238,238]/255);
hold on
plot(yn,mn2,'Color',[255,160,122]/255);
hold on
dmn=abs(mn1-mn2);
[v,ind]=min(dmn);
plot(yn(1:ind),mn1(1:ind),'LineWidth',1.5,'Color',[0 0 1]);
hold on
plot(yn(ind:end),mn2(ind:end),'LineWidth',1.5,'Color',[1 0 0]);
hold on
plot(yn(ind),(mn1(ind)+mn2(ind))/2,'MarkerSize',12,'Marker','*','LineWidth',1.5,'LineStyle','none',...
    'Color',[0 0 0]);
text(yn(ind)+0.2,(mn1(ind)+mn2(ind))/2+4,{[sprintf('(%g, %.2g)',1.618,(mn1(ind)+mn2(ind))/2) ]},'FontSize',10,'FontWeight','bold');
ylim([0 200]);
xlabel('y');
ylabel('Expected number of iterations');
legend1 = legend('Alg.1','Alg.2');
set(legend1,'FontSize',12,'Location','best');
set(gcf, 'position', [250 120 480 272]);