function [w_opt,f_opt,output] = HB(fwithgrad,w0,eta,beta,epsilon,kmax)
k=1;
wk=w0;
output=[];
mk=zeros(length(w0),1)
while k < kmax
    [fk,gradfk]=fwithgrad(wk);
    norma=norm(gradfk,inf);
    if norma<=epsilon
        output=[output; k  wk' fk ]
        break
    end
    sk=-gradfk;
    mk=beta*mk+eta*sk;
    output=[output; k  wk' fk]
    wk=wk+mk;
    k=k+1;
end
w_opt=wk;
f_opt=fk;
end