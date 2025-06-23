load ('quarter.mat')

figure
imagesc(quarter)
colormap gray
colorbar
title('default')

%figure
%surf(quarter)
%shading flat

%IMAGE 1
figure
imagesc(quarter'), colormap gray
title('transpose')

%IMAGE 2
figure
imagesc(rot90(quarter)), colormap gray
title('rotate')

%image 2
%Tquarter = transpose(quarter)
%imagesc(Tquarter)
%colormap gray

%IMAGE 3
figure
imagesc(rot90(rot90(quarter))), colormap gray
title('rotate twice')

%PUT ALL 4 TOGETHER
fourqs = [quarter, quarter' ; quarter quarter];
imagesc(fourqs), colormap gray

%PUT A LINE ACROSS IT
quartercopy = quarter;

quartercopy(50,:) = 0; %for black line

figure
imagesc(quartercopy), colormap gray
title('line')

%CROP THE IMAGE

quartercrop = quarter(30:120,25:105);

figure
imagesc(quartercrop), colormap gray
title('crop')


%NOTES!!

%imread -- reads in many image formats
%imagesc -- shows the image (auto-scales dynamic range)
%imshow -- no pixel #s, images only
%surf -- shows the image (matrix) as a surface
%colorbar -- adds a colorbar to the image




