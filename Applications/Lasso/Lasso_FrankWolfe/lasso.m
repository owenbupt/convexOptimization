function [ recoveredTraj,recoveredTimes,index] =  lasso(X, y, r )
sz = size(X);
n = sz(2);
x0 = zeros(n,1);
%% Inititialie to one of the vertices
x0(1,1) = r;
maxIter = 100;
XY = X'*y;
gradf = @(beta) ( gradientLeastSquares(X, XY, beta));
linearMinimizer = @(gradVal) (minimizeOnSimplex(gradVal, r));
n
[ recoveredTraj,recoveredTimes,index] = conditionalGradientDescent(n , linearMinimizer, gradf, x0, maxIter);
