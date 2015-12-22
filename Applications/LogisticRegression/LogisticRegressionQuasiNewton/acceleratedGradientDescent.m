function [ traj, times, k ] = acceleratedGradientDescent(n , f, gradf, eta, Q  ep, maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
xs = zeros(n, 1);
ys = xs;
sqQ = Q^0.5;
ws = -(sqQ-1)/(sqQ+1)
wsp = 1 -ws;
n = norm(gradf(x));
k = 1;
tic
while( k <= maxIter)
    traj(k,:) = x';
    times(k+1, : ) = toc;
    ysp = xs - eta*gradf(xs);
    xs = wsp*ysp + ws*ys;
    ys = ysp;
    k = k+1;
end


end

