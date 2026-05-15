clc;clear;close all;

i=imbinarize(rgb2gray(imread('image4.png')));

b=bwmorph(i,'remove');
f=imfill(i,'holes');

subplot(131),imshow(i),title('Original')
subplot(132),imshow(b),title('Boundary')
subplot(133),imshow(f),title('Filled')
