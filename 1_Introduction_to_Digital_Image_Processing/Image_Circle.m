function H = imcircle(R, M, N)

if R < 1 || R > min(M,N)/2
    error("INVALID Radius");
end 

H = zeros(M, N);
cx = M/2;
cy = N/2;
[x, y] = meshgrid(1:N, 1:M);
H((x-cy).^2 + (y-cx).^2 <= R^2) = 1;
imshow(H);

end

H = imcircle(20, 60, 100);
