
clear ; close all; clc

%  Loads the second dataset. You should now have the
%  variables X, Xval, yval in your environment
load('data.mat');
%load('ex8data1.mat');
%
X = X(:, 1:269);
%
Xval = Xval(:,1:269);
%yval = Yval';
X(:,249) = [];
Xval(:,249) = [];

%[X, Xval] = dataProcessing(X, Xval);
%X = X(:, 1:2);
%Xval = Xval(:,1:2);

%  Apply the same steps to the larger dataset
[mu, sigma2] = estimateGaussian(X);

[mu, sigma2, zero_list] = parameterPross( mu, sigma2 );

X(:,zero_list) = [];
Xval(:,zero_list) = [];

%  Training set 
tic;
p = multivariateGaussian(X, mu, sigma2);
toc;
%  Cross-validation set
tic;
pval = multivariateGaussian(Xval, mu, sigma2);
toc;

%  Find the best threshold
[epsilon F1] = selectThreshold(Yval, pval);

fprintf('Best epsilon found using cross-validation: %e\n', epsilon);
fprintf('Best F1 on Cross Validation Set:  %f\n', F1);
fprintf('# Outliers found: %d\n', sum(pval < epsilon));
fprintf('   (you should see a value epsilon of about 1.38e-18)\n\n');

gmdistribution

