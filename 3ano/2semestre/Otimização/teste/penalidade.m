function [penaltyQ] = penalidade(w,mu)

f=w(1)^2-6*w(2)^2+5

ceq=w(2)-2

penaltyQ=f+0.5*mu*ceq^2;

end