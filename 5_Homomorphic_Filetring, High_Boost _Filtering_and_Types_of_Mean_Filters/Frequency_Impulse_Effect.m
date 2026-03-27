img=rgb2gray(imread('peppers.png')); 

f=fftshift(fft2(double(img))); 
[r,c]=size(f);

f_low=f; 
f_low(round(r/2)+2,round(c/2)+2)=f_low(round(r/2)+2,round(c/2)+2)+1e6;

res_low=real(ifft2(ifftshift(f_low)));

f_high=f; 
f_high(round(r/2)+50,round(c/2)+50)=f_high(round(r/2)+50,round(c/2)+50)+1e6;

res_high=real(ifft2(ifftshift(f_high)));

subplot(1,3,1);imshow(img,[]);title('Original');
subplot(1,3,2);imshow(res_low,[]);title('Added Near Origin');
subplot(1,3,3);imshow(res_high,[]);title('Added Away from Origin');
