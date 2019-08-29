clear all;clc;close all
%% 设置参数
rm=5;
q=1;
p=1;
N=1;
% 对Matlab算法采样的概率，使用该概率的主要原因在于Matlab内置算法运行时间太长。设为1表示对所有Matlab内置算法的调用都运行
proOfAdop=0.05;
%% 实验输入参数
% 横坐标P的范围
Ps=[0:0.01:1];
% 每个图的参数
lamda0s=[1,3,5];
etas=[2,4];
timeByFastAlg=0;
timeByOrgAlg=0;
nCheck=0;
nRun=0;
rmse=0;
for i=1:length(etas)
    eta=etas(i);
    res=zeros(length(lamda0s),length(Ps));
    for j=1:length(lamda0s)
        lamda0=lamda0s(j);
        for t=1:length(Ps)
            P=Ps(t);
%% 使用论文新提出的快速算法
            tic
            v1=regionalCoverageByFastAlg(P,eta,rm,q,N,p,lamda0);
            tm=toc;
            timeByFastAlg=timeByFastAlg+tm;
            res(j,t)=v1;
            disp(sprintf('For fast algorithm, when η is %g, λ is %g and P is %g, the result is %g. Used time is %gms.',eta,lamda0,P,v1,tm*1000));
            nRun=nRun+1;
%% 使用内置的高斯超几何函数求解方法，该部分算法以proOfAdop的概率采样执行
            if rand()<proOfAdop
                tic
                v2=regionalCoverageByOrgAlg(P,eta,rm,q,N,p,lamda0);
                tm=toc;
                timeByOrgAlg=timeByOrgAlg+tm;
                disp(sprintf('For original algorithm, when η is %g, λ is %g and P is %g, the result is %g. Used time is %gms.',eta,lamda0,P,v2,tm*1000));
                disp(sprintf('Difference of two algorithm is %g.',abs(v1-v2)));
                rmse=rmse+(v1-v2)^2;
                nCheck=nCheck+1;
            end
        end
    end
    createfigure(Ps,res,['η = ' num2str(eta)]);
end
disp('Experiment completed!');
%% 对比
expTimeByOrgAlg=timeByOrgAlg*nRun/nCheck;
rmse=sqrt(rmse/nCheck);
disp(sprintf('Used time by fast algorithm is %gs.',timeByFastAlg));
disp(sprintf('Expected used time by original algorithm is %gs.',expTimeByOrgAlg));
disp(sprintf('RMSE of two algorithm is %g.',rmse));