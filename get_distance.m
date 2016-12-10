%% Input:
%    data    A matrix of order m * n, where m is the number of observations
%            and n is the dimension of the observations.
%    M       A symmetric positive definite matrix.
%% Output:
%    D       A matrix of order m, where m is the number of observations in
%            data. D is a upper triangular matrix with D(i,j) denote the
%            Mahalanobis distance between i and j when i < j. Note 
%            D(i,i) = 0.

function D = get_distance(data, M)
m = size(data,1); % the number of observations
D = zeros(m);
if m == 1
    error(message('There should be more than 1 observations.'))
else
    k = 2;
    for i = 1:(m-1)
        diff = bsxfun(@minus, data(i,:), data((i+1):m,:));
        distance = sum((diff * M) .* diff, 2);
        D(i, k:m) = distance;
        k = k + 1;
    end
end