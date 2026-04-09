function [w_opt,fval_opt] = MDM_procuraexata(f,fwithgrad,w0,epsilon,kmax)

wk=w0
k=0
output=[]
while (k<=kmax)
    [fk,gradfk]=fwithgrad(wk)
    norma=norm(gradfk,inf)
    if norma <= epsilon
        output=[output;k wk' fk gradfk' etak norma];
        break
    end
    sk=-gradfk
    etak=procura_exata(f,wk,sk)
    output=[output;k wk' fk gradfk' etak norma];
    wk=wk+etak*sk;
    k=k+1
end
w_opt = wk;
fval_opt = fk;

end