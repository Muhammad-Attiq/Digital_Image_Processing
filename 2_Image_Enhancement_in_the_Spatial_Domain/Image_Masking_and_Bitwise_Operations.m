I = imread('image2.png');
I = imresize(I, [200 200]);
mask = zeros(size(I,1), size(I,2));
mask(50:99, 50:99) = 1;
mask3 = cat(3, mask, mask, mask);  
img_mult = uint8(double(I).*mask3);
img_and = bitand(I, uint8(mask3*255));
img_or = bitor(I, uint8(mask3*255));
figure
subplot(2,2,1), imshow(I), title('Original')
subplot(2,2,2), imshow(img_mult), title('Image Multiplication')
subplot(2,2,3), imshow(img_and), title('Bitwise AND')
subplot(2,2,4), imshow(img_or), title('Bitwise OR')
