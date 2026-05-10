img = imread('image.png');
img = im2double(img);

center = [0.6863, 0.1608, 0.1922];
W = 0.2549;

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

cube_mask = (abs(R - center(1)) <= W/2) & ...
            (abs(G - center(2)) <= W/2) & ...
            (abs(B - center(3)) <= W/2);

sliced_img = img;
sliced_img(repmat(~cube_mask, [1 1 3])) = 0;

figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(sliced_img); title('Color Sliced Image');

imwrite(sliced_img, 'color_sliced.png');
