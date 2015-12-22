function [ t ] = els( A, x,dx )

t = (b'*dx - 0.5*( dx'*A*x + x'*A*dx))/dx'*A*dx

end

