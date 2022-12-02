

filename = "inputs/peppers.bmp";

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

fig = figure();
t = tiledlayout(2, 2);
t.TileSpacing = 'compact';
t.Padding = 'compact';

nexttile;
imshow(fs, gray(256));
title('fs');

nexttile;
imshow(fsr, gray(256));
title('fsr');

nexttile;
imshow(fss, gray(256));
title('fss');

print(fig, 'assets/transformation', '-dpng', '-r300');
