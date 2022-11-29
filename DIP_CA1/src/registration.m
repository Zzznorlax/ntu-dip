
filename = "peppers.bmp";

f = imread(filename);

sx = 0.85;
sy = 1.15;
T1=[sx 0 0 
    0 sy 0 
    0 0 1];
t1 = affine2d(T1);
fs = imwarp(f, t1);

theta = pi/6;
T2 = [cos(theta) sin(theta) 0
      -sin(theta) cos(theta) 0
      0 0 1];
t2 = affine2d(T2);
fsr = imwarp(fs, t2);

alpha = 0.75;
T3 = [1 0 0
      alpha 1 0 
      0 0 1];
t3 = affine2d(T3);
fss = imwarp(fs, t3);

[input_points,base_points] = cpselect(fs, f, 'Wait', true);
tietform = fitgeotrans(input_points, base_points, 'affine');
fs2 = imwarp(fs, tietform);
imwrite(fs2, gray(256), "outputs/transformation_fs2_8.tiff", "TIFF");

[input_points,base_points] = cpselect(fsr, f, 'Wait', true);
tietform = fitgeotrans(input_points, base_points, 'affine');
fsr2 = imwarp(fsr, tietform);
imwrite(fsr2, gray(256), "outputs/transformation_fsr2_8.tiff", "TIFF");

[input_points,base_points] = cpselect(fss, f, 'Wait', true);
tietform = fitgeotrans(input_points, base_points, 'affine');
fss2 = imwarp(fss, tietform);
imwrite(fss2, gray(256), "outputs/transformation_fss2_8.tiff", "TIFF");

% diff_fs2 = fs2 - f;
% imwrite(diff_fs2, gray(256), "outputs/transformation_diff_fs2.tiff", "TIFF");
