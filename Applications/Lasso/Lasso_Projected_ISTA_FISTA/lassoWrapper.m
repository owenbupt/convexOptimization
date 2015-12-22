if(matrixInd == 1)
    X = X1;
    y = y1;
    Xtest = X1test;
    ytest = y1test;
else if(matrixInd == 2)
    X = X2;
    y = y2;
    Xtest = X2test;
    ytest = y2test;
else
    X = X3;
    y = y3;
    Xtest = X3test;
    ytest = y3test; 
    end;
end;
        
lambda = [1];
[recoveredTimesSGD1, recoveredTrajSGD1, indexSGD, recoveredTimesAPGD, recoveredTrajAPGD, indexAPGD, recoveredTimesPGD1, recoveredTrajPGD1, indexPGD] =  lasso(X, y, Xtest, ytest, lambda);
szSGD = size(recoveredTimesSGD1);
szPGD = size(recoveredTimesPGD1);
szAPGD = size(recoveredTimesAPGD);
lossSGD = zeros(szSGD(1),1);
lossPGD = zeros(szPGD(1),1);
lossAPGD = zeros(szAPGD(1),1);

for i = 1:szSGD(1)
    lossSGD(i,1) = lassoFunc(X,y,recoveredTrajSGD1(i,:)', lambda(1,indexSGD));
end
for i = 1:szPGD(1)
    lossPGD(i,1) = lassoFunc(X,y,recoveredTrajPGD1(i,:)', lambda(1,indexPGD));
end
for i = 1:szAPGD(1)
    lossAPGD(i,1) = lassoFunc(X,y,recoveredTrajAPGD(i,:)', lambda(1,indexAPGD));
end
semilogy(recoveredTimesSGD1,    lossSGD);
hold on;
semilogy(recoveredTimesPGD1, lossPGD);
semilogy(recoveredTimesAPGD, lossAPGD);
xlabel('Time');
ylabel('Loss');
istr = num2str(i);
legend('Sub Gradient Descent for X3,Y3', 'Proximal Gradient Descent for X3,Y3', 'Accelerated Proximal Gradient Descent for X3,Y3');