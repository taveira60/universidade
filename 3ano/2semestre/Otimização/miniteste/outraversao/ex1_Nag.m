clear, clc, close all;

% Parâmetros do Problema
a = 20;
w0 = [20; 1];
epsilon = 1e-4;
Kmax = 200;
beta = 0.9; % Parâmetro de momento (inércia)
etas = [0.15, 0.01, 0.1, 0.05, 0.0952];
eta_fixo = 0.01; % Pode testar os outros valores da lista [etas]

% Inicialização
w = w0;
w_old = w0; % w(k-1)
tabela = [];

% Algoritmo Nesterov Accelerated Gradient (NAG)
for k = 0:Kmax
    % 1. Calcular f e gradf no ponto atual (apenas para registo e critério de paragem)
    [f, gradf] = Fquadratica(w);
    norm_grad_inf = max(abs(gradf));
    tabela = [tabela; k, w(1), w(2), norm_grad_inf, eta_fixo, f];
    
    % Critério de paragem
    if norm(gradf) <= epsilon
        fprintf('Convergência NAG em %d iterações (eta = %f)\n', k, eta_fixo);
        break;
    end
    
    % 2. Atualização NAG
    if k == 0
        % No primeiro passo, comporta-se como MDM simples
        w_next = w - eta_fixo * gradf;
    else
        % Ponto de antecipação (look-ahead): y = w(k) + beta * (w(k) - w(k-1))
        y = w + beta * (w - w_old);
        
        % Gradiente no ponto antecipado
        [~, grady] = Fquadratica(y);
        
        % Atualização final: w(k+1) = y - eta * grad(y)
        w_next = y - eta_fixo * grady;
    end
    
    % Atualizar variáveis para o próximo ciclo
    w_old = w;
    w = w_next;
end

% Resultados
if ~isempty(tabela)
    disp(array2table(tabela, 'VariableNames', {'k', 'w1', 'w2', 'grad_inf', 'eta', 'Fw'}));
end

% Gráfico de Contorno e Trajetória
[W1, W2] = meshgrid(-2:1:22, -4:0.5:4);
Z = (W1.^2 + a * W2.^2) / 2;
figure; contour(W1, W2, Z, 30); hold on;
plot(tabela(:,2), tabela(:,3), 'm.-', 'LineWidth', 1.2);
plot(w0(1), w0(2), 'go', 'MarkerFaceColor', 'g');
title(['NAG: \eta = ', num2str(eta_fixo), ' | \beta = ', num2str(beta)]);
xlabel('w1'); ylabel('w2'); colorbar; grid on;