I=imread('original.jfif');
W=imread('watermark.jpg');
if size(I,3)==3;I=rgb2gray(I);end
if size(W,3)==3;W=rgb2gray(W);end
W=imresize(W,[size(I,1) size(I,2)]);
I=uint8(I);W=uint8(W);
Watermarked=bitxor(I,W);
figure;
subplot(1,3,1);imshow(I);title('Original Image');
subplot(1,3,2);imshow(Watermarked);title('Watermarked Image');
Recovered=bitxor(Watermarked,W);
subplot(1,3,3);imshow(Recovered);title('Recovered Image');
