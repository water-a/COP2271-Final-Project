function [pixels] = DrawGame(board)
    % Generate empty 480x480 image
    pixels = uint8(zeros(480, 480, 3));
    
    % Generate borders
    % Row borders
    for index = 1:118:480
        pixels(index:index + 8, :, 1) = 187;
        pixels(index:index + 8, :, 2) = 173;
        pixels(index:index + 8, :, 3) = 160;
    end
    % Column borders
    for index = 1:118:480
        pixels(:, index:index + 8, 1) = 187;
        pixels(:, index:index + 8, 2) = 173;
        pixels(:, index:index + 8, 3) = 160;
    end
    
    % Generate colors for tiles
    for x = 1:4
        for y = 1:4
            switch board(x, y)
                case 0
                    r = 205;
                    g = 193;
                    b = 180;
                case 2
                    r = 238;
                    g = 228;
                    b = 218;
                case 4
                    r = 237;
                    g = 224;
                    b = 200;
                case 8
                    r = 242;
                    g = 177;
                    b = 121;
                case 16
                    r = 245;
                    g = 149;
                    b = 99;
                case 32
                    r = 246;
                    g = 124;
                    b = 95;
                case 64
                    r = 246;
                    g = 94;
                    b = 59;
                case 128
                    r = 236;
                    g = 207;
                    b = 114;
                case 256
                    r = 237;
                    g = 204;
                    b = 97;
                case 512
                    r = 237;
                    g = 200;
                    b = 80;
                case 1024
                    r = 237;
                    g = 197;
                    b = 63;
                case 2048
                    r = 247;
                    g = 194;
                    b = 46;
                otherwise
                    r = 60;
                    g = 58;
                    b = 50;
            end
            rowStart = (x - 1) * 118 + 9;
            colStart = (y - 1) * 118 + 9;
            
            % Set colors
            pixels(rowStart:rowStart + 109, colStart:colStart + 109, 1) = r;
            pixels(rowStart:rowStart + 109, colStart:colStart + 109, 2) = g;
            pixels(rowStart:rowStart + 109, colStart:colStart + 109, 3) = b;
            
            % Generate numbers as text in pixels
            digitText = CreateNumberText(num2str(board(x, y)), 1);
            [digitSizeX, digitSizeY] = size(digitText);
            for r = 1:digitSizeX
                for c = 1:digitSizeY
                    if digitText(r, c)
                        pixels(rowStart + r + 54 - floor(digitSizeX / 2), colStart + c + 54 - floor(digitSizeY / 2), :) = 255;
                    end
                end
            end
        end
    end
end

