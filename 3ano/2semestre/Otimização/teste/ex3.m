w0=[1;2]
eta=0.12;
beta=0.5

epsilon=0.00000005

[w_opt,f_opt,output]=NAG(@fwithgrad1,w0,eta,beta,epsilon,5)