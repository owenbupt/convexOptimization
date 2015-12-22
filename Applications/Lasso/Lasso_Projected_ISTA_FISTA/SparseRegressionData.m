
clear;

m = 5e1; n = 5e2; d = 5; sigma = 1e-2;

X1 = randn(m,n); b1 = zeros(n,1); b1(randsample(n,d)) = 1;
y1 = X1*b1 + sigma*randn(m,1);
X1test = randn(100,n);
y1test = X1test*b1;

m = 5e2; n = 5e3; d = 5; sigma = 1e-2;

X2 = randn(m,n); b2 = zeros(n,1); b2(randsample(n,d)) = 1;
y2 = X2*b2 + sigma*randn(m,1);
X2test = randn(100,n);
y2test = X2test*b2;

m = 5e3; n = 5e4; d = 5; sigma = 1e-2;

X3 = randn(m,n); b3 = zeros(n,1); b3(randsample(n,d)) = 1;
y3 = X3*b3 + sigma*randn(m,1);
X3test = randn(100,n);
y3test = X3test*b3;

