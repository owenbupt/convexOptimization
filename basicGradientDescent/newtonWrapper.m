x0 = ones(5,1);
tol = 1e-10;
maxIter = 100;

m = 0.0;
gf = @(x) (cubicGrad(x, m));
hf = @(x) (cubicHessian(x, m));
[ k1, x, error1 ] = newton( x0, maxIter, tol, gf, hf );

m = 0.0001;
gf = @(x) (cubicGrad(x, m));
hf = @(x) (cubicHessian(x, m));
[ k2, x, error2 ] = newton( x0, maxIter, tol, gf, hf );

m = 0.001;
gf = @(x) (cubicGrad(x, m));
hf = @(x) (cubicHessian(x, m));
[ k3, x, error3 ] = newton( x0, maxIter, tol, gf, hf );

m = 0.1;
gf = @(x) (cubicGrad(x, m));
hf = @(x) (cubicHessian(x, m));
[ k4, x, error4 ] = newton( x0, maxIter, tol, gf, hf );

hold on;
xlabel('Iteration k');
ylabel('Error');
plot(error1(1:k1,:));
plot(error2(1:k2,:));
plot(error3(1:k3,:));
plot(error4(1:k4,:));
legend('m = 0.0', 'm = 0.0001','m = 0.001', 'm = 0.1');