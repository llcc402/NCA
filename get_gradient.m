%% Input:
%    P           A upper triangular square matrix of the probabilities of i
%                to sit with j for i < j
%    C           A cell of order m * m. When i < j, C{i,j} = diff' * diff,
%                where diff = data(i,:) - data(j,:)
%    z           A vector of length m, the indicators of each observation
%                which table to sit in.
%    n           A scalar. The dimension of the observations.
%% Output:
%    grad        A matrix of order n. The gradient of the metric matrix M.
%%
function grad = get_gradient(P, C, z, n)
P = P + P';
C = cell_image(C);
m = size(P,1); % number of observations
grad = zeros(n);

for i = 1:m
    ix = find(z == z(i));
    ix(ix == i) = [];
    grad_i_1 = arrayfun(@(k) C{i,k} * P(i,k), ix, 'UniformOutput', false);
    grad_i_1 = cell2mat(grad_i_1);
    grad_i_1 = reshape(grad_i_1, n, [], length(ix));
    grad_i_1 = sum(grad_i_1, 3);
    
    ix_1 = 1:m;
    ix_1(ix_1 == i) = [];
    grad_i_2 = arrayfun(@(k) C{i,k} * P(i,k), ix_1, 'UniformOutput', false);
    grad_i_2 = cell2mat(grad_i_2);
    grad_i_2 = reshape(grad_i_2, n, [], m-1);
    grad_i_2 = sum(grad_i_2, 3);
    grad_i_2 = grad_i_2 * sum(P(i, ix));

    grad = grad - grad_i_1 + grad_i_2;
end
