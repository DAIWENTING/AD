function [ mu, sigma2, zero_list ] = parameterPross( mu, sigma2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n = length(mu);

zero_list = [];
for i = 1:n
    if(mu(i,1) == 0 && sum(abs(sigma2(:,i))) == 0 )
        zero_list = [zero_list,i];
    end
end
mu(zero_list,:) = [];
sigma2(zero_list,:) = [];
sigma2(:,zero_list) = [];


end

