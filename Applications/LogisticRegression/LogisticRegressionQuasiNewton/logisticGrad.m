function [output ] = logisticGrad( Y, x, N, N_Cat, b)
bm = reshape(b, N, N_Cat );
bx = x*bm;
A = softmax(bx');
r = x'*(A' - Y);
output = r(:);
end

