function [r] = expectedErrOfAlg1(m,x,y,tol)
%ERR1 此处显示有关此函数的摘要
%   此处显示详细说明
if m<=0
    r=1e+10;
else
    r=m*(1-1/(y+1))^m*beta(1+x,m)-tol;
end
end

