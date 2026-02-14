A = imread('coins.png');

if size(A,3) == 3
    A = rgb2gray(A);   
end

figure;

for k = 1:8
    B = bitand(A, 2^(k-1));   
    subplot(2,4,k);
    imshow(B, []);           
    title(['Bit Plane ', num2str(k)]);
end
