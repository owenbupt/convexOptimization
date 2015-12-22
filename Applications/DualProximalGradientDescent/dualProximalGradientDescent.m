function [ traj,  k, times ] = dualProximalGradientDescent(n ,  x0, lambda0, A, XTXI, XTY, prox,  eta,  maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter,1);
x = zeros(n,1);
lambda = zeros(size(lambda0));
lambda = lambda0;
x = x0;
k = 1;
tic;
while(  k <= maxIter)
    traj(k,:) = x';
    x = XTXI* (XTY - A'*lambda);
    lambda = lambda + eta*A*x;
    [lambda] = prox(eta, lambda);
    norm(x);
    times(k,1) = toc;
    k = k+1;    
end
k = k-1;
end

