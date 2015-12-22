function [dx] = computeDirCyclic(x, f, gr, iteration)
dx = gr(x);
if( mod(iteration, 2) == 1)
   dx(2,1) = 0;
else
    dx(1,1) = 0;
end
dx = -dx;
end

