function [ traj,  times, k ] = conditionalGradientDescent(n , linearMinimizer, gradf, x0, maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
x = x0;
k = 1;
tic
while( k <= maxIter)
    size(traj)
    traj(k,:) = x';
    times(k, : ) = toc;
    gammaK = 2/(k+1);
    y = linearMinimizer(gradf(x));
    x = (1-gammaK)*x + gammaK*y;
    k = k+1;
end
k = k - 1;
end
