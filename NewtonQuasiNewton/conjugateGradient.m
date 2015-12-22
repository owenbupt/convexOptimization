function [ traj, times, k ] = conjugateGradient(n , f, gradf,   ep, maxIter)


traj = zeros(maxIter,n);
times = zeros(maxIter, 1);
funcCalls = zeros(maxIter, 1);

k = 0;
x = zeros(n,1);
r = -gradf(x);
p = r;

n = norm(p);
alpha = 0.45;
etaMultiplier = 0.9;
tic
while (n^2 >= ep && k < maxIter)
    traj(k+1, :) = x;
    times(k+1, : ) = toc;
    [eta, funcCalls(k+1)] =   blts( x, 1.0, alpha, etaMultiplier, f, gradf, p );
    x = x + eta*p;
    rold = r;
    r = -gradf(x);
    beta = max(r'*(r-rold)/(rold'*rold), 0);
    pold = p;
    p = r + beta*pold;
    k = k+1;
    n = norm(p);
end
xlabel('Iterations');
ylabel('Function Calls in BLTS');
plot(funcCalls);
legend('Non Linear Conjugate Gradient Descent');
end

