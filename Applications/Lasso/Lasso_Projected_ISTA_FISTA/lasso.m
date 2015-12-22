function [recoveredTimes, recoveredTraj,index, recoveredTimes2, recoveredTraj2, index2,recoveredTimes3, recoveredTraj3,index3] =  lasso(X, y, Xtest, ytest, lambda)
sz = size(X);
n = sz(2);
x0 = zeros(n,1);
ep = 1e-4;
eta0 =5e-6;
maxIter = 100;
sz = size(lambda);
minRegressionError = -1;
XY = X'*y;
for i = 1:sz(2)
    subGradf = @(beta) (lassoSubGrad(X, XY, beta, lambda(1,i)));
    [ traj,  k, times ] = subGradientDescent(n , x0, subGradf,  eta0, ep, maxIter);   
    recoveredBeta = traj(k,:)';
    regressionError = norm(Xtest*recoveredBeta - ytest);
    if(minRegressionError == -1 || regressionError < minRegressionError)
        minRegressionError = regressionError;
        recoveredTraj = traj;
        recoveredTimes = times;
        index = i;
    end
end
11111111
minRegressionError = -1;
gradf = @(beta) ( gradientLeastSquares(X, XY, beta));
for i = 1:sz(2)
    prox = @(beta) ( proxAbsoluteValue(beta, eta0, lambda(1,i)));
    [ traj1,  k1, times ] = acceleratedProximalGradientDescent(n , prox, gradf,   eta0, maxIter);
    recoveredBeta = traj1(k1,:)';
    regressionError = norm(Xtest*recoveredBeta - ytest);
    if(minRegressionError == -1 || regressionError < minRegressionError)
        minRegressionError = regressionError;
        recoveredTraj2 = traj1;
        recoveredTimes2 = times;
        index2 = i;
    end
end
minRegressionError = -1;
22222222
for i = 1:sz(2)
    prox = @(beta) ( proxAbsoluteValue(beta, eta0, lambda(1,i)));
    [ traj3,  k3, times ] = proximalGradientDescent(n , prox, gradf,   eta0, maxIter);
    recoveredBeta = traj3(k1,:)';
    regressionError = norm(Xtest*recoveredBeta - ytest);
    if(minRegressionError == -1 || regressionError < minRegressionError)
        minRegressionError = regressionError;
        recoveredTraj3 = traj3;
        recoveredTimes3 = times;
        index3 = i;
    end
end