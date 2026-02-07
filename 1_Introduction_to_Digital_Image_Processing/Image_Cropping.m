I = imread('image.jfif');
figure, imshow(I);

rect = [50 50 200 150];
J1 = imcrop(I, rect);
figure, imshow(J1);

J2 = I(50:200, 50:250, :);
figure, imshow(J2);
