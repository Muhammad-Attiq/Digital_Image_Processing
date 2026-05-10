img = imread('peppers.png');
img = im2double(img);

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

theta = acos((0.5*((R-G)+(R-B)))./(sqrt((R-G).^2+(R-B).*(G-B))+eps));
H = theta;
H(B>G) = 2*pi - H(B>G);
H = H/(2*pi);

S = 1 - (3*min(min(R,G),B))./(R+G+B+eps);
I = (R+G+B)/3;

figure;
subplot(2,2,1); imshow(cat(3,H,S,I)); title('HSI');
subplot(2,2,2); imshow(H); title('Hue');
subplot(2,2,3); imshow(S); title('Saturation');
subplot(2,2,4); imshow(I); title('Intensity');

H2 = H*2*pi;
R2 = zeros(size(H2)); G2 = R2; B2 = R2;

idx = H2>=0 & H2<2*pi/3;
B2(idx) = I(idx).*(1-S(idx));
R2(idx) = I(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
G2(idx) = 3*I(idx)-(R2(idx)+B2(idx));

idx = H2>=2*pi/3 & H2<4*pi/3;
H2(idx) = H2(idx)-2*pi/3;
R2(idx) = I(idx).*(1-S(idx));
G2(idx) = I(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
B2(idx) = 3*I(idx)-(R2(idx)+G2(idx));

idx = H2>=4*pi/3 & H2<=2*pi;
H2(idx) = H2(idx)-4*pi/3;
G2(idx) = I(idx).*(1-S(idx));
B2(idx) = I(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
R2(idx) = 3*I(idx)-(G2(idx)+B2(idx));

figure;
imshow(cat(3,R2,G2,B2)); title('Converted Back to RGB');
