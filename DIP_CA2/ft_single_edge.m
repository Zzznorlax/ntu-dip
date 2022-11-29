
img = [zeros(256, 128) ones(256, 128)];

imgfft = fft2(img);

imgfft_real = real(imgfft);
imgfft_imag = imag(imgfft);

imgfft_real = fftshift(imgfft_real);
imgfft_imag = fftshift(imgfft_imag);
imgfft = fftshift(imgfft);

imgfft_real = log(1 + abs(imgfft_real));
imgfft_imag = log(1 + abs(imgfft_imag));
imgfft = log(1 + abs(imgfft));

imagesc(imgfft_real);
% imagesc(imgfft_imag);

imwrite(img*256, gray(256), "src/assets/imgfft_edge.jpg", "jpg");
imwrite(imgfft_real*255, gray(256), "src/assets/imgfft_real_edge.jpg", "jpg");
imwrite(imgfft_imag*255, gray(256), "src/assets/imgfft_imag_edge.jpg", "jpg");
imwrite(imgfft*255, gray(256), "src/assets/imgfft_spec_edge.jpg", "jpg");