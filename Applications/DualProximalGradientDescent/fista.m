function [ traj, k, times ] = fista(n , lambda0, prox,XTXI, XTY, A,  eta, maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
x = rand(n, 1);
lambda = lambda0;
lambdaOld = lambda0;
l = 0;
k = 1;
tic
while( k <= maxIter)
    traj(k,:) = x';
    times(k, : ) = toc;
    
    x = XTXI* (XTY - A'*lambda);
    lambda = lambda + eta*A*x;
    [lambdaProj] = prox(eta, lambda);
    
    lp = (1 + (1 + 4*l^2)^0.5)/2;
    gammaS = (1-l)/lp;
    lambda = (1-gammaS)*lambdaProj + gammaS*lambdaOld;
    
    lambdaOld = lambdaProj;
    l = lp;
    k = k+1;
end
k = k - 1;
end

