function [ traj, times, k ] = acceleratedGradientDescent(n , gradf, eta, maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
xs = zeros(n, 1);
ys = xs;
lambdaS = 0;
k = 1;
tic
while( k <= maxIter)
    traj(k,:) = xs';
    times(k+1, : ) = toc;
    ysp = xs - eta*gradf(xs);
    lambdaSP = (1 + (1 + 4*lambdaS^2)^0.5)/2;
    gammaS = (1-lambdaS)/lambdaSP;
    xs = (1-gammaS)*ysp + gammaS*ys;
    ys = ysp;
    lambdaS = lambdaSP;
    k = k+1;
end
k = k - 1;
end

