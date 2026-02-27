img = rgb2gray(imread('peppers.jfif')); img = double(img); [R, C] = size(img);
windowSizes = [3, 5]; padMethods = {'both', 'replicate'};
for p = 1:2
    figure('Name', ['Padding: ', padMethods{p}]);
    for w = 1:2
        k = windowSizes(w); padSize = (k-1)/2;
        if p == 1
            padded = padarray(img, [padSize padSize], 0); 
        else
            padded = padarray(img, [padSize padSize], 'replicate');
        end
        output = zeros(R, C);
        for i = 1:R
            for j = 1:C
                window = padded(i:i+k-1, j:j+k-1); output(i,j) = sum(window(:)) / (k*k);
            end
        end
        subplot(1,2,w); imshow(uint8(output)); title([num2str(k), 'x', num2str(k)]);
    end
end
