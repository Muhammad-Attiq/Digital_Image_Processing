img = imread('peppers.jfif');
grayImg = rgb2gray(img);
sizes = [3, 5, 9, 15, 35];
methods = {0, 'replicate', 'circular'};
titles = {'Zero Padding', 'Pixel Repeating', 'Circular'};

for m = 1:3
    figure('Name', titles{m});
    for s = 1:5
        h = fspecial('average', sizes(s));
        smoothed = imfilter(grayImg, h, methods{m});
       
        subplot(1, 5, s);
        imshow(smoothed);
        title([num2str(sizes(s)), 'x', num2str(sizes(s))]);
    end
end
