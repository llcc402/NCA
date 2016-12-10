%% Input:
%     data            A matrix of observations. Rows are corresponding to
%                     observations.
%     z               A vector of labels. One for each observations.
%% Output:
%     M               A matrix of order d, where d is the dimension of the
%                     observations.
%% Model description:
%     The distance between data(i,:) and data(j,:) is
%
%              (data(i,:) - data(j,:)) * M * (data(i,:) - data(j,:))

function M = NCA(data, z, alpha, maxIter)
n = size(data,2);
M = eye(n);

err = zeros(1, maxIter);

D = get_distance(data, M);
P = get_prob(D);
C = outer(data);

for iter = 1:maxIter
    tic
    
    % update M
    grad = get_gradient(P, C, z, n);
    M = M + alpha * grad;
    err(iter) = sum(sum((alpha * grad) .^2));
    
    % update P
    D = get_distance(data, M);
    P = get_prob(D);
    
    toc
    fprintf(['Iter ', num2str(iter), ' done \n'])
end

plot(err)