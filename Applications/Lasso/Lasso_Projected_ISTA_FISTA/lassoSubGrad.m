function [ output ] = lassoSubGrad( X, XY, beta, lambda )
output = gradientLeastSquares(X, XY, beta)+lambda*sign(beta);
end

