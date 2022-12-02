

filename = "inputs/cameraman.tif";

x = imread(filename);

xd = double(x);

c0 = mod(xd, 2);
c1 = mod(floor(xd / 2), 2);
c2 = mod(floor(xd / 4), 2);
c3 = mod(floor(xd / 8), 2);
c4 = mod(floor(xd / 16), 2);
c5 = mod(floor(xd / 32), 2);
c6 = mod(floor(xd / 64), 2);
c7 = mod(floor(xd / 128), 2);

ct = x > 127;
all(c7(:) == ct(:));

recon_c7 = c7 * 2^7;
recon_c67 = c6 * 2^6 + c7 * 2^7;
recon_c47 = c4 * 2^4 + c7 * 2^7;

diff_rc7 = xd - recon_c7;
diff_rc67 = xd - recon_c67;
diff_rc47 = xd - recon_c47;

fig = figure();
t = tiledlayout(4, 4);
t.TileSpacing = 'compact';
t.Padding = 'compact';

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(c0)), parula(256)));
title('c0');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(c1)), parula(256)));
title('c1');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(c2)), parula(256)));
title('c2');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(c3)), parula(256)));
title('c3');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(c4)), parula(256)));
title('c4');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(c5)), parula(256)));
title('c5');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(c6)), parula(256)));
title('c6');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(c7)), parula(256)));
title('c7');

nexttile;
imshow(recon_c7, gray(256));
title('reconstruced c7');

nexttile;
imshow(recon_c67, gray(256));
title('reconstruced c67');

nexttile;
imshow(recon_c47, gray(256));
title('reconstruced c47');

nexttile;
imshow(diff_rc7, gray(256));
title('diff reconstructed c7');

nexttile;
imshow(diff_rc67, gray(256));
title('diff reconstructed c67');

nexttile;
imshow(diff_rc47, gray(256));
title('diff reconstructed c47');

print(fig, 'assets/bitplane', '-dpng', '-r300');
