N = 256;
img = 255*ones(N);
c = 0;
col = 0;
blk = 23;
wht = 60;

for i = 1:N
    img(i, i) = col;
    c = c+1;
    if (col==0 && c==blk) || (col==255 && c==wht)
        col = 255 - col;
        c = 0;
    end
end

imshow(uint8(img));
