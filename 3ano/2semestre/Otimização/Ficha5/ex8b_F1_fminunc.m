clear,clc,close all;


path(path,'problemas');

options=optimoptions('fminunc','Display','iter');

w0=[-1.2;1];

[wopt,Fopt,exitflag,output]=fminunc(@f1,w0,options)
