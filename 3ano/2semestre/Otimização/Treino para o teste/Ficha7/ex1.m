syms w1 w2 w3 y1

F=(w1^2)-(2*w1)+((w2^2)-(w3^2))+(4*w3)

c1= w1 - w2 + 2*w3 - 2

L=F-y1 *c1

c1_sub=subs(c1,[w1 w2 w3],[2.5 -1.5 -1])

gradc1=gradient(c1,[w1 w2 w3])

gradl=gradient(L,[w1 w2 w3 y1])

vec=[0;0;0;0]

[ws1 ws2 ws3 ys1] = solve(gradl == vec)

hessw_l = hessian(L,[w1 w2 w3])

hess=subs(hessw_l,[w1 w2 w3], [2.5 -1.5 -1])

Z=null(gradc1')

Z'*hess*Z

 