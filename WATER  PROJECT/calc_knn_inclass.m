function test_label = calc_knn_inclass(tran_data, test_data, k)

data = readtable('ckd_full.csv');
train_data = data(:,:);

test_data = [50, 80, 300, 16]; %yes
%test_data = [30, 80, 100, 10]; %no

k = 1;

%separate features from label -- label is the last column

data = train_data(:,1:end-1)
data_label = train_data(:,end)

nfeatures = size(data, 2);
nobs = size(data,1);

%normalize data

train_norm = zeros(size(data));
test_norm = zeros(size(test_data));

for j = 1:nfeatures
% loop over each column
% calc min and max for that column
% calc normalized training data -- new matrix -- same size as old
% calc normalized test data -- new vector -- same size as old test vector
    
    low = min(data(:,j));
    high = max(data(:,j));

    train_norm(:,j) = ( data(:,j) - low ) ./ (high-low);
    test_norm(j) = (test_data(j) - low )./(high-low);

% normalized data = (data - min_data) / (max_data - min_data)

end

train_norm

%calculate distances

dist = sqrt(sum ((train_norm - test_norm).^2, 2))

% sort by distance -- only distance + label

data_to_sort = [data_label, dist];

data_sort = sortrows(data_to_sort)

% choose the top k's

test_label = data_sort(1,1)


