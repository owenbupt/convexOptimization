function [ traj, times, k ] = stochasticGradientDescent(n , sizeOfData, gradf, eta0, maxIter)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
x = rand(n, 1);
k = 1;
tic
while(  k <= maxIter)
    traj(k,:) = x';
    times(k+1, : ) = toc;
    randomDataPoint = randi([1, sizeOfData]);
    eta = eta0/(1 + k);
    x = x - eta*gradf(x, randomDataPoint);
    k = k+1;
end
k = k - 1;
end

