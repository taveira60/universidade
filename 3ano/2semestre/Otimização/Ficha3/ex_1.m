clear; clc;

% 1. Definir variável simbólica
syms w;

% 2. Definir a função
F = 15 - 12*w - 25*w^2 + 2*w^3;

% 3. Calcular "Gradiente" e "Hessiana"
% Nota: Para uma variável, o gradiente é a 1ª derivada e a hessiana é a 2ª.
grad = diff(F, w);
hess = diff(grad, w);

fprintf('Gradiente de F (F''):\n'); disp(grad);
fprintf('Matriz Hessiana de F (F''''):\n'); disp(hess);

% 4. Encontrar pontos estacionários (onde grad = 0)
ws = solve(grad == 0, w);
n = length(ws); % Define o número de pontos para o loop
dim = size(hess, 1);

% 5. Analisar cada ponto crítico
for i = 1:n
    % Substituir o valor do ponto na Hessiana
    ponto_atual = double(ws(i));
    hessxs = double(subs(hess, w, ponto_atual));
    
    fprintf('\n--------------------------------------\n');
    fprintf('Hessiana de F no ponto w = %.4f\n', ponto_atual);
    disp(hessxs);
    
    % 6. Cálculo dos determinantes das submatrizes principais
    % Para dimensão 1, só existe um determinante (o próprio valor)
    d = zeros(1, dim);
    for j = 1:dim
        A = hessxs(1:j, 1:j);
        d(j) = det(A);
    end
    
    fprintf('Determinantes das submatrizes principais:\n');
    disp(d);
    
    % 7. Classificação
    if d(1) > 0
        fprintf('Classificação: MÍNIMO LOCAL\n');
    elseif d(1) < 0
        fprintf('Classificação: MÁXIMO LOCAL\n');
    else
        fprintf('Classificação: INCONCLUSIVO\n');
    end
    
    % Valor da função no ponto
    Fval = double(subs(F, w, ponto_atual));
    fprintf('Valor de F(w) no ponto: %.4f\n', Fval);
end

% 8. Visualização (Gráfico 2D, já que só temos a variável 'w')
fplot(F, [-10, 20], 'LineWidth', 2);
grid on;
title('Gráfico da função F(w)');
xlabel('w'); ylabel('F(w)');
hold on;
plot(double(ws), double(subs(F, w, ws)), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'r');