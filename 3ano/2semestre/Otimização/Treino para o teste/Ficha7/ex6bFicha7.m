clc, clear;
syms w1 w2 y1 y2;



F = 1/2 * w1.^2 + w2.^2;

c1 = 2*w1 + w2 - 2;
c2 = 1 - w1 + w2;

L = F - y1*c1 - y2*c2;

w = solve([c1 == 0, c2 == 0], [w1 w2]);

w0 = [w.w1 w.w2]

gradc1 = gradient(c1, [w1 w2]);

gradc2 = gradient(c2, [w1 w2]);

gradL = gradient(L, [w1 w2]);

gradL_subs = subs(gradL, [w1 w2], [1 0]);

hessL = hessian(L,[w1 w2]);
hessL_subs = subs(hessL, [w1 w2], [1 0])


lambda = solve(gradL_subs == 0)

eig(hessL_subs)

% apenas c1 ativa

L1 = F - y1*c1;

gradL1 = gradient(L1, [w1 w2 y1]);

sol1 = solve(gradL1 == 0, [w1 w2 y1])

% apenas c2 ativa

L2 = F - y2*c2;

gradL2 = gradient(L2, [w1 w2 y2]);

sol2 = solve(gradL2 == 0, [w1 w2 y2])

% Como o multiplicador associado ao ponto (2/3, -1/3)
% é negativo, não é ponto KKT. 
% Portanto, não existem pontos KKT neste caso de estudo.

% nenhuma ativa

gradF = gradient(F, [w1, w2]);

sol3 = solve(gradF == 0, [w1, w2]);

ponto = [double(sol3.w1), double(sol3.w2)]

subs_c1_sol3 = double(subs(c1, [w1, w2], ponto))
subs_c2_sol3 = double(subs(c2, [w1, w2], ponto))


% como subs_c1_sol3 é menor que 0, o ponto (0,0) não é admissível