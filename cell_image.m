%% Input:
%     C      A cell of order n * n. It is upper triangular in the sense
%            that the lower triangular and the diagonal are empty.
%% Output:
%     C      A cell has the same order with the original and its lower
%            triangular is filled with the upper image.
function C = cell_image(C)
n = size(C,1);

ix_origin = zeros(n * (n-1) / 2, 1);
k = 0;
for i = 1:(n-1)
    ix_origin((k+1):(k+i)) = (n*i + 1) : (n*i + i);
    k = k + i;
end

ix_image = zeros(length(ix_origin), 1);
k = n-1;
mystart = 1;
myend = n-1;
for i = 1:(n-1)
    ix_image(mystart:myend) = (i+n*(i-1)+1) : n*i;
    mystart = myend+1;
    k = k - 1;
    myend = myend + k;
end

C(ix_image) = C(ix_origin);