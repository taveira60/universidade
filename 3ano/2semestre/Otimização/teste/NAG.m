function [w_opt,f_opt,output] = NAG(fwithgrad,w0,eta,beta,epsilon,kmax)
k=1;
wk=w0;
output=[];
mk=zeros(length(w0),1)
while k < kmax
    w_loockahead=wk+beta*mk;
    [~, gradfla] = fwithgrad(w_loockahead);
    [fk,gradfk]=fwithgrad(wk);
    norma=norm(gradfk,inf)
    if norma<=epsilon
        output=[output; k  wk' fk ];
        break
    end
    mk=beta*mk-eta*gradfla
    output=[output; k  wk' fk];
    wk=wk+mk;
    k=k+1;
end
w_opt=wk
f_opt=fk
end