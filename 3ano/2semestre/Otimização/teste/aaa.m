
clear, clc, close all;
%format long;


options=optimoptions('fminunc','Display','iter'); 
% exercício1 dos slides 

w0=[0;0];   % ponto inicial


mu=1  
% aplicar o fminunc
[wopt,Qopt,exitflag,output]=fminunc(@(w)penaltyQ_P1(w,mu),w0,options)

mu=10  
% aplicar o fminunc
[wopt,Qopt,exitflag,output]=fminunc(@(w)penaltyQ_P1(w,mu),w0,options)

mu=100  
% aplicar o fminunc
[wopt,Qopt,exitflag,output]=fminunc(@(w)penaltyQ_P1(w,mu),w0,options)

mu=1000 
% aplicar o fminunc
[wopt,Qopt,exitflag,output]=fminunc(@(w)penaltyQ_P1(w,mu),w0,options)



function [penaltyQ] = penaltyQ_P1(w,mu)

  %----------------------
  % definir a funcao f
  fun=w(1)+w(2);

  %definir a restrição de igualdade  ceq(w)=0
  ceq=w(1)^2+w(2)^2-2;

  %definir a função de penalidade quadrática Q
  penaltyQ=fun+0.5*mu*ceq^2;

  
end