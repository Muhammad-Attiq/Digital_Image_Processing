img = imread('strawberry.jpg');
img = im2double(img);

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

kernel = fspecial('average', [5 5]);

R_avg = imfilter(R, kernel);
G_avg = imfilter(G, kernel);
B_avg = imfilter(B, kernel);

RGB_avg = cat(3, R_avg, G_avg, B_avg);

figure;
subplot(1,2,1); imshow(img); title('Original');
subplot(1,2,2); imshow(RGB_avg); title('RGB Averaging');

theta = acos((0.5*((R-G)+(R-B)))./(sqrt((R-G).^2+(R-B).*(G-B))+eps));
H = theta;
H(B>G) = 2*pi - H(B>G);
H = H/(2*pi);
S = 1 - (3*min(min(R,G),B))./(R+G+B+eps);
I = (R+G+B)/3;

I_avg = imfilter(I, kernel);

H2 = H*2*pi;
R2 = zeros(size(H2)); G2 = R2; B2 = R2;

idx = H2>=0 & H2<2*pi/3;
B2(idx) = I_avg(idx).*(1-S(idx));
R2(idx) = I_avg(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
G2(idx) = 3*I_avg(idx)-(R2(idx)+B2(idx));

idx = H2>=2*pi/3 & H2<4*pi/3;
H2(idx) = H2(idx)-2*pi/3;
R2(idx) = I_avg(idx).*(1-S(idx));
G2(idx) = I_avg(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
B2(idx) = 3*I_avg(idx)-(R2(idx)+G2(idx));

idx = H2>=4*pi/3 & H2<=2*pi;
H2(idx) = H2(idx)-4*pi/3;
G2(idx) = I_avg(idx).*(1-S(idx));
B2(idx) = I_avg(idx).*(1+(S(idx).*cos(H2(idx)))./(cos(pi/3-H2(idx))+eps));
R2(idx) = 3*I_avg(idx)-(G2(idx)+B2(idx));

HSI_avg = cat(3, R2, G2, B2);

figure;
subplot(1,2,1); imshow(RGB_avg); title('RGB Averaging Result');
subplot(1,2,2); imshow(HSI_avg); title('Intensity Averaging Result');
