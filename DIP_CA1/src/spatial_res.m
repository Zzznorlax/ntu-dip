
filename = "lena.bmp";

img = imread(filename);

img_4 = imresize(imresize(img, 1 / 4), 4);
img_8 = imresize(imresize(img, 1 / 8), 8);
img_16 = imresize(imresize(img, 1 / 16), 16);
img_32 = imresize(imresize(img, 1 / 32), 32);

img_8_nearest = imresize(img, 1 / 8, "nearest");
img_8_bilinear = imresize(img, 1 / 8, "bilinear");
img_8_bicubic = imresize(img, 1 / 8, "bicubic");

% figure, imshow(img_32);

imwrite(img_4, gray(256), "outputs/lena_4.tiff", "TIFF");
imwrite(img_8, gray(256), "outputs/lena_8.tiff", "TIFF");
imwrite(img_16, gray(256), "outputs/lena_16.tiff", "TIFF");
imwrite(img_32, gray(256), "outputs/lena_32.tiff", "TIFF");

imwrite(img_8_nearest, gray(256), "outputs/lena_8_nearest.tiff", "TIFF");
imwrite(img_8_bilinear, gray(256), "outputs/lena_8_bilinear.tiff", "TIFF");
imwrite(img_8_bicubic, gray(256), "outputs/lena_8_bicubic.tiff", "TIFF");
