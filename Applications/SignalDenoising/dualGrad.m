function [y] = dualGrad(x, BBT, BXH)
y = BBT*x - BXH;
end

