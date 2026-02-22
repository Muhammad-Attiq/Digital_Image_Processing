I=imread('cameraman.tif');
I=im2double(I);
g=[0.3 0.5 1 2 3];
figure;
subplot(2,3,1);imshow(I);title('Original');
for k=1:length(g)
J=I.^g(k);
subplot(2,3,k+1);imshow(J);title(['\gamma=',num2str(g(k))]);
end
