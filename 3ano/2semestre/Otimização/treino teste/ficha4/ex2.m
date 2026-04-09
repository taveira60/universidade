clc;
clear
syms w1 w2;

F = 0.1*w1^6-1.5*w1^4+5*w1^2+0.1*w2^4+3*w2^2-9*w2+0.5*w1*w2;

wk = [-1.25;1.25]
fk=subs(F,[w1;w2],wk)
s = [4;0.75]

c1 = 0.00001

p = 0.7

eta0=1.2

grad=gradient(F,[w1;w2])
gradfk=subs(grad,[w1;w2],wk)

eta=eta0
subs(F,[w1;w2],wk+eta*s)
while subs(F,[w1;w2],wk+eta*s)>=fk+c1*eta*gradfk'*s
    eta=eta*p
end

    


