function [ output ] = subGradPrimal( X, y, x, A )
output = X'*(X*x - y);
for i = 1:500
    ax = A(:, :, i)*x;
    output = output + A(:, :, i)'*ax/norm(ax);
end
end

