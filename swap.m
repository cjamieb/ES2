%swap
%this script swaps the values of a & b

%initializes values
a = 4;
b = 5;

%WAY ONE
%a1 = 4;
%b1 = 5;
%a = b1
%b = a1

%WAY TWO
%c = b + a;
%a = c - a
%b = c - b

%WAY THREE
%c = b*a;
%a = c/b
%b = c/a

%WAY FOUR
%c = b/a;
%b = b/c
%a = a*c

%WAY FIVE
%valmatrix = [a b];

%b= valmatrix(1)
%a= valmatrix(2)

%WAY SIX
%a = a+b:
%b = a-b
%a = a-b

[b a] = deal(a, b)

