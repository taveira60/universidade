clear all;
%a)
syms w1 w2 eta
F=(w1+w2^2)^2

wk=[1 0]
s=[-1 ;1]
gradf=gradient(F,[w1 w2])
fk=subs(gradf,[w1 w2], wk)
pi=s'*fk

%como o pi < 0 entao nos podemos provar que s e uma direçao de descida

%b)

phi =subs(F,[w1 w2], [1-eta eta])
gradphi=gradient(phi,eta)
ps=solve(gradphi==0,eta)
hessphi=hessian(phi,eta)
res=subs(hessphi,eta,1/2)
