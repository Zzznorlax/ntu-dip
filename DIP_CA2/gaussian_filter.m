
filename = "lena.bmp";

img = imread(filename);

imgfft = fft2(img);
imgfft = fftshift(imgfft);

% constructs filter
sigma = 10;
gf = fspecial("gaussian", [512 512], sigma);

lp = gf;
hp = 1 - gf;

% applies filter
imglp = imgfft .* lp;
imglpi = ifft2(imglp);

imghp = imgfft .* hp;
imghpi = ifft2(imghp);

imglp = log(1 + abs(imglp));
imghp = log(1 + abs(imghp));

imgfft = log(1 + abs(imgfft));

tiledlayout(3,2);
nexttile;
imshow(ind2rgb(im2uint8(mat2gray(img)), parula(256)));
title('original lena');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(imgfft)), parula(256)));
title('lena ft');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(imgfft)), parula(256)));
title('lena ft lowpass');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(abs(imglpi))), parula(256)));
title('lena lowpass');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(imghp)), parula(256)));
title('lena ft highpass');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(abs(imghpi))), parula(256)));
title('lena highpass');
