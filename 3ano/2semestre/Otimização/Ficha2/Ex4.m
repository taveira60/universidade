[w1,w2] = meshgrid(-5:0.01:5, -5:0.01:5)

f = w1.^3+2*w1.*w2.^2-w2.^3-20*w1;
figure; hold on; box on;

contour(w1, w2, f, 100, 'LineWidth', 1.2);

plot([-5 5], [0 0], 'k--', 'LineWidth', 1.2);
plot([0 0], [-5 5], 'k--', 'LineWidth', 1.2);

plot(2.580,0,'ko','MarkerFaceColor','k','MarkerSize',5);
plot(-2.580,0,'ko','MarkerFaceColor','k','MarkerSize',5);

figure;
surf(w1,w2,f);

options = optimoptions('fmincon', 'Display', 'Iter', 'Algorithm', 'sqp');

options.Display = 'Iter';

w0 = [0.1;0.1];

lb=[0;0];
ub=[];

nonlcon = @(w) deal([w(1)^2 + w(2)^2 - 1; -w(1) + 3*w(2) - 0.5], []);

f = @(w) (w(1).^3) + 2.*w(1).*(w(2).^2) - (w(2).^3) - 20.*w(1)


[wopt, fopt, exitflag, output, lambda] = fmincon(f, w0, [], [], [], [], lb, ub, nonlcon, options);