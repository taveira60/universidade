clear, clc, close all;



options=optimoptions('fminunc','Display','iter'); 


w0=[0;0];   


mu=100

[wopt,Qopt,exitflag,output]=fminunc(@(w)penalidade(w,mu),w0,options)