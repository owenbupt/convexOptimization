function [ misClassError ] = calculateMisClassificationRate( b, noOfFeatures, noOfCat, x_test, y_test)
bm = reshape(b, noOfFeatures, noOfCat);
[predictedProb, predictions] = max(x_test*bm, [], 2);
szTest = size(y_test);
noOfTestPoints = szTest(1);
misClassError = 1 - sum(predictions(:,1) == (y_test(:,1)+1))/noOfTestPoints;
end

