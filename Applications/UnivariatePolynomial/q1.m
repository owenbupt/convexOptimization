f = @(x) (fourthDegreePoly(x));
g = @(x) (fourthDegreePolyDer(x));
[ traj, times, k ] = gradientDescent(1 , 0.8, f, g,   1e-10, 50);
x_1 = -3:0.05:3;
hold on;
xlabel('x');
ylabel('f(x)');
plot(x_1, fourthDegreePoly(x_1), traj(1:k-1,1), fourthDegreePoly(traj(1:k-1,1)), '*r-');
legend('f(x) = 3x^4 + 4x^3-12x^2', 'Gradient Descent Path from x=0.8');

coeff = [ 0 0 -12 4 3]
y = polyMin(coeff');