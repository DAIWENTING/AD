clear;close all;clc;

%% normal data
load('crack_normal.mat');
[M_normal, ~] = size(data);

n_normal_train = 500;
n_normal_test = 50;

randIndex = randperm(M_normal,n_normal_train + n_normal_test);
normal = data(randIndex,:);
normal_train = normal(1:n_normal_train,:);
normal_test = normal(n_normal_train + 1:n_normal_train + n_normal_test,:);

%% solder insufficient

load('crack_def.mat');
[M_normal, ~] = size(data);

n_solderInsuff_test = 50;

randIndex = randperm(M_normal,n_solderInsuff_test);
solderInsuff_test = data(randIndex,:);

%% save the dataset
X = normal_train;
Xval = [normal_test; solderInsuff_test];
Yval = [zeros(1,n_normal_test),ones(1,n_solderInsuff_test)];

%save('train.mat', 'normal_train');
%save('test.mat', 'Xval','Yval');
save('crack_data','X','Xval','Yval');
