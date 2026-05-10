pout = imread('pout.tif');
rice = imread('rice.png');

if size(pout, 3) == 3, pout = rgb2gray(pout); end
if size(rice, 3) == 3, rice = rgb2gray(rice); end

target_size = [min(size(pout,1), size(rice,1)), min(size(pout,2), size(rice,2))];
pout = imresize(pout, [target_size(1), target_size(2)]);
rice = imresize(rice, [target_size(1), target_size(2)]);

F_pout = fft2(double(pout));
F_rice = fft2(double(rice));

F_pout_shifted = fftshift(F_pout);
F_rice_shifted = fftshift(F_rice);

mag_pout = abs(F_pout_shifted);
phase_pout = angle(F_pout_shifted);
mag_rice = abs(F_rice_shifted);
phase_rice = angle(F_rice_shifted);

F_pout_swapped = mag_pout .* exp(1i * phase_rice);
F_rice_swapped = mag_rice .* exp(1i * phase_pout);

F_pout_swapped = ifftshift(F_pout_swapped);
F_rice_swapped = ifftshift(F_rice_swapped);

reconstructed_pout = real(ifft2(F_pout_swapped));
reconstructed_rice = real(ifft2(F_rice_swapped));

reconstructed_pout = uint8(255 * mat2gray(reconstructed_pout));
reconstructed_rice = uint8(255 * mat2gray(reconstructed_rice));

figure;
subplot(2, 2, 1); imshow(pout); title('Original Pout');
subplot(2, 2, 2); imshow(rice); title('Original Rice');
subplot(2, 2, 3); imshow(reconstructed_pout); title('Pout with Rice Phase');
subplot(2, 2, 4); imshow(reconstructed_rice); title('Rice with Pout Phase');
