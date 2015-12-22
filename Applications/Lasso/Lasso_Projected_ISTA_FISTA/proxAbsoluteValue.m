function [ y ] = proxAbsoluteValue( x, t, lambda )
t_net = t*lambda;
sz = size(x);
n = sz(1);
y = zeros(n,1);
for i = 1:n
    if(abs(x(i,1)) < t_net)
        y(i,1) = 0;
    else
        y(i,1) = x(i,1) - sign(x(i,1))*t_net;
    end
end
end

