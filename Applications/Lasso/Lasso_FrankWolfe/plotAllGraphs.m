figure(1)
semilogy(recoveredTimesAPGD, lossAPGD);
hold on;
semilogy(recoveredTimesCGD, lossCGD);
semilogy(recoveredTimesPGD1, lossPGD);
semilogy(recoveredTimesSGD1, lossSGD);
xlabel('Time');
ylabel('Loss');
legend('FISTA for X_1, Y_1', 'Frank-Wolfe for X_1, Y_1', 'ISTA for X_1, Y_1', 'Sub-Gradient Descent for X_1, Y_1');

figure(2)
semilogy(recoveredTimesAPGD, testAPGD);
hold on;
semilogy(recoveredTimesCGD, testCGD);
semilogy(recoveredTimesPGD1, testPGD);
semilogy(recoveredTimesSGD1, testSGD);
xlabel('Time');
ylabel('Test Error');
legend('FISTA for X_1, Y_1', 'Frank-Wolfe for X_1, Y_1', 'ISTA for X_1, Y_1', 'Sub-Gradient Descent for X_1, Y_1', 'location', 'east');


figure(3)
semilogy(recoveredTimesAPGD, sparsityAPGD);
hold on;
semilogy(recoveredTimesCGD,  sparsityCGD);
semilogy(recoveredTimesPGD1, sparsityPGD);
semilogy(recoveredTimesSGD1, sparsitySGD);
xlabel('Time');
ylabel('Sparsity (Number of Non-Zero Entries)');
legend('FISTA for X_1, Y_1', 'Frank-Wolfe for X_1, Y_1', 'ISTA for X_1, Y_1', 'Sub-Gradient Descent for X_1, Y_1', 'location', 'east');


figure(4)
sz = size(recoveredTrajAPGD);
subplot(4,1, 1);
plot(recoveredTrajAPGD(sz(1), :));
legend('FISTA for X_1, Y_1');
subplot(4,1, 2);
plot(recoveredTrajCGD(sz(1), :));
legend('Frank-Wolfe for X_1, Y_1');
subplot(4,1, 3);
plot(recoveredTrajPGD1(sz(1), :));
legend('ISTA for X_1, Y_1');
subplot(4,1, 4);
plot(recoveredTrajSGD1(sz(1), :));
legend('Sub-Gradient Descent for X_1, Y_1');
