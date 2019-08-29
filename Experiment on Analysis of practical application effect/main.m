clear all;clc;close all
%% Setting parameters
rm=5;
q=1;
p=1;
N=1;
% The main reason for using the probability of sampling the built-in algorithm of Matlab is that Matlab's built-in algorithm runs too long. 
% Set to 1 to indicate that all calls to Matlab's built-in algorithms are running.
proOfAdop=0.05;
%% Experimental input parameters
% Range of parameter P
Ps=[0:0.01:1];
% Parameters of each figure
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
%% Using the new algorithm proposed in the paper
            tic
            v1=regionalCoverageByFastAlg(P,eta,rm,q,N,p,lamda0);
            tm=toc;
            timeByFastAlg=timeByFastAlg+tm;
            res(j,t)=v1;
            disp(sprintf('For fast algorithm, when ¦Ç is %g, ¦Ë is %g and P is %g, the result is %g. Used time is %gms.',eta,lamda0,P,v1,tm*1000));
            nRun=nRun+1;
%% Using the built-in Gauss hypergeometric function solving method, this part of the algorithm is executed with the probability sampling of proOfAdop
            if rand()<proOfAdop
                tic
                v2=regionalCoverageByOrgAlg(P,eta,rm,q,N,p,lamda0);
                tm=toc;
                timeByOrgAlg=timeByOrgAlg+tm;
                disp(sprintf('For original algorithm, when ¦Ç is %g, ¦Ë is %g and P is %g, the result is %g. Used time is %gms.',eta,lamda0,P,v2,tm*1000));
                disp(sprintf('Difference of two algorithm is %g.',abs(v1-v2)));
                rmse=rmse+(v1-v2)^2;
                nCheck=nCheck+1;
            end
        end
    end
    createfigure(Ps,res,['¦Ç = ' num2str(eta)]);
end
disp('Experiment completed!');
%% comparison
expTimeByOrgAlg=timeByOrgAlg*nRun/nCheck;
rmse=sqrt(rmse/nCheck);
disp(sprintf('Used time by fast algorithm is %gs.',timeByFastAlg));
disp(sprintf('Expected used time by original algorithm is %gs.',expTimeByOrgAlg));
disp(sprintf('RMSE of two algorithm is %g.',rmse));