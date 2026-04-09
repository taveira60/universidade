syms w

F=15-12*w-25*w^2+2*w^3

grad=gradient(F,w)

hess=hessian(F,w);

ponts=double(solve(grad==0,w));

ws1=25/6 - 697^(1/2)/6;

ws2=697^(1/2)/6 + 25/6

ponto=double(subs(hess,w,ponts))

2*sqrt(697)

double(subs(F,w,ponts))

limit(F,w,-inf)
limit(F,w,inf)