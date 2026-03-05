
syms w1 w2 n
F=(w1+(w2)^2)^2
%a)
grad=gradient(F,[w1,w2])
%calcular no ponto w=(1,0)
gradfw=subs(grad,[w1,w2],[1,0])
%disp(gradfw)
s=[-1;1]
%calcular produto interno
prod=s'*gradfw

%b)
phi=subs( F,[w1,w2],[1-n,n]);
disp(phi)
gradphi=gradient(phi,[n]);
disp(gradphi)
%calcular os 0 da derivada de phi
etas=solve(gradphi)
hess=hessian(phi,n)
disp(hess)
res=subs(hess,n,1/2);
disp(res)

%c)
etas=linspace(0,5,100);
vaps_phi=(1-etas+etas.^2).^2;
plot(etas,vaps_phi,"b-")
hold on
phi_eta=subs(phi,[n],1/2)
plot(1/2,phi_eta,'KO')