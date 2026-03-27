img=double(rgb2gray(imread('peppers.jfif')));

[M,N]=size(img);
F=fftshift(fft2(img));
[V,U]=meshgrid(1:N,1:M);
D=sqrt((U-M/2).^2+(V-N/2).^2);
cutoffs=[10,50,100];
figure;

for i=1:3
D0=cutoffs(i);
H_id=double(D>D0); H_bu=1./(1+(D0./D).^(2*2)); H_ga=1-exp(-(D.^2)./(2*(D0^2)));
subplot(3,3,i),imshow(abs(ifft2(ifftshift(F.*H_id))),[]),title(['Ideal ',num2str(D0)]);
subplot(3,3,i+3),imshow(abs(ifft2(ifftshift(F.*H_bu))),[]),title(['Butterworth ',num2str(D0)]);
subplot(3,3,i+6),imshow(abs(ifft2(ifftshift(F.*H_ga))),[]),title(['Gaussian ',num2str(D0)]);
end
