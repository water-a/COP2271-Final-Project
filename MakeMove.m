function [new_board,score] = MakeMove(board, direction) 
    score =0; 
    new_board = board; 
    moved = false(4, 4); %sets another matrix to prevent multiple merging 
    vector = [0,0]; 
    switch direction %moves the tiles in their respective directions
        case 'left' 
            vector = [0 -1]; 
        case 'right' 
            vector = [0 1];
        case 'up'
            vector = [-1 0]; 
        case 'down' 
            vector = [1 0];
    end 
    vector
    row = []; 
    col = []; 
    if vector(1) < 0 %Objective of the if statement is to do a for loop in the direction opposite to the direction that the user inputed; that way the tiles will always be compared to the first tile started and the tiles will be merged in the wanted direction
        row = 1:1:4;
    else 
        row = 4:-1:1;
    end
    if vector(2) < 0
        col = 1:1:4;
    else 
        col = 4:-1:1;
    end
    for x = row 
        for y = col 
            t = new_board(x,y);
            if t>0 
                %this is to make sure that there is a tile there, since 0 is used for no tiles
                x_next = x + vector(1); 
                y_next = y + vector(2); 
                %moves to the direction of the next tile; basically skips
                %over zeros until a new tile is hit
                while ((x_next > 0) && (x_next < 5) && (y_next > 0) && (y_next < 5) && (new_board(x_next, y_next)== 0)) %if a tile and the surrounding tile is the same number, merge them 
                    x_next = x_next + vector(1); 
                    y_next = y_next + vector(2); 
                end 
                if(x_next > 0 && x_next < 5 && y_next > 0 && y_next < 5 && new_board(x_next, y_next) == new_board(x,y) && ~moved(x_next, y_next) && ~moved(x, y)) %checks the boundaries of the board and makes sure to set a new board to keep track of the tiles moved
                    new_board(x_next, y_next) = new_board(x,y) *2;
                    moved(x_next, y_next) = 1;
                    new_board(x,y) = 0;
                    score = score + new_board(x_next, y_next);
                else
                    temp = new_board(x, y); %board that keeps track of tiles that were previously moved
                    temp_moved = moved(x, y);
                    new_board(x,y) = 0; %if the tile hasn't moved yet, the value will be zero; however, once it has, the value will turn to one. This will prevent any extra mergings that could occur, since any tile with a one will not be eligible to merge again
                    moved(x, y) = 0;
                    new_board(x_next - vector(1),y_next - vector(2)) = temp;
                    moved(x_next - vector(1),y_next - vector(2)) = temp_moved;
                end
            end 
        end 
    end 
end