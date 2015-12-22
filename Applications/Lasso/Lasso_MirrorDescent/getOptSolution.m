function [ opt ] = getOptSolution( X, y , n)
cvx_begin
    variable bet(n);
    minimize (norm( X*bet - y, 1))
    subject to
        bet >= 0;
        sum_largest(bet, n) == 1;    
cvx_end
opt = bet;
end

