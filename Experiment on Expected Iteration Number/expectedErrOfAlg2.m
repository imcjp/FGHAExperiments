function [r] = expectedErrOfAlg2(m,x,y,tol)
% Error Function of Algorithm 2 Realized by Theorem 4
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

