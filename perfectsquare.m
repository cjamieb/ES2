clear, clc;

a = [4 8 24 25 20 64]

for i = 1:length(a)
    disp(a(i))

    if sqrt(a(i)) == round(sqrt(a(i)))
        disp('Square')
    else
        disp('Not a square')
    end
end