I1=uint8(imread('1.png'));

I2=uint8(imread('2.png'));

[counts1,~]=hist(double(I1(:)),0:255);

cdf1=cumsum(counts1)/numel(I1);

map1=uint8(255*cdf1); J1=map1(double(I1)+1);

[counts2,~]=hist(double(I2(:)),0:255);

cdf2=cumsum(counts2)/numel(I2); map2=uint8(255*cdf2);

J2=map2(double(I2)+1); figure;

subplot(2,4,1);imshow(I1);title('Img1 Original');

subplot(2,4,2);bar(0:255,counts1);title('Img1 Hist');

subplot(2,4,3);imshow(J1);title('Img1 Equalized');

[counts1e,~]=hist(double(J1(:)),0:255);

subplot(2,4,4);bar(0:255,counts1e);title('Img1 Eq Hist');

subplot(2,4,5);imshow(I2);title('Img2 Original');

subplot(2,4,6);bar(0:255,counts2);title('Img2 Hist');

subplot(2,4,7);imshow(J2);title('Img2 Equalized');

[counts2e,~]=hist(double(J2(:)),0:255);

subplot(2,4,8);bar(0:255,counts2e);title('Img2 Eq Hist');
