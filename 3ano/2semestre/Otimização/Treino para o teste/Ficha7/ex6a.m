syms w1 w2 y1 y2

F=w1^3-w2^3-2*w1^2-w1+w2

c1=-w1- 2* w2 +2

c2=w1

%caso para 2 ativas

L=F-y1 *c1 -y2*c2

gradl=gradient(L,[w1 w2])
ponto=solve([gradl==0;c1==0;c2==0],[w1 w2 y1 y2])

c1_subs=subs(c1,[w1 w2],[0 1])
c2_subs=subs(c2,[w1 w2],[0 1])

hessl=hessian(L,[w1 w2])

hess_subs=subs(hessl,[w1 w2],[0 1])

det(hess_subs)
eig(hess_subs)

% c1 ativa

L1=F-y1 *c1 

gradl1=gradient(L1,[w1 w2])
[ws1 ws2 ys1]=solve([gradl1==0;c1==0],[w1 w2 y1])

c1_subs1=subs(c1,[w1 w2],[ws1(1) ws2(1)])
c2_subs1=subs(c2,[w1 w2],[ws1(1) ws2(1)])


hessl1=hessian(L,[w1 w2])

hess_subs1=subs(hessl,[w1 w2],[ws1(1) ws1(2)])

det(hess_subs1)
eig(hess_subs1)