clear
syms w1 w2 y1

F=w1^2-w2^2

c1=w1^2+2*w2^2-4

L=F-y1*c1

L_grad=gradient(L,[w1 w2])

[ws1,ws2,ys1]=solve([L_grad>0;c1==0],[w1 w2 y1])

ponto1=[2;0]
ponto2=[-2;0]

c1_grad=gradient(c1,[w1 w2])

c1_gradsubs=subs(c1_grad,[w1 w2],[ponto1(1) ponto1(2)])
c1_gradsubs2=subs(c1_grad,[w1 w2],[ponto2(1) ponto2(2)])



l1_subs=subs(L_grad,[w1 w2],[ponto1(1) ponto1(2)])

l1_subs2=subs(L_grad,[w1 w2],[ponto2(1) ponto2(2)])

l1=solve(l1_subs==0)
l1_2=solve(l1_subs2==0)

hess=hessian(L,[w1 w2])

hessval=subs(hess,[y1],1)

Z=null(c1_grad')

Z'*hessval*Z