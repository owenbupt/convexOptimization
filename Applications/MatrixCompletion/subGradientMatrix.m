function [ output ] = subGradientMatrix( XV, m, n )
X = reshape(XV, m, n);
[U,S, V] = svd(X);
outputM = U*V';
output = outputM(:);
end

