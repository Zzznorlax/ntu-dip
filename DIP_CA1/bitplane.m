

filename = "cameraman.tif";

x = imread(filename);

xd = double(x);

c0 = 255 * mod(xd, 2);
c1 = 255 * mod(floor(xd / 2), 2);
c2 = 255 * mod(floor(xd / 4), 2);
c3 = 255 * mod(floor(xd / 8), 2);
c4 = 255 * mod(floor(xd / 16), 2);
c5 = 255 * mod(floor(xd / 32), 2);
c6 = 255 * mod(floor(xd / 64), 2);
c7 = 255 * mod(floor(xd / 128), 2);

ct = x > 127;
all(c7(:) == ct(:))

recon_c7 = c7 * 2^7;
recon_c67 = c6 * 2^6 + c7 * 2^7;
recon_c47 = c4 * 2^4 + c7 * 2^7;

diff_rc7 = xd - recon_c7;
diff_rc67 = xd - recon_c67;
diff_rc47 = xd - recon_c47;


imwrite(c0, gray(256), "src/assets/bitplane_c0.jpg", "jpg");
imwrite(c1, gray(256), "src/assets/bitplane_c1.jpg", "jpg");
imwrite(c2, gray(256), "src/assets/bitplane_c2.jpg", "jpg");
imwrite(c3, gray(256), "src/assets/bitplane_c3.jpg", "jpg");
imwrite(c4, gray(256), "src/assets/bitplane_c4.jpg", "jpg");
imwrite(c5, gray(256), "src/assets/bitplane_c5.jpg", "jpg");
imwrite(c6, gray(256), "src/assets/bitplane_c6.jpg", "jpg");
imwrite(c7, gray(256), "src/assets/bitplane_c7.jpg", "jpg");

imwrite(recon_c7, gray(256), "src/assets/reconstructed_c7.jpg", "jpg");
imwrite(recon_c67, gray(256), "src/assets/reconstructed_c67.jpg", "jpg");
imwrite(recon_c47, gray(256), "src/assets/reconstructed_c47.jpg", "jpg");

imwrite(diff_rc7, gray(256), "src/assets/diff_rc7.jpg", "jpg");
imwrite(diff_rc67, gray(256), "src/assets/diff_rc67.jpg", "jpg");
imwrite(diff_rc47, gray(256), "src/assets/diff_rc47.jpg", "jpg");


