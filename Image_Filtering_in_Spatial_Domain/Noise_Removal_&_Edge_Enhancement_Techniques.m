img = im2double(imread('cameraman.tif'));
[M, N] = size(img);
noisy = imnoise(img, 'salt & pepper', 0.05);
med_filtered = medfilt2(noisy);
h_mask = [0 1 0; 1 -4 1; 0 1 0];
lap_manual = imfilter(img, h_mask);
lap_fspec = imfilter(img, fspecial('laplacian', 0));
lap_eq = zeros(M, N);
for i = 2:M-1
    for j = 2:N-1
        lap_eq(i,j) = img(i+1,j) + img(i-1,j) + img(i,j+1) + img(i,j-1) - 4*img(i,j);
    end
end
g = zeros(M, N);
k = 0.5; Mg = mean2(img);
for i = 2:M-1
    for j = 2:N-1
        Sxy = img(i-1:i+1, j-1:j+1);
        msxy = mean2(Sxy);
        sigmasxy = std2(Sxy);
        if sigmasxy > 0
            Asxy = (k * Mg) / sigmasxy;
            g(i,j) = Asxy * (img(i,j) - msxy) + msxy;
        else
            g(i,j) = img(i,j);
        end
    end
end
subplot(2,3,1), imshow(noisy), title('Task 3: Noisy');
subplot(2,3,2), imshow(med_filtered), title('Task 3: Median');
subplot(2,3,3), imshow(lap_fspec, []), title('Task 4: fspecial');
subplot(2,3,4), imshow(lap_eq, []), title('Post-Lab 1: Eq');
subplot(2,3,5), imshow(g), title('Post-Lab 2: Adaptive');
