function [ output ] = computeSparsity( traj )
sz = size(traj);
n = sz(1);
output = zeros(n,1);
for i = 1:n
    output(i, 1) = nnz(traj(i,:));
end
end

