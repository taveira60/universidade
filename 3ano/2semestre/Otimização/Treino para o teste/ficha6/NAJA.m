function [w_opt,f_opt,output] = NAJA(Fwithgrad,w0,eta,beta,epsilon,kmax)
   k=0;
   wk=w0;
   output=[];
   mk=zeros(lenght(w0),1);
   while k<=kmax
       w_lookahead=wk+beta*mk;
       [~,gradlookahead] = Fwithgrad(w_lookahead);
       [fk,gradk]=Fwithgrad(wk);
       norma=norm(gradk,inf);
       if norma<=epsilon
           output=[output; k wk' Fk gradk' eta norma];
           break
       end
       mk=beta*mk-eta*gradlookahead;
       output=[output; k wk' Fk gradk' eta norma];
       wk=wk+mk;
       k=k+1;
   end
   w_opt=wk;
   f_opt=fk;
end