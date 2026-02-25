syms w1 w2;

F = (w1^3)/3 + (w1^2)/2 + 2*w1*w2+ (w2^2)/2-w2 +9
%calcular vetor gradiente (derivadas)
grad1 = diff(F,w1);
grad2 = diff(F,w2);
vec0 = [0;0];
grad=gradient(F,[w1,w2]);
hess=hessian(F,[w1,w2]);
fprintf('grandiente\n'); disp(grad)
disp(hess)
%calcular pontos estacionarios
[ws1,ws2] = solve(grad ==vec0, [w1,w2]);
fprintf("pontos estacionarios\n")
disp(double([ws1 ws2]))
[n nc] = size(ws1) %existem s pontos estacionarios
[dim, dim1] = size(hess)

for i =1:n
    hessxs = subs(hess, [w1 w2], [double(ws1(i)) double(ws2(i))]);
    fprintf("hessiana de F no ponto\n")
    disp(double([ws1(i), ws2(i)])); disp(hessxs)
    %calculo determinantes
    for j =1:dim
        A= hessxs(1:j, 1:j);
        d(j) = det(A)
    end
    fprintf("determinantes das submsatrizes principais\n")
    disp(d)
    Fval = subs(F, [w1 w2], [double(ws1(i)) double(ws2(i))]);
    fprintf("miimo max\n");
    disp(double(Fval));
    
end
[x1,x2]= meshgrid(-500:30:500, -500:30:500);
f = (x1.^3)/3 + (x1.^2)/2 + 2*x1.*x2+ (x2.^2)/2-x2 +9;
surfc(x1,x2,f)
   