img = imread('image.png');
img_double = im2double(img);
center = [0.6863, 0.1608, 0.1922];
R = 0.1765;

distance_sq = (img_double(:,:,1) - center(1)).^2 + ...
              (img_double(:,:,2) - center(2)).^2 + ...
              (img_double(:,:,3) - center(3)).^2;

output = img_double;
mask = distance_sq > R^2;
output(repmat(mask, [1, 1, 3])) = 0.5;

imshow(output);
title('Color Slicing using Spherical Equation 6.5-8');
