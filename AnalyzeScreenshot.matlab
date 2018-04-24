% Image analysis Part 1
function [board] = AnalyzeScreenshotFunction(filename)
	% Read in image file
	pixels = imread(filename);
	[height, width, colors] = size(pixels);

	% Initilize empty board
	board = zeros(4, 4);
    
	% Read through pixels and find upper left tile
	startRow = -1;
	startCol = -1;
	for row = 1:1:height
        found = 0;
		for col = 1:1:width
			tileValue = GetTileValue(pixels(row, col, :));
            % If it detects a tile then set startRow and startCol to
            % location of pixel
			if tileValue > -1
                % Check to make sure pixel is actually a tile and not some
                % outlier
                rightTileValue = GetTileValue(pixels(row, col + 1, :));
                downTileValue = GetTileValue(pixels(row + 1, col, :));
                if rightTileValue > -1 && downTileValue > -1
                    startRow = row;
                    startCol = col;
                    board(1, 1) = tileValue;
                    found = 1;
                    break
                end
			end
        end
        if found == 1
            break
        end
    end
    % Incremented the row by one because the border overlaps when there's a
    % tile
    startRow = startRow + 1;
    
    % Starting from first tile move 122 pixels to the left to reach the
    % other tiles and set those values on the board then proceed to do the
    % same downward
    for x = 1:1:4
    	for y = 1:1:4
			tileValue = GetTileValue(pixels(startRow + 122 * (x - 1), startCol + 122 * (y - 1), :));
			if tileValue > -1 
				board(x, y) = tileValue;
			end
    	end
    end
end
