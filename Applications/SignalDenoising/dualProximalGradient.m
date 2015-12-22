%load tv_denoising.mat;
sz = size(x_hat);
n = sz(1);
B = zeros(n-1, n);
mu = 0.5;
for i = 1:(n-1)
    B(i,i) = -mu;
    B(i, i+1) = mu;
end
BBT = B*B';
BXH = B*x_hat;

projectOnUnitCube = @(x) (proxProjectOnCuboid(x));
gradf = @(x) (dualGrad(x, BBT, BXH));
primal = @(x) (primalFunction( x, x_hat, mu, B ));
dual = @(x) (dualFunc( x, BBT, BXH ));
dualToPrimalMap = @(x) (x_hat - B'*x);


eta = 1.0/norm(B*B');
ep = 1e-4;
maxIter = 10;
x0 = zeros(n-1,1);
tic
[traj, k] = proximalGradientDescent(n-1 , x0, projectOnUnitCube, gradf, primal, dual, dualToPrimalMap,  eta, ep, maxIter);
toc

x_denoised = x_hat - B'*traj(k-1,:)';


% hold on;
% xlabel('n');
% ylabel('x');
% plot(x_hat);
% legend('Signal Before Denoising');
% hold off;
hold on;
xlabel('n');
ylabel('x');
plot(x_denoised);
legend('Signal After Denoising with \mu = 0.05');