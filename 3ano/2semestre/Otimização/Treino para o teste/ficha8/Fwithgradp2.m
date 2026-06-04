function[f,gradf]=Fwithgradp2(w)
syms w1 w2 w3    

fun=(w1+3*w2+w3)^2+4*(w1-w2)^2;
gradfun=gradient(fun,[w1 w2 w3]);

f=double(subs(fun,[w1 w2 w3],[w(1) w(2) w(3)]));
gradf=double(subs(gradfun,[w1 w2 w3],[w(1) w(2) w(3)]));
end