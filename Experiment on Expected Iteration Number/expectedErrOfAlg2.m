function [r] = expectedErrOfAlg2(m,x,y,tol)
%ERR1 此处显示有关此函数的摘要
%   此处显示详细说明
if m<=1
    r=1e+10;
else
    chi=x-floor(x);
    if chi<1e-8
        r=x*(1/y)^(m+1)*(1+1/(1+y^2))-tol;
    else
        r=x*(1/chi+1/(1-chi))*(1/y)^(m+1)*(1+1/(1+y^2))-tol;
    end
end
end

