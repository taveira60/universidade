
options=optimoptions("fmincon","Display","iter","SpecifyObjectiveGradient",true)

w0=[2;2];

A=[1 1];b=[25];
Aeq=[];beq=[]
lb=[2;0];
ub=[50;50];

[w_opt,f_opt,exitflag,output,lambda]=fmincon(@fwithgrad,w0,A,b,Aeq,beq,lb,ub,@nonlinc,options)

disp(lambda)