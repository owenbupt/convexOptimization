load robust_regression.mat;

sz = size(X);
n = sz(2);
betaOpt = getOptSolution(X, y, n);

%%%%%%%%%%%%% Projected-Sub-Gradient
x0 = ones(n,1)/n;
proj = @(beta)  (euclidenProjOnSimplex(beta, 1));
subGradf = @(beta) (subGradL1Error(X, beta, y));
R = sqrt(2);
L = sqrt(sz(1))*norm(X);
maxIter = 80000;
eta0 = R/(L*sqrt(maxIter));
[ trajPSGD,  k, times ] = subGradientDescent(n , x0, proj, subGradf, eta0,  maxIter);
normVals = zeros(maxIter, 1);
for i = 1:maxIter
     normVals(i, 1) = norm(trajPSGD(i,:) - betaOpt');
end
semilogy(times, normVals);
hold on;

%%%%%%%%%%% Mirror Descent
R = sqrt(log(n));
maX = -1;
for i = 1:n
    maX = max(maX, norm(X(:,i),1));
end
kappa = 1.0;
eta0 = sqrt(2*kappa/maxIter)*R/maX
proj = @(beta) (bregmanProjectionOnSimplex(beta));
mirrorUpdate = @(beta, eta) (mirrorUpdateNegativeEntropy(X, y, beta, eta));
[ trajMD,  k, times ] = mirrorDescent(n , x0, proj, mirrorUpdate, eta0,  maxIter);
for i = 1:maxIter
    normVals(i, 1) = norm(trajMD(i,:) - betaOpt');
end
semilogy(times, normVals);

xlabel('Time');
ylabel('Norm of Error');
legend( 'Projected Subgradient Descent', 'Mirror Descent');