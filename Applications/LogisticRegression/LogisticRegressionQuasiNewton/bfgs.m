function [ traj, times, k] = bfgs( n, f, gradf, tol, maxIter)
H = speye(n);
I = speye(n);
k = 0;
x = zeros(n,1);
traj = zeros(maxIter,n);
times = zeros(maxIter, 1);
funcCalls = zeros(maxIter, 1);

alpha = 0.45;
beta = 0.9;

tic
while( (n^2 > tol) && (k < maxIter))
        times(k+1) = toc;
        traj(k+1,:) = x';
        grOld = gradf(x);
        dx = -H*grOld;
        [t, funcCalls(k+1)] = blts( x, 1.0, alpha, beta, f, gradf, dx );
        x = x + t*dx;
        s = t*dx;
        grNew = gradf(x);
        y = grNew - grOld;
        p = 1/ (y'*s);
        H = (I - p*s*y')*H*(I - p*y*s') + p*s*s';
        k = k + 1;
%        n = norm(gradf(x))
end
end

