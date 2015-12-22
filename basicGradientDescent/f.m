function [ y ] = f( x )
x1 = x(1);
x2 = x(2);
y = exp(x1-3*x2-0.1) + exp(x1+3*x2-0.1) + exp(-x1-0.1);
end

