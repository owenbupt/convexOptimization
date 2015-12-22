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
%7.0, 2.2311, 0.8269
[  recoveredTrajCGD,recoveredTimesCGD, indexCGD] =  lasso(X, y,  4.946);
szCGD = size(recoveredTrajCGD);
lossCGD = zeros(szCGD(1),1);

size(lossCGD)
size(recoveredTrajCGD)
for i = 1:szCGD(1)
    i
    lossCGD(i,1) = lassoFunc(X,y,recoveredTrajCGD(i,:)', lambda(1,1));
end
semilogy(recoveredTimesCGD,    lossCGD);
xlabel('Time');
ylabel('Loss');
istr = num2str(i);
legend('Conditional Gradient Descent for X1,Y1');