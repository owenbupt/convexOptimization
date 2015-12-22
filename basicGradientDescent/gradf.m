function [ gr ] = gradf( x )
x1 = x(1);
x2 = x(2);
y = exp(x1-3*x2-0.1) + exp(x1+3*x2-0.1) + exp(-x1-0.1);
gr = zeros(2,1);
gr(1,1) = exp(x1-3*x2-0.1) + exp(x1+3*x2-0.1) - exp(-x1-0.1);
gr(2,1) = -3*exp(x1-3*x2-0.1) + 3*exp(x1+3*x2-0.1);
end

