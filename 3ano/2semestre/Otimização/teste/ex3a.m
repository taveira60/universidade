syms w1 w2
fun=2*w1^2 +w1*w2+4*w2^2+3*w1-w2
grad=gradient(fun,[w1 w2])

res=solve(grad==0,[w1 w2])