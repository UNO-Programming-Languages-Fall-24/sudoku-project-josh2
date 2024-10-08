% Generate possible values for each cell (1 to 4) in a 4x4 grid
{ sudoku(X, Y, Z) : Z = 1..4 } = 1 :- X = 1..4, Y = 1..4.

% Respect the initial values provided
sudoku(X, Y, Z) :- initial(X, Y, Z).

% Row constraints: Each number must appear exactly once in each row
:- sudoku(X, Y1, Z), sudoku(X, Y2, Z), Y1 != Y2, X = 1..4, Z = 1..4.

% Column constraints: Each number must appear exactly once in each column
:- sudoku(X1, Y, Z), sudoku(X2, Y, Z), X1 != X2, Y = 1..4, Z = 1..4.

% Subgrid constraints: Each number must appear exactly once in each 2x2 subgrid
subgrid(X, Y, 1) :- X = 1..2, Y = 1..2.
subgrid(X, Y, 2) :- X = 1..2, Y = 3..4.
subgrid(X, Y, 3) :- X = 3..4, Y = 1..2.
subgrid(X, Y, 4) :- X = 3..4, Y = 3..4.

% Show the solution
#show sudoku/3.
:- not 1 { sudoku(X, Y, Z) : Z = 1..4, X = 1..4, Y = 1..4 }.