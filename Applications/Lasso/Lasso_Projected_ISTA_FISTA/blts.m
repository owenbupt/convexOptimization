function [ etaf, funcCalls ] = blts( x, eta0, alpha, beta, f, gr, dx )
eta = eta0;
grx = gr(x);
iterations = 0;
while(f(x+eta*dx) > f(x) - alpha*eta*abs(grx'*dx))
    eta = beta * eta;
    iterations = iterations+ 1;
end
funcCalls = iterations;
etaf = eta;
end

