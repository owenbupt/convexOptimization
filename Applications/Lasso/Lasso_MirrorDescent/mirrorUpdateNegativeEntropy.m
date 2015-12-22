function [ output ] = mirrorUpdateNegativeEntropy( X, y, beta, eta )
output = beta.*exp(-eta*subGradL1Error(X, beta, y));
end

