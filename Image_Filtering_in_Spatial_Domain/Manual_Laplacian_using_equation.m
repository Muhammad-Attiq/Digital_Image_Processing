img = im2double(imread('moon.tif'));
[rows, cols] = size(img);
laplacian_out = zeros(rows, cols);

for i = 2:rows-1
    for j = 2:cols-1
        laplacian_out(i,j) = img(i+1,j) + img(i-1,j) + img(i,j+1) + img(i,j-1) - 4*img(i,j);
    end
end

subplot(1,2,1), imshow(img), title('Original');
subplot(1,2,2), imshow(laplacian_out, []), title('Equation Result');
