function [f, gradf] = funHS6(w)
    % Calcula o valor numérico da função[cite: 1]
    f = (1 - w(1))^2;

    % Fornece o gradiente numérico para o fmincon

    gradf = [-2 * (1 - w(1)); 0];
end