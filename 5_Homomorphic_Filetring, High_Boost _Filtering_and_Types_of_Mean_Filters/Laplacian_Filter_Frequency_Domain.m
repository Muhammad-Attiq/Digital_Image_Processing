img=double(rgb2gray(imread('peppers.jfif')));

[M,N]=size(img);

F=fftshift(fft2(img));

[V,U]=meshgrid(1:N,1:M);

H_lap=-((U-M/2).^2+(V-N/2).^2);

res=abs(ifft2(ifftshift(F.*H_lap)));

imshow(res,[]);
