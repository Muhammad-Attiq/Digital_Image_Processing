noisyImage = im2double(imread('your_noisy_image.jpg'));

fourierNoisy = fft2(noisyImage);
fourierNoisyShifted = fftshift(fourierNoisy);

figure;
subplot(2, 2, 1);
imshow(noisyImage);
title('Noisy Image');

subplot(2, 2, 2);
imshow(log(1 + abs(fourierNoisyShifted)), []);
title('Fourier Transform of Noisy Image');

rows = size(noisyImage, 1);
cols = size(noisyImage, 2);
centerRow = rows / 2;
centerCol = cols / 2;
radius = 30;
bandWidth = 10;
order = 2;

[u, v] = meshgrid(1:cols, 1:rows);
distanceFromCenter = sqrt((u - centerCol).^2 + (v - centerRow).^2);

idealBandRejectFilter = ones(rows, cols);
idealBandRejectFilter(distanceFromCenter > radius & distanceFromCenter < radius + bandWidth) = 0;

butterworthBandRejectFilter = 1 ./ (1 + (bandWidth ./ (distanceFromCenter - radius) .* (distanceFromCenter > radius & distanceFromCenter < radius + bandWidth)).^(2 * order));

gaussianBandRejectFilter = 1 - exp(-((distanceFromCenter - radius).^2 ./ (2 * (bandWidth^2))));

filteredIdeal = fourierNoisyShifted .* idealBandRejectFilter;
filteredButterworth = fourierNoisyShifted .* butterworthBandRejectFilter;
filteredGaussian = fourierNoisyShifted .* gaussianBandRejectFilter;

filteredImageIdeal = ifft2(ifftshift(filteredIdeal));
filteredImageButterworth = ifft2(ifftshift(filteredButterworth));
filteredImageGaussian = ifft2(ifftshift(filteredGaussian));

subplot(2, 2, 3);
imshow(abs(filteredImageIdeal), []);
title('Ideal Band-Reject Filter');

subplot(2, 2, 4);
imshow(abs(filteredImageButterworth), []);
title('Butterworth Band-Reject Filter');

figure;
imshow(abs(filteredImageGaussian), []);
title('Gaussian Band-Reject Filter');
