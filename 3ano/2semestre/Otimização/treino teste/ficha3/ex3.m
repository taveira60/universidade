clear all;

syms w1 w2

F=((1/3)*w1^3)+((1/2)*w1^2)+(2*w1*w2)+(((1/2)*w2^2)-w2)+9;

grad=gradient(F,[w1 w2]);
hess = hessian(F, [w1 w2]);
vec=[0,0]

[p1,p2]=solve(grad==vec,[w1 w2])
 p1=[1 -1]
 p2=[2 -3]

a=subs(hess, [w1 w2],p1)
b=subs(hess, [w1 w2],p2)

det(a)
det(b)