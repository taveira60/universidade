[w1,w2] = meshgrid(-2:0.01:2, -2:0.01:2)

f = (1-w1).^2+(1-w2).^2+(1/2)*(2*w2-w1.^2).^2;
figure; hold on; box on;

contour(w1, w2, f, 100, 'LineWidth', 1.2);

plot([-2 2], [0 0], 'k--', 'LineWidth', 1.2);
plot([0 0], [-2 2], 'k--', 'LineWidth', 1.2);
figure;
surf(w1, w2, f);
shading interp
options = optimset('Display','iter');
w0 = [1;1];
fun = @(w)(1-w(1))^2+(1-w(2))^2+(1/2)*(2*w(2)-w(1)^2)^2;
[wopt, fopt, exitflag, output] = fminunc(fun,w0,options)