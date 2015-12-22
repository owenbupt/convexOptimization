function [ output ] = primalFunction( x, x_h, mu, B )
output = 0.5*norm(x-x_h)^2 + norm(B*x, 1);
end

