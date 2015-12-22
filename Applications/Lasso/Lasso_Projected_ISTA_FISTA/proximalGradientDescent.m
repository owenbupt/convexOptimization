function [ traj,  k, times ] = proximalGradientDescent(n ,  prox, gradf,   eta,  maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter,1);
x = zeros(n,1);
k = 1;
tic;
while(  k <= maxIter)
    traj(k,:) = x';
    x = x - eta*gradf(x);
    [x] = prox(x);
    times(k,1) = toc;
    k = k+1;    
end
k = k-1;
end

