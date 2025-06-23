%ShrinkJumbo
%Campbell Braun, homework #5, problem 2

jumbo = imread('Jumbo.jpg');
jumbo = double(A);

%plotting original jumbo
figure
imagesc(jumbo)
colormap('gray')
colorbar
title('original image')

%copying original jumbo
jumbonew = jumbo
%running the matrix through ReduceMatrix
jumboreduced = ReduceMatrix(jumbonew)
%plotting the resulting matrix
figure
imagesc(jumboreduced)
colormap('gray')
colorbar
title('image reduced 1 time')

%2nd time reducing the matrix
jumbonew2 = jumboreduced
jumboreduced2 = ReduceMatrix(jumbonew2)

%3rd time reducing the matrix
jumbonew3 = jumboreduced
jumboreduced3 = ReduceMatrix(jumbonew3)

%4th time reducing the matrix
jumbonew4 = jumboreduced
jumboreduced4 = ReduceMatrix(jumbonew4)

%5th time reducing the matrix
jumbonew5 = jumboreduced
jumboreduced5 = ReduceMatrix(jumbonew5)

%6th time reducing the matrix
jumbonew6 = jumboreduced
jumboreduced6 = ReduceMatrix(jumbonew6)

%7th time reducing the matrix
jumbonew7 = jumboreduced
jumboreduced7 = ReduceMatrix(jumbonew7)

%8th time reducing the matrix
jumbonew8 = jumboreduced
jumboreduced8 = ReduceMatrix(jumbonew8)

%9th time reducing the matrix
jumbonew9 = jumboreduced
jumboreduced9 = ReduceMatrix(jumbonew9)

%10th time reducing the matrix 
jumbonew10 = jumboreduced
jumboreduced10 = ReduceMatrix(jumbonew10)
%plotting this 10th reduction of the matrix
figure
imagesc(jumboreduced10)
colormap('gray')
colorbar
title('image reduced 10 times')

