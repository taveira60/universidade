function [f] = f9(w)

syms w1 w2

beta=1;

fun=w1^2+beta*w2^2;

f=subs(fun,[w1 w2],[w(1) w(2)]);

end