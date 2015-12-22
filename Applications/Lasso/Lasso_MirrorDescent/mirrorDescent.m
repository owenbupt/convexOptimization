function [ traj,  k, times ] = mirrorDescent(n , x0, proj, mirrorUpdate, eta0,  maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
x = x0;
n = norm(gradf(x));
k = 1;
eta = eta0;
tic;
while(  k <= maxIter)
    traj(k,:) = x';
    y = mirrorUpdate(x, eta);
    x = proj(y);
    times(k,1) = toc;
    k = k+1;
end
k = k-1;
end