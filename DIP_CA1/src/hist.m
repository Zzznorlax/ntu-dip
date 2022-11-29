
filename = "pollen.tif";

x = imread(filename);

% imhist(x);

% part (a)
eq_x = histeq(x);

imhist(eq_x);

% part (b)
n = 2;  
Idouble = im2double(x); 
avg = mean2(Idouble);
sigma = std2(Idouble);

adj_x = imadjust(x,[avg-n*sigma avg+n*sigma],[]);

imshow(adj_x);