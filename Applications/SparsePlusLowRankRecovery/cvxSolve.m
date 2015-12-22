function [ L_opt, S_opt ] = cvxSolve( n, lambda,M )
cvx_begin
variable LV(n,n);
variable SV(n,n);
minimize (norm_nuc(LV) + lambda*norm(SV, 1))
    subject to 
    LV + SV == M;
L_opt = LV;
S_opt = SV;
cvx_end


end

