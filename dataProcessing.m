function [ X_new,Xval_new ] = dataProcessing( X, Xval )
%dimension reduction 

[~,n] = size(X);
X_new = X(:,1);
Xval_new = Xval(:,1);
for i = 1:n
    if(sum(abs(X(:,i))) ~= 0 && sum(abs(Xval(:,i))) )
        X_new = [X_new,X(:,i)];
        Xval_new = [Xval_new,Xval(:,i)];
    end
end

