I=imread('cameraman.tif');
if size(I,3)==3,I=rgb2gray(I);end
I=double(I); r1=70;r2=140;s1=0;s2=255; J=zeros(size(I));
for i=1:size(I,1)
for j=1:size(I,2)
r=I(i,j);
if r<=r1
J(i,j)=(s1/r1)*r;
elseif r<=r2
J(i,j)=((s2-s1)/(r2-r1))*(r-r1)+s1;
else
J(i,j)=((255-s2)/(255-r2))*(r-r2)+s2;
end
end
end
J=uint8(J); figure;
subplot(1,2,1);imshow(uint8(I));title('Original'); 
subplot(1,2,2);imshow(J);title('Contrast Stretched');
