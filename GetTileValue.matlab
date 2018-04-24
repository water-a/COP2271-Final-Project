function [value] = GetTileValueFunction(colors)
    % Get colors in RGB
    r = colors(1);
    g = colors(2);
    b = colors(3);
    
    % Default value of a non-tile is -1
    % Check ranges of colors that determine the numerical value of a tile
	value = -1;
	if r - 2 < 205 && r + 2 > 205 && g - 2 < 193 && g + 2 > 193 && b - 2 < 180 && b + 2 > 180
		value = 0;
	elseif r - 2 < 238 && r + 2 > 238 && g - 2 < 228 && g + 2 > 228 && b - 2 < 218 && b + 2 > 218
		value = 2;
	elseif r - 2 < 237 && r + 2 > 237 && g - 2 < 224 && g + 2 > 224 && b - 2 < 200 && b + 2 > 200
		value = 4;
	elseif r - 2 < 242 && r + 2 > 242 && g - 2 < 177 && g + 2 > 177 && b - 2 < 121 && b + 2 > 121
		value = 8;
	elseif r - 2 < 245 && r + 2 > 245 && g - 2 < 149 && g + 2 > 149 && b - 2 < 99 && b + 2 > 99
		value = 16;
	elseif r - 2 < 246 && r + 2 > 246 && g - 2 < 124 && g + 2 > 124 && b - 2 < 95 && b + 2 > 95
		value = 32;
	elseif r - 2 < 246 && r + 2 > 246 && g - 2 < 94 && g + 2 > 94 && b - 2 < 59 && b + 2 > 59
		value = 64;
	elseif r - 2 < 236 && r + 2 > 236 && g - 2 < 207 && g + 2 > 207 && b - 2 < 114 && b + 2 > 114
		value = 128;
	elseif r - 2 < 237 && r + 2 > 237 && g - 2 < 204 && g + 2 > 204 && b - 2 < 97 && b + 2 > 97
		value = 256;
	elseif r - 2 < 237 && r + 2 > 237 && g - 2 < 200 && g + 2 > 200 && b - 2 < 80 && b + 2 > 80
		value = 512;
	elseif r - 2 < 237 && r + 2 > 237 && g - 2 < 197 && g + 2 > 197 && b - 2 < 63 && b + 2 > 63
		value = 1024;
	elseif r - 2 < 237 && r + 2 > 237 && g - 2 < 194 && g + 2 > 194 && b - 2 < 46 && b + 2 > 46
		value = 2048;
	end
end
