function [ output ] = euclidenProjOnSimplex( x , z)
sz = size(x);
n = sz(1);
y = sort(x, 'descend');
prefixSum = 0;
i = 1;
while(i<= n)
    prefixSum = prefixSum + y(i,1);
    if( (y(i,1) - (prefixSum - z)/i) <= 0)
        prefixSum = prefixSum - y(i,1);
        break;
    end;
    i = i+1;
end
theta = (prefixSum - z)/(i-1);
output = max( x - theta, 0);
end

