sz = size(X_train);
noOfCat = max(y_train) + 1;
noOfPoints = sz(1);
noOfFeatures = sz(2);
n = noOfCat*noOfFeatures;

y = double(y_train') + 1;
Y = sparse(1:sz(1), y, 1, double(noOfPoints), double(noOfCat));

f = @(b1) (logisticFunc(Y, X_train, noOfFeatures, noOfCat, b1));
gradf = @(b1) (logisticGrad(Y, X_train, noOfFeatures, noOfCat, b1));

tol = 1e-4;
maxIter = 200;
[traj0, times0,  k0] = gradientDescent( n, f, gradf, tol, maxIter);
%[traj1, times1,  k1] = bfgs( n, f, gradf, tol, maxIter);

maxIter = 200;
[traj2, times2,  k2] = conjugateGradient( n, f, gradf, tol, maxIter);
% m = 2
% [traj3, times3,  k3] = lbfgs( n, m,  f, gradf, tol, maxIter);
% m = 8
% [traj4, times4,  k4] = lbfgs( n, m,  f, gradf, tol, maxIter);
 m = 32
[traj5, times5,  k5] = lbfgs( n, m,  f, gradf, tol, maxIter);
% m = 128
% [traj6, times6,  k6] = lbfgs( n, m,  f, gradf, tol, maxIter);
% m = 512
% [traj7, times7,  k7] = lbfgs( n, m,  f, gradf, tol, maxIter);
misClassification0 = zeros(k0,1);
lossValues0 = zeros(k0, 1);
% misClassification1 = zeros(k1,1);
% lossValues1 = zeros(k1, 1);
misClassification2 = zeros(k2,1);
lossValues2 = zeros(k2, 1);
% misClassification3 = zeros(k3,1);
% lossValues3 = zeros(k3, 1);
% misClassification4 = zeros(k4,1);
% lossValues4 = zeros(k4, 1);
misClassification5 = zeros(k5,1);
lossValues5 = zeros(k5, 1);
% misClassification6 = zeros(k6,1);
% lossValues6 = zeros(k6, 1);
% misClassification7 = zeros(k7,1);
% lossValues7 = zeros(k7, 1);
for i = 1:k0
    misClassification0(i) = calculateMisClassificationRate( traj0(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
    lossValues0(i) = f(traj0(i,:)');
end
% for i = 1:k1
%     misClassification1(i) = calculateMisClassificationRate( traj1(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
%     lossValues1(i) = f(traj1(i,:)');
% end
for i = 1:k2
    misClassification2(i) = calculateMisClassificationRate( traj2(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
    lossValues2(i) = f(traj2(i,:)');
end
% for i = 1:k3
%      misClassification3(i) = calculateMisClassificationRate( traj3(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
%      lossValues3(i) = f(traj3(i,:)');
% end
% for i = 1:k4
%      misClassification4(i) = calculateMisClassificationRate( traj4(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
%      lossValues4(i) = f(traj4(i,:)');
% end
for i = 1:k5
     misClassification5(i) = calculateMisClassificationRate( traj5(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
     lossValues5(i) = f(traj5(i,:)');
end
% for i = 1:k6
%      misClassification6(i) = calculateMisClassificationRate( traj6(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
%      lossValues6(i) = f(traj6(i,:)');
% end
% for i = 1:k7
%      misClassification7(i) = calculateMisClassificationRate( traj7(i,:)', noOfFeatures, noOfCat,  X_test, y_test');
%      lossValues7(i) = f(traj7(i,:)');
% end
% hold on
% xlabel('Iterations')
% ylabel('Misclassification Fraction')
% plot(1:k2, misClassification2(1:k2));
% plot(1:k2, misClassification3(1:k2));
% legend('Non-Linear Conjugate Gradient Descent', 'LBFGS');
% % 
% hold off;
% hold on;
% xlabel('Time(s)');
% ylabel('Misclassification Fraction');
% plot(times2(1:k2), misClassification2(1:k2));
% plot(times3(1:k3-1), misClassification3(1:k3-1));
% legend('Non-Linear Conjugate Gradient Descent', 'LBFGS');
% % 
% hold off
% hold on
% xlabel('Iterations')
% ylabel('l(b)')
% plot(1:k2, lossValues2(1:k2));
% plot(1:k2, lossValues3(1:k2));
% legend('Non-Linear Conjugate Gradient Descent', 'LBFGS');
% % 
% hold off;
% hold on;
% xlabel('Time(s)');
% ylabel('l(b)');
% plot(times2(1:k2), lossValues2(1:k2));
% plot(times3(1:k3-1), lossValues3(1:k3-1));
% legend('Non-Linear Conjugate Gradient Descent', 'LBFGS');
% % 
% % 
% hold on
% xlabel('Iterations')
% ylabel('Misclassification Fraction')
% k = min([k1, k3, k4, k5, k6, k7]);
% plot(1:k, misClassification1(1:k));
% plot(1:k, misClassification3(1:k));
% plot(1:k, misClassification4(1:k));
% plot(1:k, misClassification5(1:k));
% plot(1:k, misClassification6(1:k));
%  plot(1:k, misClassification7(1:k));
% legend('BFGS', 'LBFGS m=512');
% % % 
% hold off;
% hold on;
% xlabel('Time(s)');
% ylabel('Misclassification Fraction');
% 
% plot(times1(1:k1), misClassification1(1:k1));
% plot(times3(1:k3-1), misClassification3(1:k3-1));
% plot(times4(1:k4-1), misClassification4(1:k4-1));
% plot(times5(1:k5-1), misClassification5(1:k5-1));
% plot(times6(1:k6-1), misClassification6(1:k6-1));
%  plot(times7(1:k7-1), misClassification7(1:k7-1));
% legend('BFGS', 'LBFGS m=512');
hold on
xlabel('Iterations')
ylabel('Misclassification Fraction')
k = min([k0, k2, k5]);
plot(1:k, misClassification0(1:k));
plot(1:k, misClassification2(1:k));
plot(1:k, misClassification5(1:k));
legend('Gradient Descent', 'Non Linear Conjugate Gradient Descent', 'LBFGS');

hold off;
hold on;
xlabel('Time(s)');
ylabel('Misclassification Fraction'); 
plot(times1(1:k0), misClassification0(1:k0));
plot(times3(1:k2-1), misClassification2(1:k2-1));
plot(times5(1:k5-1), misClassification5(1:k5-1));
legend('GD', 'Non-Linear Conjugate GD', 'LBFGS m=512');