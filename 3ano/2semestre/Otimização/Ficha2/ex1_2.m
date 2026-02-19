[w1,w2] = meshgrid(-5:0.01:5, -5:0.01:5)

f = w1.^3+2*w1.*w2.^2-w2.^3-20*w1;
figure; hold on; box on;

contour(w1, w2, f, 100, 'LineWidth', 1.2);

plot([-5 5], [0 0], 'k--', 'LineWidth', 1.2);
plot([0 0], [-5 5], 'k--', 'LineWidth', 1.2);

plot(2.580,0,'ko','MarkerFaceColor','k','MarkerSize',5);
plot(-2.580,0,'ko','MarkerFaceColor','k','MarkerSize',5);
options = optimset('Display','iter');
w0 = [-1;-1];
fun = @(w)w(1)^3 + 2*w(1)*w(2).^2 - w(2)^3 - 20*w(1);
[wopt, fopt, exitflag, output] = fminunc(fun,w0,options)