function [ etaf ] = blts( x, eta0, alpha, beta, f, gr, dx )
eta = eta0;
while(f(x+eta*dx) > f(x) - alpha*eta*abs(gr(x)'*dx))
    eta = beta * eta;
end
etaf = eta;
end

