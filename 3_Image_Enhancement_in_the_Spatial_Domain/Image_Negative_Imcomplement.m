I = imread('image1.png');

if size(I,3) == 3
    I = rgb2gray(I);
end

Negative1 = imcomplement(I);

figure;
subplot(1,2,1); imshow(I); title('Original Image');
subplot(1,2,2); imshow(Negative1); title('Negative using imcomplement');
