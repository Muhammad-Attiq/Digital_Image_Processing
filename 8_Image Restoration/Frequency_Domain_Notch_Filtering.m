t = im2double(imread('cameraman.tif'));

s = size(t);
[x, y] = meshgrid(1:s(1), 1:s(2));
p = sin((x + y)/5 + y/7 + 1);
tp = (t + p/2) / 2;

figure;
subplot(1, 3, 1);
imshow(t);
title('Original Image');

subplot(1, 3, 2);
imshow(tp);
title('Noisy Image');

ft_tp = fft2(tp);
ft_tp_shifted = fftshift(ft_tp);

subplot(1, 3, 3);
imshow(log(1 + abs(ft_tp_shifted)), []);
title('Fourier Transform of Noisy Image');

imtool(log(1 + abs(ft_tp_shifted)), []);

a = 30;
b = 30;
radius = 5;

notch_filter = ones(s(1), s(2));
for i = 1:s(1)
    for j = 1:s(2)
        if ((i - a)^2 + (j - b)^2 <= radius^2) || ((i - (s(1) - a))^2 + (j - (s(2) - b))^2 <= radius^2)
            notch_filter(i, j) = 0;
        end
    end
end

filtered_ft_tp = ft_tp_shifted .* notch_filter;
filtered_tp = ifft2(ifftshift(filtered_ft_tp));

figure;
subplot(1, 2, 1);
imshow(abs(filtered_tp), []);
title('Filtered Image');

subplot(1, 2, 2);
imshow(log(1 + abs(filtered_ft_tp)), []);
title('Filtered Fourier Transform');
