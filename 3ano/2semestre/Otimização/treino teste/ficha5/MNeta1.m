function [fopt,wopt] = MN(fwithgradhess,w0,epsilon,kmax)
wk=w0
k=0
eta=1
output=[]
while k<=kmax
    [fk,gradfk,hessfk]=fwithgradhess(wk)
    norma=norm(gradfk,inf)
    if norma<=epsilon
        output=[output;k wk' fk gradfk' eta norma]
        break
    end
    sk=-hessfk/gradfk
    output=[output;k wk' fk gradfk' eta norma]
    wk=wk+eta*sk
    k=k+1
end
fopt=fk
wopt = wk;
output = [output; k wk' fk gradfk' eta norma]; 

end