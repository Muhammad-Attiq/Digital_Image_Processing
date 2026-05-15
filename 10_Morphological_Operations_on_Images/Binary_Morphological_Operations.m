clc;clear;close all;

i=imbinarize(rgb2gray(imread('image.png')));
se=strel('disk',3);

subplot(231),imshow(i),title('Original')
subplot(232),imshow(imdilate(i,se)),title('Dilation')
subplot(233),imshow(imerode(i,se)),title('Erosion')
subplot(234),imshow(imopen(i,se)),title('Opening')
subplot(235),imshow(imclose(i,se)),title('Closing')
