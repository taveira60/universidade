syms w1 w2 w3 y1

F= (w1^2) + (w1^2*w3^2) + (2*w1*w2) + (w2 ^ 4) + (8*w2)

c1= 2*w1+5*w2 + w3 - 3

L = F - y1 * c1

c1_ad=subs(c1,[w1 w2 w3],[1 0 1])

grad_c1=gradient(c1,[w1 w2 w3])

gradl=gradient(L,[w1 w2 w3 y1])

vec=[0;0;0;0]


[ws1 ws2 ws3 ys1]=solve(gradl==vec)

hessw_l=hessian(L,[w1 w2 w3])

Z=null(grad_c1')

Z

h_num = subs(hessw_l, [w1, w2, w3, y1], [ws1(1), ws2(1), ws3(1), ys1(1)]);

H_red = double(Z' * h_num * Z)


