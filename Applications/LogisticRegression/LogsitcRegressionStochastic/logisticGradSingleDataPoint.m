function [ output ] = logisticGradSingleDataPoint(  Y, x, N, N_Cat, b, mu, dataPoint )
bm = reshape(b, N, N_Cat );
bx = x(dataPoint, :) *bm;
A = softmax(bx');
r = x(dataPoint, :)'*(A' - Y(dataPoint, :));
output = r(:) + 2*mu*b ;
end

