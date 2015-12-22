load matrix_completion.mat;

MV = M(:);
xM0 = M.*O;
x0 = rand(10000, 1);
maxIter = 1000;
eta0 = 1.0;
[m,n] = size(M);
proj = @(X) (projectOnSamples(X, m, n, xM0, ones(m,n) - O));
subGradf = @(X) (subGradientMatrix(X, m, n));

%%%%%%%%%%%%%%% eta = 1/k case
getEta = @(i) (getEtaInv(eta0, i));
[n,m] = size(x0);
[ trajInv,  k, times ] = subGradientDescent(n , x0, proj, subGradf, getEta,  maxIter);
error = zeros(maxIter, 1);
for j = 1:maxIter
    error(j,1) = (1e-4)*norm(MV - trajInv(j,:)')^2;
end
figure(1);
semilogy(times, error);
hold on;


%%%%%%%%%% eta = 1/sqrt(k) case
getEta = @(i) (getEtaSqInv(eta0, i));
[ trajSqInv,  k, times ] = subGradientDescent(n , x0, proj, subGradf, getEta,  maxIter);
for j = 1:maxIter
    error(j,1) = (1e-4)*norm(MV - trajSqInv(j,:)')^2;
end
semilogy(times, error);
xlabel('k');
ylabel('Error');
legend('Subgradient Descent with \eta = 1/k', 'Subgradient Descent with \eta = 1/k^{0.5}');

approxRankInv = computeApproximateRank(trajInv, 1e-1);
approxRankSqInv = computeApproximateRank(trajSqInv, 1e-1);
figure(2);
plot(approxRankInv);
hold on;
plot(approxRankSqInv);
xlabel('Iterations');
ylabel('Approximate Rank');
legend('Subgradient Descent with \eta = 1/k', 'Subgradient Descent with \eta = 1/k^{0.5}');