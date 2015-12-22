function [ output ] = subGradL1Error( X, beta, y )
output = X'*sign(X*beta - y);
end

