function [ output ] = lassoFunc( X,y,beta, lambda )
output = norm(X*beta - y)^2 + lambda*norm(beta, 1);
end

