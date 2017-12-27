%select triaining and testing set
clear;close all;clc;

folder_name = './VGGVector/type1/';
%% normal data

load(fullfile(folder_name, 'nor_normal'));
[M_normal, ~] = size(features);

n_normal_train = 1000;
n_normal_test = 50;

randIndex = randperm(M_normal,n_normal_train + n_normal_test);
normal = features(randIndex,:);
normal_train = normal(1:n_normal_train,:);
normal_test = normal(n_normal_train + 1:n_normal_train + n_normal_test,:);

%% solder insufficient
load(fullfile(folder_name, 'def_solderInsufficient.mat'));
[M_normal, ~] = size(features);

n_solderInsuff_test = 20;

randIndex = randperm(M_normal,n_solderInsuff_test);
solderInsuff_test = features(randIndex,:);

%% solder bridge
load(fullfile(folder_name, 'def_solderBridge.mat'));
[M_normal, ~] = size(features);

n_solderBri_test = 15;

randIndex = randperm(M_normal,n_solderBri_test);
solderBri_test = features(randIndex,:);

%% shifting
load(fullfile(folder_name, 'def_shifting.mat'));
[M_normal, ~] = size(features);

n_shift_test = 15;

randIndex = randperm(M_normal,n_shift_test);
shift_test = features(randIndex,:);

%% save the dataset
X = normal_train;
Xval = [normal_test; solderInsuff_test; solderBri_test; shift_test];
Yval = [zeros(n_normal_test,1);ones(n_solderInsuff_test,1);ones(n_solderBri_test,1); ones(n_shift_test,1)];

%save('train.mat', 'normal_train');
%save('test.mat', 'Xval','Yval');
save('data','X','Xval','Yval');

