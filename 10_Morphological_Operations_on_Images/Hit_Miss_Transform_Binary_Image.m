clc;clear;close all;

i=imbinarize(rgb2gray(imread('image.png')));

se1=[0 0 0;1 1 1;0 0 0];
se2=[1 1 1;0 0 0;1 1 1];

h=bwhitmiss(i,se1,se2);

subplot(121),imshow(i),title('Original')
subplot(122),imshow(h),title('Hit-Miss')
