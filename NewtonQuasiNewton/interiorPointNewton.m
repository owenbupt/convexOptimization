function [ v ] = interiorPointNewton( u, v0, maxIter, gradIP, hessIP )
v = v0;
for i = 1:maxIter
    v = v - hessIP(u,v)\gradIP(u,v);
end
end

