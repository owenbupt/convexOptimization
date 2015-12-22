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

misClassificationVsMuAGD = zeros(sz(2), 1);
for j=1:sz(2)
    f = @(b1) (logisticFunc(Y, X_train, noOfFeatures, noOfCat, b1, mu(1,j)));
    gradf = @(b1) (logisticGrad(Y, X_train, noOfFeatures, noOfCat, b1, mu(1,j)));
    maxIter = 400;
    eta = 0.003;
    tic
    [ traj1, times1, k1 ] = acceleratedGradientDescent(n , gradf, eta, maxIter);
    toc
    misClassification1 = zeros(k1,1);
    lossValues1 = zeros(k1, 1);
    for i = 1:k1
        misClassification1(i) = calculateMisClassificationRate( traj1(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
        lossValues1(i) = f(traj1(i,:)');
    end
    [currentMin, currentMinIndex] = min(misClassification1)
    misClassificationVsMuAGD(j, 1) = currentMin;
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

misClassificationTrainGD = zeros(bestK0, 1);
for i = 1:bestK0
        misClassificationTrainGD(i) = calculateMisClassificationRate( bestTraj0(i,:)', noOfFeatures, noOfCat,  X_train, y_train');
end
misClassificationTrainAGD = zeros(bestK1, 1);
for i = 1:bestK1
        misClassificationTrainAGD(i) = calculateMisClassificationRate( bestTraj1(i,:)', noOfFeatures, noOfCat,  X_train, y_train');
end
hold on
xlabel('Time')
ylabel('Misclassification Fraction')
plot(bestTimes0(1:bestK0), bestMisClassificationRate0(1:bestK1));
plot(bestTimes1(1:bestK1), bestMisClassificationRate1(1:bestK1));
legend('Gradient Descent', 'Accelerated Gradient Descent');

hold off;
hold on;
xlabel('Time')
ylabel('Misclassification Fraction on Training Data')
plot(bestTimes0(1:bestK0), misClassificationTrainGD(1:bestK0));
plot(bestTimes1(1:bestK1), misClassificationTrainAGD(1:bestK1));
legend('Gradient Descent', 'Accelerated Gradient Descent');

hold off;
hold on;
xlabel('\mu');
ylabel('Misclassification Rate');
semilogx(mu, misClassificationVsMuGD);
semilogx(mu, misClassificationVsMuAGD);
legend('Gradient Descent', 'Accelerated Gradient Descent');