img = imread('peppers.png');

R = img(:, :, 1);
G = img(:, :, 2);
B = img(:, :, 3);

figure;
subplot(2,2,1); imshow(img); title('Original');
subplot(2,2,2); imshow(R); title('Red');
subplot(2,2,3); imshow(G); title('Green');
subplot(2,2,4); imshow(B); title('Blue');
