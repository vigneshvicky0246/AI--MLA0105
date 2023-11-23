% N-Queens problem on a 4x4 chessboard

% Valid positions for a queen on the chessboard
position(1).
position(2).
position(3).
position(4).

% Solution predicate for the N-Queens problem
queens(Board) :-
    % Define the structure of the board
    Board = [Q1, Q2, Q3, Q4],

    % Ensure queens are placed in valid positions
    position(Q1), position(Q2), position(Q3), position(Q4),

    % Ensure no two queens attack each other
    no_attack(Q1, Q2, 1), no_attack(Q1, Q3, 2), no_attack(Q1, Q4, 3),
    no_attack(Q2, Q3, 1), no_attack(Q2, Q4, 2),
    no_attack(Q3, Q4, 1).

% Helper predicate to check if two queens attack each other
no_attack(Qi, Qj, DiagonalDist) :-
    Qi - Qj =\= DiagonalDist,
    Qi - Qj =\= -DiagonalDist.

% Example query to find a solution
% ?- queens(Board).
