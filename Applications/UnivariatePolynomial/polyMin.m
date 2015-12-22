function [ y ] = polyMin(coeff )
sz = size(coeff);
n = sz(1);
cvx_begin SDP
    variable gam;
    variable Q(n, n)  symmetric;
    maximize gam
         subject to
        coeff(1,1) == Q(1,1) + gam;
        for i = 2:n
            A = zeros(n,n);
            for j = 1:i
                A(j, i+1-j) = 1;
            end
            coeff(i,1) == trace(A*Q) ;
        end
        for i = 1:n-1
            A = zeros(n,n);
            for j = i+1:n
                A(j, n+i+1-j) = 1;
            end
            0 == trace(A*Q);
        end
        Q == semidefinite(n);
cvx_end
y = gam;
end

