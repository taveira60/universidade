function[f,gradf]=fwithgrad(w)

syms w1 w2

fun=0.01*w1^2+w2^2;

gradfun = gradient(fun,[w1 w2]);

f=double(subs(fun,[w1 w2], [w(1) w(2)]));

gradf=double(subs(gradfun,[w1 w2], [w(1) w(2)]));

end