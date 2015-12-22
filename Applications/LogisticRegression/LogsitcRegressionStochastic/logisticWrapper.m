sz = size(X_train);
noOfCat = max(y_train) + 1;
noOfPoints = sz(1);
noOfFeatures = sz(2);
n = noOfCat*noOfFeatures;

y = double(y_train') + 1;
Y = sparse(1:sz(1), y, 1, double(noOfPoints), double(noOfCat));

mu = [0.001];
sz = size(mu);
misClassificationVsMuGD = zeros(sz(2), 1);
minimumError = 10000;
for j=1:sz(2)
    f = @(b1) (logisticFunc(Y, X_train, noOfFeatures, noOfCat, b1, mu(1,j)));
    gradf = @(b1) (logisticGrad(Y, X_train, noOfFeatures, noOfCat, b1, mu(1,j)));

    tol = 1e-4;
    maxIter = 400;
    eta = 0.003;
    tic
    [traj0, times0,  k0] = gradientDescent( n, f, gradf, eta, tol, maxIter);
    toc
    misClassification0 = zeros(k0,1);
    lossValues0 = zeros(k0, 1);
    for i = 1:k0
        misClassification0(i) = calculateMisClassificationRate( traj0(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
        lossValues0(i) = f(traj0(i,:)');
    end
    [currentMin, currentMinIndex] = min(misClassification0)
    misClassificationVsMuGD(j, 1) = currentMin;
    if(currentMin < minimumError)
        minimumError = currentMin;
        bestMu0 = j;
        bestTraj0 = traj0;
        bestTimes0 = times0;
        bestLoss0 = lossValues0;
        bestMisClassificationRate0 = misClassification0;
        bestK0 = k0;
    end
end

misClassificationVsMuSGD = zeros(sz(2), 1);
minimumError = 1e6;
for j=1:sz(2)
    f = @(b1) (logisticFunc(Y, X_train, noOfFeatures, noOfCat, b1, mu(1,j)));
    gradf = @(b1, dataPointIndex) (logisticGradSingleDataPoint(Y, X_train, noOfFeatures, noOfCat, b1, mu(1,j), dataPointIndex));
    maxIter = 4000;
    eta = 0.1;
    tic
    [ traj1, times1, k1 ] = stochasticGradientDescent(n , noOfPoints, gradf, eta, maxIter);
    toc
    misClassification1 = zeros(k1,1);
    lossValues1 = zeros(k1, 1);
    for i = 1:k1
        misClassification1(i) = calculateMisClassificationRate( traj1(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
        lossValues1(i) = f(traj1(i,:)');
    end
    [currentMin, currentMinIndex] = min(misClassification1)
    misClassificationVsMuSGD(j, 1) = currentMin;
    if(currentMin < minimumError)
        minimumError = currentMin;
        bestMu1 = j;
        bestTraj1 = traj1;
        bestTimes1 = times1;
        bestLoss1 = lossValues1;
        bestMisClassificationRate1 = misClassification1;
        bestK1 = k1;
    end
end

misClassificationVsMuSVRG = zeros(sz(2), 1);
minimumError = 1e6;
for j=1:sz(2)
    f = @(b1) (logisticFunc(Y, X_train, noOfFeatures, noOfCat, b1, mu(1,j)));
    singleGrad = @(b1, dataPointIndex) (logisticGradSingleDataPoint(Y, X_train, noOfFeatures, noOfCat, b1, mu(1,j), dataPointIndex));
    fullGrad = @(b1) (logisticGrad(Y, X_train, noOfFeatures, noOfCat, b1, mu(1,j)));
    maxIter = 4;
    updateFrequency = 250;
    eta = 0.3;
    tic
    [ traj2, times2, k2 ] = SVRG(n , noOfPoints, fullGrad, singleGrad, eta, maxIter, updateFrequency);
    toc
    misClassification2 = zeros(k2,1);
    lossValues2 = zeros(k2, 1);
    for i = 1:k2
        misClassification2(i) = calculateMisClassificationRate( traj2(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
        lossValues2(i) = f(traj2(i,:)');
    end
    [currentMin, currentMinIndex] = min(misClassification2)
    misClassificationVsMuSVRG(j, 1) = currentMin;
    if(currentMin < minimumError)
        minimumError = currentMin;
        bestMu2 = j;
        bestTraj2 = traj2;
        bestTimes2 = times2;
        bestLoss2 = lossValues2;
        bestMisClassificationRate2 = misClassification2;
        bestK2 = k2;
    end
end


misClassificationTrainGD = zeros(bestK0, 1);
for i = 1:bestK0
        misClassificationTrainGD(i) = calculateMisClassificationRate( bestTraj0(i,:)', noOfFeatures, noOfCat,  X_train, y_train');
end
misClassificationTrainSGD = zeros(bestK1, 1);
for i = 1:bestK1
        misClassificationTrainSGD(i) = calculateMisClassificationRate( bestTraj1(i,:)', noOfFeatures, noOfCat,  X_train, y_train');
end
misClassificationTrainSVRG = zeros(bestK2, 1);
for i = 1:bestK2
        misClassificationTrainSVRG(i) = calculateMisClassificationRate( bestTraj2(i,:)', noOfFeatures, noOfCat,  X_train, y_train');
end


semilogy(bestTimes0(1:bestK0), bestLoss0(1:bestK0));
hold on
semilogy(bestTimes1(1:bestK1), bestLoss1(1:bestK1));
%semilogy(bestTimes1(1:bestK2), bestLoss2(1:bestK2));
xlabel('Time')
ylabel('Loss')
legend('Gradient Descent', 'Stochastic Gradient Descent', 'SVRG');
