function [fopt,wopt] = MDM_armijobacktracking(f,fwithgrad,wk,epsilon,kmax)
wk=w0
k=0
output=[]
while k<=kmax
    [fk,gradfk]=fwithgrad(wk)
    norma=norm(gradfk,inf)
    if(norma<=epsilon)
        output=[output;k wk' fk gradfk' etak norma]
        break
    end
    sk=-gradfk
    etak=ArmijoBacktracking(f,fk,gradfk,wk,sk)
    output=[output;k wk' fk gradfk' etak norma]
    wk=wk+eta*sk
    k=k+1
end
fopt = fk;
wopt = wk;
end