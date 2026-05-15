clc;clear;close all;

i=rgb2gray(imread('image.png'));
se=strel('disk',5);

t=imtophat(i,se);
b=imbothat(i,se);

subplot(131),imshow(i),title('Original')
subplot(132),imshow(t),title('Top Hat')
subplot(133),imshow(b),title('Bottom Hat')
