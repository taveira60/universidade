clear;
clc
%defenir variaveis simbolidcas
syms w1 w2;

F = 8.*w1.^2 + 3.*w1.*w2 + 7.*w2.^2 - 25.*w1 + 31.*w2 - 29;

grad=gradient(F,[w1,w2]);
hess=hessian(F,[w1,w2]);

vec=[0;0]

fprintf('gradiente de F:\n'); disp(grad)
fprintf('matriz hessiana:\n'); disp(hess)

S = solve(grad==vec,[w1,w2]);
ws1 = S.w1; ws2 = S.w2;

[n nc] = size(ws1) %existem s pontos estacionarios
[dim, dim1] = size(hess)

for i =1:n
    hessxs = double(subs(hess, [w1 w2], [ws1(i) ws2(i)]));
    fprintf('hessiana de F no ponto\n')
    disp(double([ws1(i), ws2(i)])); disp(hessxs)
    %calculo determinantes
    d = zeros(1,dim);
    for j =1:dim
        A= hessxs(1:j, 1:j);
        d(j) = det(A);

        if d(1) > 0
        fprintf('Classificação: MÍNIMO LOCAL\n');
        elseif d(1) < 0
        fprintf('Classificação: MÁXIMO LOCAL\n');
        else
        fprintf('Classificação: INCONCLUSIVO\n');
        end

    end
    fprintf('determinantes das submatrizes principais\n')
    disp(d)
    Fval = double(subs(F, [w1 w2], [ws1(i) ws2(i)]));
    fprintf('valor de F no ponto:\n');
    disp(Fval);
end

[w1,w2]= meshgrid(-5:0.3:5, -5:0.3:5);
f = 8.*w1.^2 + 3.*w1.*w2 + 7.*w2.^2 - 25.*w1 + 31.*w2 - 29;
surfc(w1,w2,f)