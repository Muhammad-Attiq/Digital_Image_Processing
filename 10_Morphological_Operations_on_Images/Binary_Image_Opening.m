clc;clear;close all;

i=imbinarize(rgb2gray(imread('image3.png')));
se=strel('disk',3);

o=imopen(i,se);

subplot(121),imshow(i),title('Fig 3a')
subplot(122),imshow(o),title('Fig 3b')
