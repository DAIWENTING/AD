%preparate the dataset

clear;close all;clc;

%folder_name = './data/type1/solderBridge';
folder_name = './crack/def';
filenames=dir(fullfile(folder_name,'*.png'));
filenames={filenames.name};
n_samples=numel(filenames);

sample = imread(fullfile(folder_name, num2str(cell2mat(filenames(1))))); 
[M N C] = size(sample);
data = zeros(n_samples, 206 * 206);

for i = 1:n_samples
    I = imread(fullfile(folder_name, num2str(cell2mat(filenames(i)))));
    J = imresize(I, [206,206]);
    data(i,:) = J(:);
end
save('crack_def.mat', 'data');

