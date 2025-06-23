%PlotPrettyPicture
%Campbell Braun, homework #5

%creating the variables
x = linspace (-10,10,101)
y = linspace (-8, 8, 81)

%initializing Matrix
V = zeros(length(x), length(y))


a = pi/2;
b = 0;
c = 0;
k = 1;
for d=1:length(x)
    for e=1:length(y)
        V(d,e) = cos(a+ k*(sqrt(3)*y(e) +x(d))/2) + cos(b +k*(sqrt(3)*y(e) -x(d))/2) + cos(c+ k*x(d))
    end
end

disp(V);

%question 1: plotting V
subplot 311
imagesc(V)
colormap('spring')
colorbar
xlabel('x'), ylabel('y')

%question 2: contour plot
subplot 312
surfc(V)
colormap('summer')
colorbar
xlabel('x'), ylabel('y'), zlabel('V(x,y)'), shading flat

%question 3: filled contour plot
subplot 313
contourf(V)
colormap('winter')
colorbar
xlabel('x'), ylabel('y')
clabel([],y)


