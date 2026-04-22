syms w1 w2 w3 y1


F = w1^4*w2^2 + w1^2*w3^4 + (1/2)*w1^2 + w1*w2 + w3;


c1 = w1 + w2 + w3 - 1;


L = F - y1*c1;


w_star = [1, 0, 0];


c1_ad = subs(c1, [w1 w2 w3], w_star)


gradc1 = gradient(c1, [w1 w2 w3])
gradl_w = gradient(L, [w1 w2 w3 y1])

gradl_w_star = subs(gradl_w, [w1 w2 w3], w_star)

disp('Multiplicador de Lagrange (y1):')
y1_star = solve(gradl_w_star == [0; 0; 0; 0], y1)


tussl_w = hessian(L, [w1 w2 w3]);


H_star = subs(tussl_w, [w1 w2 w3 y1], [w_star y1_star]);


Z = null(double(gradc1')); 


disp('Hessiana Reduzida:')
H_reduzida = Z' * double(H_star) * Z

eig(H_reduzida)