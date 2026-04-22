syms w1 w2 w3 y1

F=w1^2-2*w1+w2^2-w3^2+4*w3

c1=w1-w2+2*w3-2

%definir a funçao lagrangeana

L=F-y1*c1

c1_ad=subs(c1,[w1 w2 w3],[2.5 -1.5 -1])

gradc1=gradient(c1,[w1 w2 w3])

gradl=gradient(L,[w1 w2 w3 y1])

vec=[0;0;0;0]

[ws1 ws2 ws3 ys1]=solve(gradl==vec)

tussl_w=hessian(L,[w1 w2 w3])

Z=null(gradc1')

Z'*tussl_w*Z