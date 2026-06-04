clc ,clear;

syms w1 w2 w3 w4 y1 y2

F=(w1-2)^2 + (w2 -2)^2 + (w3-3)^ 2 +(w4-4)^ 2

c1= w1-2

c2=w3+w4-2

L=F-y1*c1-y2*c2

gradl=gradient(L,[w1 w2 w3 w4])

[ws1 ws2 ws3 ws4 ys1 ys2]=solve([gradl==0;c1==0;c2==0],[w1 w2 w3 w4 y1 y2])

hessl=hessian(L,[w1 w2 w3 w4])

eig(hessl)