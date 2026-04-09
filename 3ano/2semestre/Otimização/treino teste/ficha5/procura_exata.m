function [etak] = procura_exata(fun,wk,sk)
    syms eta
    waux= wk+eta*sk
    phi=fun(waux)
    gradphi=gradient(phi)
    sol_pe=double(solve(gradphi==0,eta))
    vals_phi=double(subs(phi,eta,sol_pe))
    [min_phi index]=min(vals_phi)
    etak=sol_pe(index)
end