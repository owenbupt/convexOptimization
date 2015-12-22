function [ traj,  k, times ] = subGradientDescent(n , x0, subGradf, eta0, maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
x = x0;
n = norm(gradf(x));
k = 1;
eta = eta0;
tic;
while(  k <= maxIter)
    traj(k,:) = x';
    x = x - eta*subGradf(x);
    times(k,1) = toc;
    k = k+1;
end
k = k-1;
end