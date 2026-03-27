img = imread('peppers.jfif');
if size(img, 3) == 3, img = rgb2gray(img); end
img = double(img);

[M, N] = size(img); F = fftshift(fft2(img));

u = 0:(M-1); v = 0:(N-1);
idx = find(u > M/2); u(idx) = u(idx) - M; idy = find(v > N/2); v(idy) = v(idy) - N;
[V, U] = meshgrid(v, u);
D = sqrt(U.^2 + V.^2); D = fftshift(D); cutoffs = [10, 50, 100]; figure;

for i = 1:3
    D0 = cutoffs(i);
    H_ideal = double(D <= D0);
    H_butter = 1 ./ (1 + (D./D0).^(2*2));
    H_gauss = exp(-(D.^2)./(2*(D0^2)));
    subplot(3,3,i), imshow(abs(ifft2(ifftshift(F .* H_ideal))), []), title(['Ideal ', num2str(D0)]);
    subplot(3,3,i+3), imshow(abs(ifft2(ifftshift(F .* H_butter))), []), title(['Butterworth ', num2str(D0)]);
    subplot(3,3,i+6), imshow(abs(ifft2(ifftshift(F .* H_gauss))), []), title(['Gaussian ', num2str(D0)]);
end
