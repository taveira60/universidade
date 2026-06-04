clc,clear;
syms w1 w2 y1

F=(w1^3)-(w2^2)

c1=w1+w2 +1/2

L=F-y1*c1

gradl=gradient(L,[w1 w2])

[ws1 ws2 ys1]=solve([gradl==0;c1==0],[w1 w2 y1])

c1_subs=subs(c1,[w1 w2], [1 -3/2])

c1_subs2=subs(c1,[w1 w2], [-1/3 -1/6])

hessl=hessian(L,[w1 w2])

hessl_subs=subs(hessl,[w1 w2],[-1/3 -1/6])

eig(hessl_subs)
det(hessl_subs)
limit(F,-inf)