n = 1000;
x0 = rand(n, 1);
m = 5000;
lambda0 = zeros(m, 1);
AM = rand(5000, 1000);
for i = 0:499
    AM((10*i + 1):10*(i+1), :) = A(:, :, i + 1);
end
XTXI = inv(X'*X);
XTY = X'*y;
eta = 1/norm(X)^2;
maxIter = 100;
indices = zeros(501, 1);
indices(1,1) = 0;
vec  = 1:500;
indices(2:501, :) = 10*vec';
prox = @(et, lamb) ( dualProx(et, lamb, indices));
[ traj,  k, times ] = dualProximalGradientDescent(n ,  x0, lambda0, AM, XTXI, XTY, prox,  eta,  maxIter);
errorDPGD = zeros(maxIter, 1);
for i = 1:maxIter
    norm(traj(i, :)')
    errorDPGD(i,:) = computeFunction(X, y, traj(i, :)', A);
end    
semilogy(times, errorDPGD);
hold on;


subGradf = @(x) (subGradPrimal(X, y, x, A));
[ traj,  k, times ] = subGradientDescent(n , x0, subGradf, eta,  maxIter);
errorPSGD = zeros(maxIter, 1);
for i = 1:maxIter
    norm(traj(i, :)')
    errorPSGD(i,:) = computeFunction(X, y, traj(i, :)', A);
end    
semilogy(times, errorPSGD);
hold on;

[ traj, k, times ] = fista(n , lambda0, prox, XTXI, XTY,AM, eta, maxIter);
errorDualFista = zeros(maxIter, 1);
for i = 1:maxIter
    norm(traj(i, :)')
    errorDualFista(i,:) = computeFunction(X, y, traj(i, :)', A);
end    
semilogy(times, errorDualFista);

xlabel('Iterations');
ylabel('Function Value');
legend('Dual Proximal Gradient', 'Primal Subgradient', 'Dual Fista');