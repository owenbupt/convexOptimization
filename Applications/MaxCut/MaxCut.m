function [  ] = MaxCut( W )
sz = size(W);
n = sz(1);
cvx_begin sdp
    variable X(n,n);
    maximize(0.25*trace(W*(1 - X)))
        subject to
        diag(X) == ones(n,1)
        X == semidefinite(n);
cvx_end

end

