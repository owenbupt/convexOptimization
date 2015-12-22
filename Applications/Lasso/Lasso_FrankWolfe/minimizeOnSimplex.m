function [ y ] = minimizeOnSimplex( gradVector, r )
[ maxAbsVal, maxAbsValComp] = max(abs(gradVector));
y = zeros(size(gradVector));
y(maxAbsValComp, 1) = -r*sign(gradVector(maxAbsValComp,1));
end

