function [ output ] = dualProx( eta, x, indices )
output = zeros(size(x));
sz = size(indices);
noOfIndices = sz(1);
for i=1:noOfIndices - 1
    currentIndex = indices(i,:) + 1;
    nextIndex = indices(i+1,:);
    curVal = x(currentIndex:nextIndex, :);
    if(norm(curVal) > 1)
        curVal = curVal/norm(curVal);
    end
    output(currentIndex:nextIndex) = curVal;
end
end

