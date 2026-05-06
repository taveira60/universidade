syms w1 w2 y1

F= w1^2 + w2^2

c1= w1 + w2 - 2

L= F - y1 * c1

c1_subs=subs(c1,[w1 w2],[1,1])

c1_grad=gradient(c1,[w1 w2])

gradL = gradient(L, [w1, w2]);

gradl_subs= subs(gradL,[w1 w2],[1 1])

lambda=solve(gradl_subs==0)

hessl=hessian(L,[w1 w2])