syms w1 w2 w3 y1

F=(w1^4*w2^2)+(w1^2*w3^4)+((1/2)*w1^2)+(w1*w2)+w3

c1= w1+w2+w3-1

L=F-y1*c1

c1_subs=subs(c1,[w1 w2 w3],[1 0 0])

c1_grad=gradient(c1,[w1 w2 w3])

L_grad=gradient(L,[w1 w2 w3])

L_grad_subs=subs(L_grad,[w1 w2 w3],[1 0 0])
lambda = double(solve(L_grad_subs ==0))

hessL=hessian(L,[w1 w2 w3])

hess=subs(hessL,[w1 w2 w3 y1],[1 0 0 1])

z=null(c1_grad')

z'*hess*z