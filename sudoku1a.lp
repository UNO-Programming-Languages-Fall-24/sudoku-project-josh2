% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Generate possible values for each cell
{ sudoku(X, Y, Z) : Z = 1..4 } = 1 :- X = 1..4, Y = 1..4.

% Respect the initial values
sudoku(X, Y, Z) :- initial(X, Y, Z).

% Each number appears exactly once in each row
:- sudoku(X, Y1, Z), sudoku(X, Y2, Z), Y1 != Y2.

% Each number appears exactly once in each column
:- sudoku(X1, Y, Z), sudoku(X2, Y, Z), X1 != X2.

% Define subgrids (for 4x4 grid)
subgrid(X, Y, 1) :- X = 1..2, Y = 1..2.
subgrid(X, Y, 2) :- X = 1..2, Y = 3..4.
subgrid(X, Y, 3) :- X = 3..4, Y = 1..2.
subgrid(X, Y, 4) :- X = 3..4, Y = 3..4.

#show sudoku/3.
