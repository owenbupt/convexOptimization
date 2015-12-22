function [ traj,  k, times ] = subGradientDescent(n , x0, proj, subGradf, getEta,  maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
x = x0;
k = 1;
tic;
while(  k <= maxIter)
    eta = getEta(k);
    traj(k,:) = x';
    y = x - eta*subGradf(x);
    x = proj(y);
    times(k,1) = toc;
    k = k+1;
end
k = k-1;
end