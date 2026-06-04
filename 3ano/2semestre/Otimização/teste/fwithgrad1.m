function [f,gradf]=fwithgrad1(w)
syms w1 w2
fun=2*w1^2 +w1*w2+4*w2^2+3*w1-w2
gradienteeee=gradient(fun,[w1 w2])
f=subs(fun,[w1 w2],[w(1) w(2)])
gradf=subs(gradienteeee,[w1 w2],[w(1) w(2)])
end