rgb = imread('peppers.png');
rgb = im2double(rgb);

R = rgb(:,:,1);
G = rgb(:,:,2);
B = rgb(:,:,3);

theta = acos((0.5*((R-G)+(R-B)))./(sqrt((R-G).^2+(R-B).*(G-B))+eps));
H = theta;
H(B>G) = 2*pi - H(B>G);
H = H/(2*pi);

S = 1 - 3.*(min(min(R,G),B)./(R+G+B+eps));
I = (R+G+B)/3;

hsi = cat(3, H, S, I);

lap = [0 -1 0; -1 4 -1; 0 -1 0];

I_filtered = imfilter(I, lap, 'replicate');
hsi_filtered = hsi;
hsi_filtered(:,:,3) = I_filtered;
hsi_result = hsi2rgb(hsi_filtered);

Rf = imfilter(R, lap, 'replicate');
Gf = imfilter(G, lap, 'replicate');
Bf = imfilter(B, lap, 'replicate');
rgb_result = cat(3, Rf, Gf, Bf);

difference = imabsdiff(rgb_result, hsi_result);

figure;
subplot(2,2,1); imshow(rgb); title('Original RGB');
subplot(2,2,2); imshow(rgb_result); title('RGB Space Laplacian');
subplot(2,2,3); imshow(hsi_result); title('HSI Space Laplacian');
subplot(2,2,4); imshow(difference, []); title('Difference');

function rgb_out = hsi2rgb(hsi)
    H = hsi(:,:,1)*2*pi;
    S = hsi(:,:,2);
    I = hsi(:,:,3);
    
    R = zeros(size(H));
    G = zeros(size(H));
    B = zeros(size(H));
    
    idx = (H >= 0) & (H < 2*pi/3);
    B(idx) = I(idx).*(1 - S(idx));
    R(idx) = I(idx).*(1 + (S(idx).*cos(H(idx)))./cos(pi/3 - H(idx)));
    G(idx) = 3*I(idx) - (R(idx) + B(idx));
    
    idx = (H >= 2*pi/3) & (H < 4*pi/3);
    H(idx) = H(idx) - 2*pi/3;
    R(idx) = I(idx).*(1 - S(idx));
    G(idx) = I(idx).*(1 + (S(idx).*cos(H(idx)))./cos(pi/3 - H(idx)));
    B(idx) = 3*I(idx) - (R(idx) + G(idx));
    
    idx = (H >= 4*pi/3) & (H < 2*pi);
    H(idx) = H(idx) - 4*pi/3;
    G(idx) = I(idx).*(1 - S(idx));
    B(idx) = I(idx).*(1 + (S(idx).*cos(H(idx)))./cos(pi/3 - H(idx)));
    R(idx) = 3*I(idx) - (G(idx) + B(idx));
    
    rgb_out = cat(3, R, G, B);
end
