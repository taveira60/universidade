
syms w1 w2
F = 0.1*w1^6 - 1.5 * w1^4 + 5 * w1^2 + 0.1 * w2^4 + 3 * w2^2 -9*w2 + 0.5*w1*w2;

c = 0.1;
eta0 = 0.05;
rho = 0.7;
c = 10^-4;
wk = [-1.25,1.25];
sk = [4,0.75];
gradF = gradient(F,[w1 w2]);
Fk = subs(F,[w1,w2],wk);
gradFk = subs(gradF, [w1,w2], wk);

eta = eta0;,
vals = []
while (subs(F, [w1,w2],(wk + eta*sk)) > Fk+c*eta*gradFk*sk)
    eta = rho * eta;
    vals = [vals;[eta subs(F, [w1,w2],(wk + eta*sk))]];
end
fprintf('O eta que verifica a condição de Armijo é : '); disp(eta)

etas = linspace(0,1.2,100);
w=wk+etas.*sk;
w1=w(1,:);
w2=w(2,:);

