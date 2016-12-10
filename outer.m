%% Input:
%      data     A matrix of order m * n, where m is the number of
%               observations.
%% Output:
%      C        A cell of order m * m. When i < j, we have
%               C{i,j} = (data(i,:) - data(j,:))' * (data(i,:) - data(j,:))
function C = outer(data) 
m = size(data,1);
C = cell(m);
for i = 1:(m-1)
    diff = bsxfun(@minus, data(i,:), data((i+1):m,:));
    C(i,(i+1):m) = arrayfun(@(x) diff(x,:)' * diff(x,:),...
                            1:size(diff,1),...
                            'UniformOutput', false);
end