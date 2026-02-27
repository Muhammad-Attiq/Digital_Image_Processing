img = im2double(imread('moon.tif')); 

h_manual = [0, 1, 0; 1, -4, 1; 0, 1, 0];
laplacian_manual = imfilter(img, h_manual);

h_fspecial = fspecial('laplacian', 0); 
laplacian_auto = imfilter(img, h_fspecial);

subplot(1,3,1), imshow(img), title('Original');
subplot(1,3,2), imshow(laplacian_manual, []), title('Manual Mask');
subplot(1,3,3), imshow(laplacian_auto, []), title('fspecial Mask');
