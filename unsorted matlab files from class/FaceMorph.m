%FaceMorph
%Campbell Braun, homework 5, question 3

%read in the photos to be combined
img1 = imread('from.jpg');
img2 = imread('to.jpg');

%start at alphaPercent=1 and go until alphaPercent=100
for i=1:100
    ImageCombo(img1, img2, i);
    pause;
end