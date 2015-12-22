function [ traj, times, k ] = SVRG(n , sizeOfData, fullGrad, singleGrad, eta, maxIter, updateFrequency)
traj = zeros(maxIter, n);
times = zeros(maxIter, 1);
x = rand(n, 1);
k = 1;
tic
while(  k <= maxIter)
    traj(k,:) = x';
    times(k+1, : ) = toc;
    fullGradVal = fullGrad(x)/sizeOfData;
    x_init = x;
    for j = 1:updateFrequency
        randomDataPoint = randi([1, sizeOfData]);
        x = x - eta*(singleGrad(x, randomDataPoint) - singleGrad(x_init, randomDataPoint) + fullGradVal);
    end
    k = k+1;
end
k = k - 1;
end

