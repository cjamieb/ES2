
clear, clc;

age = 20;
drive = 'no';
vote = 'no';
drink = 'no';

age = input('How old are you? ');

if  age >= 16
    drive = 'yes';
end

if age >= 18
    vote = 'yes';
end

if age >=  21
    drink = 'yes';
end

disp("Can you drive? " + drive)
disp("Can you vote? " + vote)
disp("Can you drink? " + drink)
