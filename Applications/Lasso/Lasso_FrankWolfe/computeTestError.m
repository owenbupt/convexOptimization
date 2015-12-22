function [ output ] = computeTestError( X, y, traj )
sz = size(traj);
n = sz(1);
output = zeros(n,1);
for i = 1:n
    output(i, 1) = norm(X*traj(i,:)' - y);
end
end

