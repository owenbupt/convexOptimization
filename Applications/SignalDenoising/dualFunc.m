function [ y ] = dualFunc(x, BBT, BXH)
y = (x'*BBT*x)/2 - x'*BXH;
end

