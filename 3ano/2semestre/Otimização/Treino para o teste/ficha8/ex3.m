clc, clear;

options=optimoptions('fmincon','Display','iter','SpecifyObjectiveGradient',true)

w0=[0.1;0.7;0.2]

A=[];b=[];
Aeq=[-1, -1 ,-1];beq=[-1];
lb=[0;0;0]
ub=[];

[w_opt,f_opt,exitflag,output,lambda]=fmincon(@Fwithgradp2,w0,A,b,Aeq,beq,lb,ub,@nonlinp2,options)