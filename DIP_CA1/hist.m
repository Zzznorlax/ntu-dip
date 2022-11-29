
filename = "aerial.tif";

x = imread(filename);

% figure
% subplot(1,3,1)
% imshow(x)
% subplot(1,3,2:3)
% imhist(x)

% part (a)
eq_x = histeq(x);

imhist(eq_x);

% figure
% subplot(1,3,1)
% imshow(eq_x)
% subplot(1,3,2:3)
% imhist(eq_x)

% part (b)
n = 1;  
Idouble = im2double(x); 
avg = mean2(Idouble);
sigma = std2(Idouble);

adj_x = imadjust(x,[avg-n*sigma avg+n*sigma],[]);

figure
subplot(1,3,1)
imshow(adj_x)
subplot(1,3,2:3)
imhist(adj_x)
