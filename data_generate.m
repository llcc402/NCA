% For simplicity, we just generate two clusters of data, each has 500
% observations
function [data, z] = data_generate(n)
if nargin < 1
    n = 500;
end
mu_1 = [-2 -2];
mu_2 = [2 2];

Sigma = eye(2);

x1 = mvnrnd(mu_1, Sigma, n);
x2 = mvnrnd(mu_2, Sigma, n);
data = [x1; x2];

z =[ ones(n,1); 2 * ones(n,1)];

scatter(x1(:,1), x1(:,2), 'o', 'r')
hold on
scatter(x2(:,1), x2(:,2), 'x', 'b')
hold off
