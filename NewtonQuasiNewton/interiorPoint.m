function [ v ] = interiorPoint( v0, u0 , epsi, theta, c, gamma, P, M, w )
u = u0;
v = v0;
maxIter = 10;
gradIP = @ (x1, x2)(gradientIP(x1,x2,c, gamma, P, M, w ));
hessIP = @ (x1, x2)(hessianIP(x1,x2,c, gamma, P, M, w ))
while(u > epsi)
    v =interiorPointNewton( u, v,maxIter, gradIP, hessIP);
    u = theta*u
end
end

