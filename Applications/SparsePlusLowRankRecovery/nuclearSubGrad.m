function [ output ] = nuclearSubGrad( X )
[U,S, V] = svd(X);
output = U*V';
end

