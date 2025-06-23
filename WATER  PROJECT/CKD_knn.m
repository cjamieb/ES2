%CKD_knn
clear, clc;

data = readtable('ckd_full.csv');
% table is: age, bp, gluc, hem, ckd

% age = data.Age; %not helpful, range is 6 to 83
