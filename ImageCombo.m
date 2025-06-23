function imgOut = ImageCombo(img1, img2, alphaPercent)

%checking the bounds
if (alphaPercent > 100)
    alphaPercent = 100;
end

if (alphaPercent < 0)
    alphaPercent = 0;
end

%turn the percent into a decimal
Pct1 = alphaPercent/100;
Pct2 = 1-Pct1;

%height=460, width=400

%convert images into double format to do math with them when combining them
img1 = double(img1);
img2 = double(img2);

%making space for the image
imgOut(height(img1), width(img1)) = 0;

%combine the two images
for k = 1:width(img1)
    for m = 1:height(img1)
        imgOut(m,k) = (img1(m,k).*Pct1) + (img2(m,k).*Pct2);
    end
end

%converting the combined image back to the uint8 form
imgOut = uint8(imgOut);

%display the newly combined image
imagesc(imgOut);
axis equal, axis([0 height(img1) 0 width(img1)]);
colormap spring;