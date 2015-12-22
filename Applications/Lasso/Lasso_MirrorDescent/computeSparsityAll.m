sparsityPSGD = computeSparsity(trajPSGD);
sparsityMD = computeSparsity(trajMD);
figure(1);
plot(sparsityPSGD);
legend('Proximal Sub-Gradient Descent');