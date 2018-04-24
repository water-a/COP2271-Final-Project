function [pixels] = CreateNumberText(text, scale)
    % Generates blank canvas
    numDigits = strlength(text);
    pixels = false(22, 12 * numDigits + 2 * (numDigits - 1));
    
    % Generates text based on 7 segment display
    for index = 1:numDigits
        flips = zeros(7);
        switch text(index)
            case '0'
                flips(1:3) = 1;
                flips(5:7) = 1;
            case '1'
                flips(3) = 1;
                flips(6) = 1;
            case '2'
                flips(1) = 1;
                flips(3:4) = 1;
                flips(5) = 1;
                flips(7) = 1;
            case '3'
                flips(1) = 1;
                flips(3:4) = 1;
                flips(6:7) = 1;
            case '4'
                flips(2:4) = 1;
                flips(6) = 1;
            case '5'
                flips(1) = 1;
                flips(2) = 1;
                flips(4) = 1;
                flips(6:7) = 1;
            case '6'
                flips(2) = 1;
                flips(4:7) = 1;
            case '7'
                flips(1) = 1;
                flips(3) = 1;
                flips(6) = 1;
            case '8'
                flips(:) = 1;
            case '9'
                flips(1:4) = 1;
                flips(6:7) = 1;
        end
        col = 14 * (index - 1) + 1;
        if flips(1)
            pixels(1:2, col:col + 11) = 1;
        end
        if flips(2)
            pixels(1:12, col:col + 1) = 1;
        end
        if flips(3)
            pixels(1:12, col + 10:col + 11) = 1;
        end
        if flips(4)
            pixels(9:12, col:col + 11) = 1;
        end
        if flips(5)
            pixels(9:22, col:col + 1) = 1;
        end
        if flips(6)
            pixels(9:22, col + 10:col + 11) = 1;
        end
        if flips(7)
            pixels(21:22, col:col + 11) = 1;
        end
    end
    pixels = imresize(pixels, scale);
end

