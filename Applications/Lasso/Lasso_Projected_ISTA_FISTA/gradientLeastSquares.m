function [ output ] = gradientLeastSquares( X, XY, beta )
output = 2*X'*(X*beta) - 2*XY;
end

