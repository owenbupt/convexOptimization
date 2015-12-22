function [dx] = computeDirGreedy(x, f, gr, iteration)
dx = gr(x);
if( abs(dx(1,1)) >= abs(dx(2,1)))
   dx(2,1) = 0;
else
    dx(1,1) = 0;
end
dx = -dx;
end

