function [f,gradf] = f9withgrad(w)

syms w1 w2

beta=1;

fun=w1^2+beta*w2^2;
gradf=gradient(fun,[w1 w2])

f=double(subs(fun,[w1 w2],[w(1) w(2)]));
gradf=double(subs(gradf,[w1 w2],[w(1) w(2)]));

end