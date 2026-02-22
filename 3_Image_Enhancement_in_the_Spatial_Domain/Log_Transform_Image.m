I=imread('image1.png');
if size(I,3)==3;I=rgb2gray(I);end
I=double(I);
c=255/log(1+max(I(:)));
Log_Image=c*log(1+I);
Log_Image=uint8(Log_Image);
figure;subplot(1,2,1);imshow(uint8(I));title('Original Image');
subplot(1,2,2);imshow(Log_Image);title('Log Transformed Image');
