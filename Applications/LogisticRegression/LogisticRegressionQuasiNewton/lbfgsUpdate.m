function [ r ] = lbfgsUpdate( x, gradf, v, s, k, m )
sz = size(x);
n = sz(1);
q = gradf(x);
i = k-1;
while(i > 0 && i > k-m)
    pho = 1/(v(mod(i,m) + 1, :)*s(mod(i,m) + 1,:)');
    alpha = pho*s(mod(i,m)+1, :)*q;
    q = q - alpha*v(mod(i, m) + 1, :)';
    i = i-1;
end
if(k == 1)
    r = eye(n)*q;
else
    gamma = s(mod(k-1, m) + 1, :)*v(mod(k-1, m) + 1, :)'/(v(mod(k-1, m) + 1, :)*v(mod(k-1, m) + 1, :)');
    r = gamma*speye(n)*q;
    i = max(1, k-m);
    while(i < k)
      pho = 1/(v(mod(i,m) + 1, :)*s(mod(i,m) + 1,:)');
      alpha = pho*s(mod(i,m)+1, :)*q;
      beta = pho*v(mod(i,m)+1, :)*r;
      r = r + s(mod(i, m) + 1, :)'*(alpha - beta);
      i = i+1;
    end
end

r = -r;
end

