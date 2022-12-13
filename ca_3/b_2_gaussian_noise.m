
filename = "inputs/peppers_gray.tif";

var = 0.2;

img = imread(filename);

g = imnoise(img, 'gaussian', var);

mean_k_size = 3;
mean_filter = fspecial("average", [mean_k_size, mean_k_size]);
mean_filtered = filter2(mean_filter, g);

lp_k_size = 7;
lp_filter = fspecial("gaussian", [lp_k_size, lp_k_size]);
lp_filtered = filter2(lp_filter, g);

median_k_size = 7;
median_filtered = medfilt2(g, [median_k_size, median_k_size]);

wiener_k_size = 7;
wiener_filtered = wiener2(g, [wiener_k_size, wiener_k_size]);

alpha_trim_k_size = 3;
d = 3;
alphatrimed = alphatrim(g, d, alpha_trim_k_size);

fig = figure();
t = tiledlayout(3, 2);
t.TileSpacing = 'compact';
t.Padding = 'compact';

nexttile;
imshow(g, gray(256));
title(sprintf('gaussian noise, variance = %.2f', var));

nexttile;
imshow(mean_filtered, gray(256));
title(sprintf('mean filtered, psnr = %.2f, k = %d', psnr(uint8(mean_filtered), img), mean_k_size));

nexttile;
imshow(lp_filtered, gray(256));
title(sprintf('lowpass filtered, psnr = %.2f, k = %d', psnr(uint8(lp_filtered), img), lp_k_size));

nexttile;
imshow(median_filtered, gray(256));
title(sprintf('median filtered, psnr = %.2f, k = %d', psnr(median_filtered, img), median_k_size));

nexttile;
imshow(wiener_filtered, gray(256));
title(sprintf('wiener filtered, psnr = %.2f, k = %d', psnr(wiener_filtered, img), wiener_k_size));

nexttile;
imshow(alphatrimed, gray(256));
title(sprintf('alpha trim filtered, psnr = %.2f, d = %d, k = %d', psnr(uint8(alphatrimed), img), d, alpha_trim_k_size));

print(fig, 'assets/b_2', '-dpng', '-r300');
