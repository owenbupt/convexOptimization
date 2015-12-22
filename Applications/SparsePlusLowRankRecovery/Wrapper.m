n = 600;
r = 5;
L = randn(n, r)*randn(r,n);
rmax = round(n/8);
S = randi([-rmax,rmax], n, n);
S(abs(S) ~= 1) = 0;
M = L + S;
lambda = 1.0;

% CVX
% [ L_opt, S_opt ] = cvxSolve( n, lambda,M );
% cvxErrorL = norm(L - L_opt);
% cvxErrorS = norm(S - S_opt);

%Projected Sub Gradient Descent
eta0 = 0.1;
maxIter = 100;
L0 = rand(n, n);
S0 = rand(n, n);
[ lTraj, sTraj,  k, times ] = subGradientDescent(n , L0, S0, M, lambda, eta0,  maxIter);

error = zeros(maxIter, 1);
for i=1:maxIter
L_current = reshape(lTraj(i, :), n, n);
S_current = reshape(sTraj(i, :), n, n);
projectedSubGradErrorL = norm(L - L_current, 'fro')/(n*n);
projectedSubGradErrorS = norm(S - S_current, 'fro')/(n*n);
error(i, 1) = projectedSubGradErrorL + projectedSubGradErrorS;
end

semilogy(error);
hold on;
xlabel('Iteration');
ylabel('Error');
legend(strcat('Projected Subgradient descent for n =', num2str(n)));
times(maxIter, 1);