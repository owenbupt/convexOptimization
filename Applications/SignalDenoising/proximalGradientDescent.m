function [ traj,  k, times ] = proximalGradientDescent(n , x0, prox, gradf, primal, dual,dualToPrimalMap,  eta, ep, maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter,1);
x = x0;
xp = dualToPrimalMap(x);
primalDualRatio = -primal(xp)/dual(x)
k = 1;
tic;
%% Primal Dual Ratio Approximates f/f_star
while( ~(primalDualRatio >= 1 && primalDualRatio <= 1+ep))
    traj(k,:) = x';
    x = x - eta*gradf(x);
    [x] = prox(x);
    xp = dualToPrimalMap(x);
    primalDualRatio = -primal(xp)/dual(x)
    times(k,1) = toc;
    k = k+1;    
end
k = k-1;
end

