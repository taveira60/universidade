clear all;
clc;

options=optimoptions('fminunc');
options.Display='iter';

w0 = [1; 1];

f = @(w) w(1)^3 + 2*w(2)^2 - w(2)^3 - 20*w(1);

[xopt,fopt,exitflag,output] = fminunc(f,w0,options)
