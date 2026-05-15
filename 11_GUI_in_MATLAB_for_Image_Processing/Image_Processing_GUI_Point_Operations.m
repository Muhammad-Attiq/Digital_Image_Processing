function task2_gui
    fig = uifigure('Name', 'Image Processing Operations', 'Position', [500 500 500 450]);
    ax = uiaxes(fig, 'Position', [50 250 400 150]);
    [file, path] = uigetfile({'*.jpg;*.png;*.tif;*.bmp', 'Image Files'}, 'Select an Image');
    if isequal(file, 0)
        img = imread('cameraman.tif');
    else
        img = imread(fullfile(path, file));
    end

    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    img = im2double(img);
    imshow(img, 'Parent', ax);
    originalImg = img;
    currentImg = img;
    uilabel(fig, 'Position', [50 200 150 25], 'Text', 'Select task to be performed', 'FontSize', 12, 'FontWeight', 'bold');
    uibutton(fig, 'push', 'Position', [50 160 100 35], 'Text', 'Power Law', 'ButtonPushedFcn', @(btn,event) powerLawGUI());
    uibutton(fig, 'push', 'Position', [170 160 100 35], 'Text', 'Bit Plane Slicing', 'ButtonPushedFcn', @(btn,event) bitPlaneGUI());
    uibutton(fig, 'push', 'Position', [290 160 100 35], 'Text', 'Thresholding', 'ButtonPushedFcn', @(btn,event) thresholdGUI());
    uibutton(fig, 'push', 'Position', [350 50 100 35], 'Text', 'Exit', 'ButtonPushedFcn', @(btn,event) close(fig));
    
    function powerLawGUI()
        dlg = uifigure('Name', 'Power Law', 'Position', [600 400 300 150]);
        uilabel(dlg, 'Position', [50 100 150 25], 'Text', 'Enter gamma value:');
        gammaField = uieditfield(dlg, 'numeric', 'Position', [200 100 60 25], 'Value', 0.5);
        uibutton(dlg, 'push', 'Position', [100 40 100 35], 'Text', 'Apply', 'ButtonPushedFcn', @(btn,event) applyPowerLaw());
        
        function applyPowerLaw()
            gamma = gammaField.Value;
            result = originalImg .^ gamma;
            currentImg = result;
            imshow(currentImg, 'Parent', ax);
            close(dlg);
        end
    end

    function bitPlaneGUI()
        dlg = uifigure('Name', 'Bit Plane Slicing', 'Position', [600 400 300 150]);
        uilabel(dlg, 'Position', [50 100 150 25], 'Text', 'Enter bit plane (0-7):');
        bitField = uieditfield(dlg, 'numeric', 'Position', [200 100 60 25], 'Value', 4, 'Limits', [0 7]);
        uibutton(dlg, 'push', 'Position', [100 40 100 35], 'Text', 'Apply', 'ButtonPushedFcn', @(btn,event) applyBitPlane());
        
        function applyBitPlane()
            bit = bitField.Value;
            img_uint8 = im2uint8(originalImg);
            bitPlane = bitget(img_uint8, bit+1);
            result = im2double(bitPlane);
            currentImg = result;
            imshow(currentImg, 'Parent', ax);
            close(dlg);
        end
    end

    function thresholdGUI()
        dlg = uifigure('Name', 'Thresholding', 'Position', [600 400 300 150]);
        uilabel(dlg, 'Position', [50 100 150 25], 'Text', 'Enter threshold (0-1):');
        threshField = uieditfield(dlg, 'numeric', 'Position', [200 100 60 25], 'Value', 0.5, 'Limits', [0 1]);
        uibutton(dlg, 'push', 'Position', [100 40 100 35], 'Text', 'Apply', 'ButtonPushedFcn', @(btn,event) applyThreshold());
        
        function applyThreshold()
            T = threshField.Value;
            result = originalImg > T;
            currentImg = result;
            imshow(currentImg, 'Parent', ax);
            close(dlg);
        end
    end
end
