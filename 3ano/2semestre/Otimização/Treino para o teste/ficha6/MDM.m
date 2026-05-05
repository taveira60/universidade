function [f_opt,w_opt,output] = MDM(Fwithgrad,w0,epsilon,kmax)
    k=0;
    wk=w0;
    output=[];
    while k < kmax
        [f_k, grad_k] = Fwithgrad(wk);
        norma=norm(grad_k,inf);
        while norma<=epsilon
            output=[output; k wk' Fk gradk' eta norma];
            break
        end
        sk=-grad_k;
        etak=0.05;
        output=[output; k wk' Fk gradk' eta norma];
        wk=wk+etak*sk;
        k=k+1;
    end
    f_opt = f_k; 
    w_opt = wk;
end