img = imread('cameraman.tif'); 
noisy_img = imnoise(img, 'salt & pepper', 0.05);

filtered_img = medfilt2(noisy_img);

subplot(1,3,1), imshow(img), title('Original');
subplot(1,3,2), imshow(noisy_img), title('Noisy');
subplot(1,3,3), imshow(filtered_img), title('Median Filtered');
