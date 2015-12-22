function [ g ] = gradientIP( u,v, c, gamma, P, M, w )
cMat = c + gamma*P*v - M*v;
g = -w - u*(gamma*P - M)'*(cMat.^(-1));
end

