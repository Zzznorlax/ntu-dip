
filename = "inputs/walkbridge.tif";

var = 0.3;

img = imread(filename);

g = imnoise(img, 'speckle', var);

mean_k_size = 5;
mean_filter = fspecial("average", [mean_k_size, mean_k_size]);
mean_filtered = filter2(mean_filter, g);

lp_k_size = 5;
lp_filter = fspecial("gaussian", [lp_k_size, lp_k_size]);
lp_filtered = filter2(lp_filter, g);

wiener_k_size = 7;
wiener_filtered = wiener2(g, [wiener_k_size, wiener_k_size]);

outlier_kernel_size = 3;
outlier_thres = 25;
outlier_filtered = outlier(g, outlier_thres, outlier_kernel_size);

alpha_trim_k_size = 3;
d = 3;
alphatrimed = alphatrim(g, d, alpha_trim_k_size);

midpoint_kernel_size = 3;
midpoint_filtered = midpoint(g, midpoint_kernel_size);

contra_k_size = 3;
contra_q = 0;
chmean_filtered = chmean(g, contra_q, contra_k_size);

fig = figure();
t = tiledlayout(4, 2);
t.TileSpacing = 'compact';
t.Padding = 'compact';

nexttile;
imshow(g, gray(256));
title(sprintf('speckle noise, variance = %.2f', var));

nexttile;
imshow(mean_filtered, gray(256));
title(sprintf('mean filtered, psnr = %.2f, k = %d', psnr(uint8(mean_filtered), img), mean_k_size));

nexttile;
imshow(lp_filtered, gray(256));
title(sprintf('lowpass filtered, psnr = %.2f, k = %d', psnr(uint8(lp_filtered), img), lp_k_size));

nexttile;
imshow(wiener_filtered, gray(256));
title(sprintf('wiener filtered, psnr = %.2f, k = %d', psnr(wiener_filtered, img), wiener_k_size));

nexttile;
imshow(outlier_filtered, gray(256));
title(sprintf('outlier filtered, psnr = %.2f, thres = %d, k = %d', psnr(uint8(outlier_filtered), img), outlier_thres, outlier_kernel_size));

nexttile;
imshow(alphatrimed, gray(256));
title(sprintf('alpha trim filtered, psnr = %.2f, d = %d, k = %d', psnr(uint8(alphatrimed), img), d, alpha_trim_k_size));

nexttile;
imshow(midpoint_filtered, gray(256));
title(sprintf('midpoint filtered, psnr = %.2f, k = %d', psnr(uint8(midpoint_filtered), img), midpoint_kernel_size));

nexttile;
imshow(chmean_filtered, gray(256));
title(sprintf('contraharmonic mean filtered, \npsnr = %.2f, Q = %d, k = %d', psnr(uint8(chmean_filtered), img), contra_q, contra_k_size));

print(fig, 'assets/d_2', '-dpng', '-r300');
