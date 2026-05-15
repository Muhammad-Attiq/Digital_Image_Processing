clc;clear;close all;

i=imbinarize(rgb2gray(imread('image2.png')));
se=strel('disk',3);

d=imdilate(i,se);

subplot(121),imshow(i),title('Original')
subplot(122),imshow(d),title('Dilation')
