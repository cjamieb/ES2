%tables
ColumnData = NameofTable.NameofHeader;
val = NameofTable.headername(2);

%get elements directly
val = NameofTable{2,3};
val = NameofTable{2, 'headername'}

%make a new table
Val_2 = NameofTable(2, 'headername')

NewTable = NameofTable(:, {'col1', 'col2', 'col3'})



%sorting
Data_sorted = sortrows(Data, 'headername')

%deleting rows
NameofTable(12,:) = [];

%find mean
MeanValueVector = mean(TableName, 2)
    %average the two columns

%add new column
NameofTable.NameNewCol = MeanValuesVector;

