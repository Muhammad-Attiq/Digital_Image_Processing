I = imread("gray_scale.jfif");

imshow(I);

J = I;
J(I<50) = 0;
J(I>150) = 255;

imshow(J);
