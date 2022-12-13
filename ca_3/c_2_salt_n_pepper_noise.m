
filename = "inputs/woman_blonde.tif";

density = 0.4;

img = imread(filename);

g = imnoise(img, 'salt & pepper', density);

median_k_size = 7;
median_filtered = medfilt2(g, [median_k_size, median_k_size]);

alpha_trim_k_size = 3;
d = 3;
alphatrimed = alphatrim(g, d, alpha_trim_k_size);

midpoint_kernel_size = 3;
midpoint_filtered = midpoint(g, midpoint_kernel_size);

outlier_kernel_size = 3;
outlier_thres = 20;
outlier_filtered = outlier(g, outlier_thres, outlier_kernel_size);

adaptive_med_kernel_size = 3;
adaptive_med_filtered = adpmedian(g, adaptive_med_kernel_size);

fig = figure();
t = tiledlayout(3, 2);
t.TileSpacing = 'compact';
t.Padding = 'compact';

nexttile;
imshow(g, gray(256));
title(sprintf('salt and pepper noise, density = %.2f', density));

nexttile;
imshow(median_filtered, gray(256));
title(sprintf('median filtered, psnr = %.2f, k = %d', psnr(median_filtered, img), median_k_size));

nexttile;
imshow(alphatrimed, gray(256));
title(sprintf('alpha trim filtered, psnr = %.2f, d = %d, k = %d', psnr(uint8(alphatrimed), img), d, alpha_trim_k_size));

nexttile;
imshow(midpoint_filtered, gray(256));
title(sprintf('midpoint filtered, psnr = %.2f, k = %d', psnr(uint8(midpoint_filtered), img), midpoint_kernel_size));

nexttile;
imshow(outlier_filtered, gray(256));
title(sprintf('outlier filtered, psnr = %.2f, thres = %d, k = %d', psnr(uint8(outlier_filtered), img), outlier_thres, outlier_kernel_size));

nexttile;
imshow(adaptive_med_filtered, gray(256));
title(sprintf('adaptive median filtered, psnr = %.2f, k = %d', psnr(uint8(adaptive_med_filtered), img), adaptive_med_kernel_size));

print(fig, 'assets/c_2', '-dpng', '-r300');
