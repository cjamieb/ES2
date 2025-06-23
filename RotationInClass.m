%x = [1 3 4];

%xrot = x([2:end, 1])

%isZero = (x==0)

%howmanyzeros = sum(x==0)

x = [1, -3, 4, 17, 1]
y = (x==1)
z = (x<5)
v = (x>2 & x<=15)

w = y&z
u = y|z