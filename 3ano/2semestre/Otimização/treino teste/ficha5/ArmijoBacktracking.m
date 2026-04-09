function [etak] = ArmijoBacktracking(fun,fk,gradk,wk,sk)
c=0.0001
rho=0.5
eta0=1
eta=eta0
waux=wk+eta*sk
faux=fun(waux)
while faux>fk+c*eta*gradk'*sk
    eta=rho*eta
    waux = wk + eta * sk;
    faux = fun(waux);
end
etak = eta;
end