

filename = "cameraman.tif";

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


imwrite(c0, gray(256), "outputs/bitplane_c0.tiff", "TIFF");
imwrite(c1, gray(256), "outputs/bitplane_c1.tiff", "TIFF");
imwrite(c2, gray(256), "outputs/bitplane_c2.tiff", "TIFF");
imwrite(c3, gray(256), "outputs/bitplane_c3.tiff", "TIFF");
imwrite(c4, gray(256), "outputs/bitplane_c4.tiff", "TIFF");
imwrite(c5, gray(256), "outputs/bitplane_c5.tiff", "TIFF");
imwrite(c6, gray(256), "outputs/bitplane_c6.tiff", "TIFF");
imwrite(c7, gray(256), "outputs/bitplane_c7.tiff", "TIFF");

imwrite(recon_c7, gray(256), "outputs/reconstructed_c7.tiff", "TIFF");
imwrite(recon_c67, gray(256), "outputs/reconstructed_c67.tiff", "TIFF");
imwrite(recon_c47, gray(256), "outputs/reconstructed_c47.tiff", "TIFF");

imwrite(diff_rc7, gray(256), "outputs/diff_rc7.tiff", "TIFF");
imwrite(diff_rc67, gray(256), "outputs/diff_rc67.tiff", "TIFF");
imwrite(diff_rc47, gray(256), "outputs/diff_rc47.tiff", "TIFF");


