
[x, y] = meshgrid(1:256, 1:256);
img= (x+y<329) & (x+y>182) & (x-y>-67) & (x-y<73);

imgfft = fft2(img);

imgfft_real = real(imgfft);
imgfft_imag = imag(imgfft);

imgfft_real = fftshift(imgfft_real);
imgfft_imag = fftshift(imgfft_imag);
imgfft = fftshift(imgfft);

imgfft_real = log(1 + abs(imgfft_real));
imgfft_imag = log(1 + abs(imgfft_imag));
imgfft = log(1 + abs(imgfft));

% imagesc(imgfft_real);
% imagesc(imgfft_imag);

imwrite(img*256, gray(256), "src/assets/imgfft_rotated_box.jpg", "jpg");
imwrite(imgfft_real*255, gray(256), "src/assets/imgfft_real_rotated_box.jpg", "jpg");
imwrite(imgfft_imag*255, gray(256), "src/assets/imgfft_imag_rotated_box.jpg", "jpg");
imwrite(imgfft*255, gray(256), "src/assets/imgfft_spec_rotated_box.jpg", "jpg");