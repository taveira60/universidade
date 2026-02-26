clear;
clc

syms w1 w2;

F=4.*w1.^2 - 4.*w1.*w2 + w2.^2

grad=gradient(F,[w1,w2])
hess=hessian(F,[w1,w2])

vecc=[0,0]

fprintf('gradiente de F:\n'); disp(grad)
fprintf('matriz hessiana:\n'); disp(hess)

[ws1,ws2]=solve(grad==vecc,[w1,w2]);
fprintf("pontos estacionarios\n")
disp(double([ws1 ws2]))

[n,nc]=size(ws1)
[dim,dim1]=size(hess)

for i=1:n
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

[x1,x2]= meshgrid(-5:0.1:5, -5:0.1:5);
f=4.*x1.^2 - 4.*x1.*x2 + x2.^2
%f2=x2-2.*x1
surfc(x1,x2,f)
hold on
t = -5:0.1:5;
x1r = t;
x2r = 2*t;

% valor da função f ao longo da reta
fr = 4.*x1r.^2 - 3.*x1r.*x2r + x2r.^2;

plot3(x1r,x2r,fr,'r','LineWidth',3)