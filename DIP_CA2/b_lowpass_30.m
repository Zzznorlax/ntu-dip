
filename = "inputs/cameraman.tif";

img = imread(filename);

imgfft = fft2(img);
imgfft = fftshift(imgfft);

% constructs filter
cutoff_freq = 30;
[x, y] = meshgrid(-128:127, -128:127);
z = sqrt(x.^2 + y.^2);
cir = (z < cutoff_freq);

% applies filter
imglp = imgfft .* cir;
imglpi = ifft2(imglp);

imglp = log(1 + abs(imglp));
imgfft = log(1 + abs(imgfft));

fig = figure();
t = tiledlayout(2, 2);
t.TileSpacing = 'compact';
t.Padding = 'compact';

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(img)), parula(256)));
title('original image');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(imgfft)), parula(256)));
title('ft');

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(imglp)), parula(256)));
title(sprintf('ft lowpass, cutoff-freq = %d', cutoff_freq));

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(abs(imglpi))), parula(256)));
title(sprintf('lowpass, cutoff-freq = %d', cutoff_freq));

print(fig, 'assets/b_lowpass_30', '-dpng', '-r300');
