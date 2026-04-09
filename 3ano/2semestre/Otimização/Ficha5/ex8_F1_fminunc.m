clear,clc,close all;


path(path,'problemas');

options=optimoptions('fminunc','Display','iter','SpecifyObjectiveGradient',true);

w0=[-1.2;1];

[wopt,Fopt,exitflag,output]=fminunc(@f1withgrad,w0,options)
