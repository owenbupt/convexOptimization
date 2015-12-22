function [ tr ] = steepestDescent( x0,maxIter, f, gradf, computeDir, computeStepSize  )
sz = size(x0);
n = sz(1);
tr = zeros(maxIter, n);

tr(1,:) = x0';
x = x0;
iterations = 1;

while iterations <= maxIter
    dx = computeDir(x, f, gradf, iterations);
    eta = computeStepSize(x, f, gradf,dx, iterations);
    x = x + eta*dx;
    iterations = iterations + 1;
    tr(iterations, :) = x';
end
end

