function [ h ] = hessianIP( u,v ,c, gamma, P, M, w )
cMat = c + gamma*P*v - M*v;
gineq = (gamma*P-M)';
h =  u*gineq*diag((cMat).^(-2))*gineq';
end

