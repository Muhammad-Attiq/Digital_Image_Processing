img = imread('coins.png');
pseudo_colored = ind2rgb(gray2ind(img, 256), jet(256));
imshow(pseudo_colored);
imwrite(pseudo_colored, 'coins_pseudo.png');
