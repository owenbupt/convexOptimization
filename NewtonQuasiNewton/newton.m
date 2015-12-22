function [ i, x, error ] = newton( x0, maxIter, tol, gf, hf )
error = zeros(maxIter + 1,1);
x = x0;
error(1,1) = log(norm(x)^2);
i = 1;
while (i < maxIter && norm(gf(x)) > tol)
    x = x - hf(x) \ gf(x);
    error(i+1, 1) = log(norm(x)^2);
    i = i + 1;
end
end

