function [f, gradf] = funHS6(w)
    % Cria as variáveis simbólicas (Requer Symbolic Math Toolbox)
    syms w1 w2
    
    % Define a fórmula baseada nos seus dados[cite: 1]
    fun = (1 - w1)^2; 
    
    % Calcula o gradiente automaticamente
    grad = gradient(fun, [w1, w2]);
    
    % TRANSFORMAÇÃO PARA VALORES NUMÉRICOS
    % O fmincon passa 'w' como um vetor numérico. 
    % Precisamos garantir que o 'subs' receba os valores corretamente.
    f = double(subs(fun, {w1, w2}, {w(1), w(2)}));
    
        % Converte o gradiente simbólico em um vetor double de coluna
        res_grad = subs(grad, {w1, w2}, {w(1), w(2)});
        gradf = double(res_grad);
end