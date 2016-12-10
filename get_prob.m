%% Input:
%     D      A distance matrix. D(i,j) denotes the distance of i and j when
%            i < j. Otherwise, D(i,j) = 0.
%% Output:
%     P      A probability marix. P(i,j) is the probability of i to sit
%            with j. P is also a upper triangular matrix, just as D.
%% Model:
%     The probability of i to sit with j is
%                       exp(-D(i,j))
%               ------------------------------
%                 sum_{k ~= i} exp(-D(i,k))
function P = get_prob(D)
m = size(D,1);
P = zeros(m);
k = 2;
for i = 1:(m-1)
    vec = D(i,k:m);
    vec = vec - min(vec);
    sim = exp(-vec);
    s = sum(sim);
    P(i,k:m) = sim / s;
    k = k + 1;
end