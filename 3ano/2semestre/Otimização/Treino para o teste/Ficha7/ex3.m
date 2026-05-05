syms w1 w2 y1

F= w1^2 + w2^2

c1= w1 + w2 - 2

L=F -y1*c1

c1_sub=subs(c1,[w1 w2],[1 1])

c1_grad=gradient(c1,[w1 w2])

gradl=gradient(L,[w1 w2 y1])

vec=[0;0;0]

[ws1 ws2 ys1] = solve(gradl == vec)

hess=hessian(L,[w1 w2])

hess_point= subs(hess,[w1 w2 y1], [ws1 ws2 ys1])

