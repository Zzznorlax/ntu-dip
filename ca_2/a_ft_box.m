
img = zeros(256, 256);
img(78:178, 78:178) = 1;

imgfft = fft2(img);

imgfft_real = real(imgfft);
imgfft_imag = imag(imgfft);

imgfft_real = fftshift(imgfft_real);
imgfft_imag = fftshift(imgfft_imag);
imgfft = fftshift(imgfft);

imgfft_real = log(1 + abs(imgfft_real));
imgfft_imag = log(1 + abs(imgfft_imag));
imgfft = log(1 + abs(imgfft));

fig = figure();
t = tiledlayout(2,2);
t.TileSpacing = 'compact';
t.Padding = 'compact';

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(img)), parula(256)));
title('original image');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(imgfft_real)), parula(256)));
title('real part');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(imgfft_imag)), parula(256)));
title('imaginary part');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(imgfft)), parula(256)));
title('ft');

print(fig, 'assets/a_box', '-dpng', '-r300');
