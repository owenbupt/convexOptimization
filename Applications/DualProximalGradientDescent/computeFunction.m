function [ output ] = computeFunction( X, y, x, A )
output = 0.5*norm(X*x - y)^2;
for i=1:500
    output = output + norm( A(:,:,i)*x);
end
end

