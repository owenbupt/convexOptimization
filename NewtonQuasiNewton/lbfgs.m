function [ traj, times, k ] = lbfgs( n, m, f, gradf, tol,maxIter)
k = 1;

x = zeros(n,1);
traj = zeros(maxIter,n);
times = zeros(maxIter, 1);
funcCalls = zeros(maxIter, 1);
s  = zeros(m, n);
v = zeros(m, n);

alpha = 0.45;
beta = 0.9;
tic;
while( n^2 > tol && k < maxIter)
    traj(k, :) = x;
    times(k, :) = toc;
    
    dx = lbfgsUpdate(x, gradf, v, s, k, m);
    [t, funcCalls(k)] = blts( x, 1.0, alpha, beta, f, gradf, dx );
    s(mod(k,m) + 1, :)  = t*dx';
    
    grOld = gradf(x);
    x = x + t*dx;
    grNew = gradf(x);
    v(mod(k,m)+1, :) = (grNew - grOld)';
    
    k = k + 1;
    n = norm(gradf(x));
end
xlabel('Iterations');
ylabel('Function Calls in BLTS');
plot(funcCalls);
legend('LBFGS');
end

