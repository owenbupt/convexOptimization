function [ output ] = projectOnSamples( XV, m, n, MO, OC )
X = reshape(XV, m, n);
outputM = X.*(OC) + MO;
output = outputM(:);
end

