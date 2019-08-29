function [ z ] = connProByOrgAlg(P,r0,d1,eta,rm,q,N,p,lamda0 )
theta1=min(acos((r0^2+d1^2-rm^2)/(2*r0*d1)),pi);
omiga=myOmiga(rm,r0,d1,eta,theta1,q);
z=exp(-q*N/(p*d1^(-eta)))*exp(-P*lamda0/(rm^2*pi)*omiga);
end
function [ z ] = myOmiga(rm,r0,d1,eta,theta1,q )
z=quad(@(theta)dmyOmiga(rm,r0,d1,eta,theta,q),0,theta1);
end

% 利用Matlab内置的函数hypergeom实现，该函数仅支持数值的处理
function [ z ] = dmyOmiga(rm,r0,d1,eta,thetas,q )
for i=1:length(thetas)
    theta=thetas(i);
    z(i)=myphi(r0*cos(theta)+sqrt(rm^2-r0^2*(sin(theta))^2),rm,r0,d1,eta,theta,q)-myphi(d1,rm,r0,d1,eta,theta,q);
end
end

function [ z ] = myphi( x,rm,r0,d1,eta,theta,q)
t1=x^eta/(q*d1^eta);
z=(x^2/6)*(6*(2-2*r0^2/rm^2)*orgHypergeom(2/eta,t1)-(2*x/rm^2)*(3*x*orgHypergeom(4/eta,t1)-8*r0*cos(theta)*orgHypergeom(3/eta,t1)));
end

function [ res] = orgHypergeom(x,y)
res=hypergeom([1,x],1+x,-y);
end