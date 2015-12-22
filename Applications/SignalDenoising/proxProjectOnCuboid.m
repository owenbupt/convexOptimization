function [ y ] = proxProjectOnCuboid( x )
sz = size(x);
y = zeros(sz(1), 1);
for i = 1:sz(1)
    if( abs(x(i,1)) > 1)
        y(i,1) = x(i,1)/abs(x(i,1));
    else
        y(i,1) = x(i,1);
    end
end
end

