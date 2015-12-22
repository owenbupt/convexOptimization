function [ traj, times, k ] = gradientDescent(n , f, gradf,   ep, maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
funcCalls = zeros(maxIter, 1);
x = zeros(n, 1);
n = norm(gradf(x));
k = 1;
alpha = 0.45;
etaMultiplier = 0.9;
tic
while( n^2 > ep && k < maxIter)
    traj(k,:) = x';
    times(k+1, : ) = toc;
    [eta, funcCalls(k+1)] =   blts( x, 1.0, alpha, etaMultiplier, f, gradf, -gradf(x) );
    x = x - eta*gradf(x);
    n = norm(gradf(x));
    k = k+1;
end


end

