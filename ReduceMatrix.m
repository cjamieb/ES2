function Ared = ReduceMatrix(A)
%remove the first row
A(1,:) = [];
%remove the first column
A(:,1) = [];
Ared = A
