I=imread('cameraman.tif');
if size(I,3)==3,I=rgb2gray(I);end
lowhigh=stretchlim(I);
J=imadjust(I,lowhigh,[1 0]);
figure;
subplot(1,2,1);imshow(I);title('Original');
subplot(1,2,2);imshow(J);title('Negative');
