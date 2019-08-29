clear all;clc;close all;
%% 设置实验数据的范围及实验次数
lx=[-4:4];
ly=[-4:4];
tm=100;
xn=10.^lx;%10^-4 -- 10^4
yn=10.^ly;%10^-4 -- 10^4
%% 实验开始
n=length(xn);
m=length(yn);
tm1=zeros(n,m);
tm2=zeros(n,m);
diff=zeros(n,m);
failLog1=zeros(n,m);
failLog2=zeros(n,m);
for t=1:tm
    disp(sprintf('Running Times is %i.',t));
    for i=1:n
        for j=1:m
            x=xn(i);
            y=yn(j);
            disp(sprintf('Running example: x = %g and y = %g Test.Fast algorithm is failed.',x,y));
            tic;
            v1=fastHypergeom(x,y);
            tt=toc;
            tm1(i,j)=tt;
            tic;
            v2=hypergeom([1,x],1+x,-y);
            tt=toc;
            tm2(i,j)=tt;
            failed=0;
            if v1>1 || v1<0
                disp(sprintf('\tWarning! When x is %g and y is %g.Fast algorithm is failed.',x,y));
                failed=1;
                failLog1(i,j)=1;
            end
            if v2>1 || v2<0
                disp(sprintf('\tWarning! When x is %g and y is %g.Original algorithm is failed.',x,y));
                failed=1;
                failLog2(i,j)=1;
            end
            if failed==0
                diff(i,j)=(v1-v2)^2+diff(i,j);
            end
        end
    end
end
disp('Experiment completed!');
%% 统计实验结果
tm1=tm1/tm;
tm2=tm2/tm;
diff=diff/tm;
rmse=sqrt(mean(diff(:)));
avgXTm1=mean(tm1,2);
avgYTm1=mean(tm1,1);
avgXTm2=mean(tm2,2);
avgYTm2=mean(tm2,1);
avgTm1=mean(tm1(:));
avgTm2=mean(tm2(:));
ratio=tm2./tm1;
avgR=avgTm2./avgTm1;
%% 输出结果
for i=1:n
    for j=1:m
        x=xn(i);
        y=yn(j);
        disp(sprintf('When x is %g and y is %g.\n\tUsed time of fast algorithm is %gμs.\n\tUsed time of original algorithm is %gμs.\n\tFast algorithm runs %g times faster than original algorithm.',x,y,tm1(i,j)*1e6,tm2(i,j)*1e6,ratio(i,j)));
    end
end
for i=1:n
    x=xn(i);
    disp(sprintf('When x is %g.\n\tAverage used time of fast algorithm is %gμs.\n\tAverage used time of original algorithm is %gμs.',x,avgXTm1(i)*1e6,avgXTm2(i)*1e6));
end
for i=1:m
    y=yn(i);
    disp(sprintf('When y is %g.\n\tAverage used time of fast algorithm is %gμs.\n\tAverage used time of original algorithm is %gμs.',y,avgYTm1(i)*1e6,avgYTm2(i)*1e6));
end
if sum(failLog1(:))>1
    disp(sprintf('Failed running log of fast algorith:'));
else
    disp(sprintf('No failed running of fast algorith!'));
end
for i=1:n
    for j=1:m
        if failLog1(i,j)==1
            x=xn(i);
            y=yn(j);
            disp(sprintf('\tFor x is %g and y is %g. Fast algorithm has failed running.',x,y));
        end
    end
end
if sum(failLog2(:))>1
    disp(sprintf('Failed running log of original algorith:'));
else
    disp(sprintf('No failed running of original algorith!'));
end
for i=1:n
    for j=1:m
        if failLog2(i,j)==1
            x=xn(i);
            y=yn(j);
            disp(sprintf('\tFor x is %g and y is %g. Original algorithm has failed running.',x,y));
        end
    end
end
disp(sprintf('Average used time of fast algorithm is %gμs.',avgTm1*1e6));
disp(sprintf('Average used time of original algorithm is %gμs.',avgTm2*1e6));
disp(sprintf('Fast algorithm runs %g times faster than original algorithm.',avgR));
disp(sprintf('RMSE of two algorithm is %g.',rmse));