function [ output ] = computeApproximateRank( traj, toler)
sz = size(traj);
n = sz(1);
m = sqrt(sz(2));
output = zeros(n,1);
for i = 1:n
    M = reshape(traj(i,:)', m, m);
    sv = svds(M, m);
    output(i, 1) = sum(sv > toler);
end
end

