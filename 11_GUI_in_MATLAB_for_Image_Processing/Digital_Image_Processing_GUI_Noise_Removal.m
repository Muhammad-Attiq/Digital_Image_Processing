function guimain
    fig = uifigure('Name', 'Digital Image Processing Lab 12', 'Position', [500 500 400 300]);
    
    uilabel(fig, 'Position', [100 250 200 30], 'Text', 'Digital Image Processing Lab 12', 'FontSize', 14, 'FontWeight', 'bold');
    uilabel(fig, 'Position', [100 200 200 25], 'Text', 'Name(Roll Number)');
    nameField = uieditfield(fig, 'text', 'Position', [100 170 200 25]);
    uibutton(fig, 'push', 'Position', [150 100 100 40], 'Text', 'Start', 'ButtonPushedFcn', @(btn,event) startNoiseGUI(nameField.Value));
end

function startNoiseGUI(userName)
    fig = uifigure('Name', 'GUI for Noise Removal', 'Position', [500 500 450 350]);
    ax = uiaxes(fig, 'Position', [50 150 350 150]);
    ax.Visible = 'off';
    originalImg = imread('cameraman.tif');
    imshow(originalImg, 'Parent', ax);
    currentImg = originalImg;
    uibutton(fig, 'push', 'Position', [50 50 100 35], 'Text', 'Add Noise', 'ButtonPushedFcn', @(btn,event) addNoise());
    uibutton(fig, 'push', 'Position', [170 50 100 35], 'Text', 'Smooth Noise 1', 'ButtonPushedFcn', @(btn,event) smoothNoise1());
    uibutton(fig, 'push', 'Position', [290 50 100 35], 'Text', 'Smooth Noise 2', 'ButtonPushedFcn', @(btn,event) smoothNoise2());
    uibutton(fig, 'push', 'Position', [50 10 100 30], 'Text', 'Back', 'ButtonPushedFcn', @(btn,event) backToMain());
    uibutton(fig, 'push', 'Position', [290 10 100 30], 'Text', 'Exit', 'ButtonPushedFcn', @(btn,event) close(fig));
    
    function addNoise()
        noisy = imnoise(originalImg, 'salt & pepper', 0.05);
        currentImg = noisy;
        imshow(currentImg, 'Parent', ax);
    end

    function smoothNoise1()
        if size(currentImg, 3) == 3
            h = fspecial('average', [3 3]);
            filtered = imfilter(currentImg, h);
        else
            filtered = medfilt2(currentImg, [3 3]);
        end
        currentImg = filtered;
        imshow(currentImg, 'Parent', ax);
    end

    function smoothNoise2()
        if size(currentImg, 3) == 3
            h = fspecial('gaussian', [5 5], 1.5);
            filtered = imfilter(currentImg, h);
        else
            h = fspecial('gaussian', [5 5], 1.5);
            filtered = imfilter(currentImg, h);
        end
        currentImg = filtered;
        imshow(currentImg, 'Parent', ax);
    end

    function backToMain()
        close(fig);
        guimain;
    end
end
