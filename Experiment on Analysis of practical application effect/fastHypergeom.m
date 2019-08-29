% FASTHYPERGEOM implements an efficient algorithm for solving Gauss hypergeometric function 2F1(1,x;1+x;-y)
% The input of the function is x and Y (x, y >= 0), and the output is the value of the function obtained.
% X and y can be isomorphic matrices whose output Z satisfies z(i,j)=2F1(1,x(i,j);1+x(i,j);-y(i,j))
% In addition, one of X and y can be a number. If x is a value, z(i,j)=2F1(1,x;1+x;-y(i,j)) and vice versa.