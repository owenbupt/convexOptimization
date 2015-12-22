function [ ou ] = logisticFunc(Y, x, N, N_Cat, b, mu)
bm = reshape(b,   N, N_Cat);
bx = x*bm;
ou =  -sum(log(sum(softmax(bx').*Y'))) + mu*norm(b)^2;
end

