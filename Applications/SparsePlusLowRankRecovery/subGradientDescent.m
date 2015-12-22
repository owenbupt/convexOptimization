function [ lTraj, sTraj,  k, times ] = subGradientDescent(n , L0, S0, M, lambda, eta0,  maxIter)
lTraj = zeros(maxIter, n*n);
sTraj = zeros(maxIter, n*n);
times = zeros(maxIter, 1);
L = zeros(n, n);
S = zeros(n, n);
L = L0;
S = S0;
k = 1;
eta = eta0;
tic;
while(  k <= maxIter)
    lTraj(k,:) = L(:);
    sTraj(k,:) = S(:);
    L = L - eta*nuclearSubGrad(L);
    S = S - eta*lambda*oneNormSubGrad(S);
    LOld = L;
    SOld = S;
    L = (M + LOld - SOld)/2;
    S = (M + SOld - LOld)/2;
    times(k,1) = toc;
    k = k+1;
end
k = k-1;
end