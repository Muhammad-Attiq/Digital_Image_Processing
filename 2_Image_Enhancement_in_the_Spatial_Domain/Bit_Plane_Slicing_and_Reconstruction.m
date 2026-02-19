I=imread('Image1.png');
if size(I,3)==3;I=rgb2gray(I);end
I=uint8(I);

bit8=bitget(I,8);
bit7=bitget(I,7);

Reconstructed=uint8(bit8*128+bit7*64);

figure;
subplot(1,3,1);imshow(I);title('Original');
subplot(1,3,2);imshow(bit8);title('8th Bit Plane');
subplot(1,3,3);imshow(Reconstructed);title('Reconstructed (8+7)');
