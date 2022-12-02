
filename = "inputs/lena.bmp";

img = imread(filename);

img_4 = imresize(imresize(img, 1 / 4), 4);
img_8 = imresize(imresize(img, 1 / 8), 8);
img_16 = imresize(imresize(img, 1 / 16), 16);
img_32 = imresize(imresize(img, 1 / 32), 32);

img_8_nearest = imresize(img, 1 / 8, "nearest");
img_8_bilinear = imresize(img, 1 / 8, "bilinear");
img_8_bicubic = imresize(img, 1 / 8, "bicubic");

fig = figure();
t = tiledlayout(4, 2);
t.TileSpacing = 'compact';
t.Padding = 'compact';

nexttile;
imshow(img_4, gray(256));
title('1/4');

nexttile;
imshow(img_8, gray(256));
title('1/8');

nexttile;
imshow(img_16, gray(256));
title('1/16');

nexttile;
imshow(img_32, gray(256));
title('1/32');

nexttile;
imshow(img_8_nearest, gray(256));
title('1/8 nearest');

nexttile;
imshow(img_8_bilinear, gray(256));
title('1/8 bilinear');

nexttile;
imshow(img_8_bicubic, gray(256));
title('1/8 bicubic');

print(fig, 'assets/spatial_res', '-dpng', '-r300');
