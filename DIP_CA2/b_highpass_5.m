
filename = "inputs/cameraman.tif";

img = imread(filename);

imgfft = fft2(img);
imgfft = fftshift(imgfft);

% constructs filter
cutoff_freq = 5;
[x, y] = meshgrid(-128:127, -128:127);
z = sqrt(x.^2 + y.^2);
cir = (z > cutoff_freq);

% applies filter
imghp = imgfft .* cir;
imghpi = ifft2(imghp);

imghp = log(1 + abs(imghp));
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
imshow(ind2rgb(im2uint8(mat2gray(imghp)), parula(256)));
title(sprintf('ft highpass, cutoff-freq = %d', cutoff_freq));

nexttile;
imshow(ind2rgb(im2uint8(mat2gray(abs(imghpi))), parula(256)));
title(sprintf('highpass, cutoff-freq = %d', cutoff_freq));

print(fig, sprintf('assets/b_highpass_%d', cutoff_freq), '-dpng', '-r300');