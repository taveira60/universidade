function [f, gradf] = funHS6(w)
    % Calcula o valor numérico da função[cite: 1]
    f = (1 - w(1))^2;

    % Fornece o gradiente numérico para o fmincon
    if nargout > 1
        % Derivada de (1-w1)^2 em ordem a w1 é -2*(1-w1)
        % Derivada em ordem a w2 é 0
        gradf = [-2 * (1 - w(1)); 0];
    end
end