clear;
clc
%defenir variaveis simbolidcas
syms w1 w2;

%definir funçao
F= 1/3.*w1^3 + 1/2.*w1^2+ 2*w1*w2 +1/2.*w2^2-w2+9;

%derivadas de F
grad1=diff(F,w1);
grad2=diff(F,w2);

vec=[0;0];

grad=[grad1;grad2];

hess=[diff(grad1,w1) diff(grad1,w2);
    diff(grad2,w1) diff(grad2,w2)];

fprintf('gradiente de F:\n'); disp(grad)
fprintf('matriz hessiana:\n'); disp(hess)

%calculo dos pontos estacionarios
S = solve(grad==vec,[w1,w2]);
ws1 = S.w1; ws2 = S.w2;

% Ensure column vectors
%ws1 = ws1(:); ws2 = ws2(:);

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
    end
    fprintf('determinantes das submatrizes principais\n')
    disp(d)
    Fval = double(subs(F, [w1 w2], [ws1(i) ws2(i)]));
    fprintf('valor de F no ponto:\n');
    disp(Fval);
end

[x1,x2]= meshgrid(-5:0.3:5, -5:0.3:5);
f = (x1.^3)/3 + (x1.^2)/2 + 2*x1.*x2+ (x2.^2)/2 - x2 +9;
surfc(x1,x2,f)