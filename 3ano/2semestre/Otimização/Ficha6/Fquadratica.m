function [f, gradf] = Fquadratica(w, a)
    a=20 ;  
    f = (w(1)^2 + a * w(2)^2) / 2;
    gradf = [w(1); a * w(2)];
end