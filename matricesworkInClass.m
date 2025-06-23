
A = [2:4;5:7]
B = [2,3;4,5;6,7]

% ; is a new row

AA = [A,A]
BB = [B;B]
Binc = [B, 2*B, 3*B]
%AB = [A,B]

length(A)
size(B)
numel(B)
ndims(B)

A(2,3) %second row third column
%A(3,2) %get error from this bc there are not 3 columns

A(1), A(5)

A(2,:) %second row all columns
A(:,2) %all rows, second column

A(end:-1:1, end)


