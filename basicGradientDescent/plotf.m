function [ fv ] = plotf( tr )
sz = size(tr);
n = sz(1);
fv = zeros(n,1);
for i = 1:1:n
    fv(i) = f(tr(i,:)')
end
plot(fv, '*-');
end

