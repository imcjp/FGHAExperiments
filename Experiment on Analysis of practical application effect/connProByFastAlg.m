function [ z ] = connProByFastAlg(P,r0,d1,eta,rm,q,N,p,lamda0 )
theta1=min(acos((r0^2+d1^2-rm^2)/(2*r0*d1)),pi);
omiga=myOmiga(rm,r0,d1,eta,theta1,q);
z=exp(-q*N/(p*d1^(-eta)))*exp(-P*lamda0/(rm^2*pi)*omiga);
end
function [ z ] = myOmiga(rm,r0,d1,eta,theta1,q )
z=quad(@(theta)dmyOmiga(rm,r0,d1,eta,theta,q),0,theta1);
end
% 利用fastHypergeom实现，支持向量的处理
function [ z ] = dmyOmiga(rm,r0,d1,eta,theta,q )
    z=myphi(r0*cos(theta)+sqrt(rm^2-r0^2*(sin(theta)).^2),rm,r0,d1,eta,theta,q)-myphi(d1,rm,r0,d1,eta,theta,q);
end

function [ z ] = myphi( x,rm,r0,d1,eta,theta,q)
t1=x.^eta/(q*d1^eta);
z=(x.^2/6).*(6*(2-2*r0^2/rm^2)*fastHypergeom(2/eta,t1)-(2*x/rm^2).*(3*x.*fastHypergeom(4/eta,t1)-8*r0*cos(theta).*fastHypergeom(3/eta,t1)));
end