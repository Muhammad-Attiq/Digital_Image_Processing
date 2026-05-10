img = imread('strawberry.jpg');
img = im2double(img);

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

R_ce = imadjust(R);
G_ce = imadjust(G);
B_ce = imadjust(B);
RGB_ce = cat(3, R_ce, G_ce, B_ce);

theta = acos((0.5*((R-G)+(R-B)))./(sqrt((R-G).^2+(R-B).*(G-B))+eps));
H = theta;
H(B>G) = 2*pi - H(B>G);
H = H/(2*pi);
S = 1 - (3*min(min(R,G),B))./(R+G+B+eps);
I = (R+G+B)/3;

I_ce = imadjust(I);

H2 = H*2*pi;
R2 = zeros(size(H2)); G2 = R2; B2 = R2;

idx = H2>=0 & H2<2*pi/3;
B2(idx) = I_ce(idx).*(1-S(idx));
R2(idx) = I_ce(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
G2(idx) = 3*I_ce(idx)-(R2(idx)+B2(idx));

idx = H2>=2*pi/3 & H2<4*pi/3;
H2(idx) = H2(idx)-2*pi/3;
R2(idx) = I_ce(idx).*(1-S(idx));
G2(idx) = I_ce(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
B2(idx) = 3*I_ce(idx)-(R2(idx)+G2(idx));

idx = H2>=4*pi/3 & H2<=2*pi;
H2(idx) = H2(idx)-4*pi/3;
G2(idx) = I_ce(idx).*(1-S(idx));
B2(idx) = I_ce(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
R2(idx) = 3*I_ce(idx)-(G2(idx)+B2(idx));

HSI_ce = cat(3, R2, G2, B2);

figure;
subplot(1,3,1); imshow(img); title('Original');
subplot(1,3,2); imshow(RGB_ce); title('Contrast: RGB Components');
subplot(1,3,3); imshow(HSI_ce); title('Contrast: Intensity Component');

R_he = histeq(R);
G_he = histeq(G);
B_he = histeq(B);
RGB_he = cat(3, R_he, G_he, B_he);

I_he = histeq(I);

H2 = H*2*pi;
R2 = zeros(size(H2)); G2 = R2; B2 = R2;

idx = H2>=0 & H2<2*pi/3;
B2(idx) = I_he(idx).*(1-S(idx));
R2(idx) = I_he(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
G2(idx) = 3*I_he(idx)-(R2(idx)+B2(idx));

idx = H2>=2*pi/3 & H2<4*pi/3;
H2(idx) = H2(idx)-2*pi/3;
R2(idx) = I_he(idx).*(1-S(idx));
G2(idx) = I_he(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
B2(idx) = 3*I_he(idx)-(R2(idx)+G2(idx));

idx = H2>=4*pi/3 & H2<=2*pi;
H2(idx) = H2(idx)-4*pi/3;
G2(idx) = I_he(idx).*(1-S(idx));
B2(idx) = I_he(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
R2(idx) = 3*I_he(idx)-(G2(idx)+B2(idx));

HSI_he = cat(3, R2, G2, B2);

figure;
subplot(1,3,1); imshow(img); title('Original');
subplot(1,3,2); imshow(RGB_he); title('HistEq: RGB Components');
subplot(1,3,3); imshow(HSI_he); title('HistEq: Intensity Component');
