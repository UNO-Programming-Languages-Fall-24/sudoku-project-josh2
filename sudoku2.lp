% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Generate possible values for each cell
{ sudoku(X, Y, Z) : Z = 1..9 } = 1 :- X = 1..9, Y = 1..9.

% Respect the initial values
sudoku(X, Y, Z) :- initial(X, Y, Z).

% Each number appears exactly once in each row
:- sudoku(X, Y1, Z), sudoku(X, Y2, Z), Y1 != Y2, X = 1..9, Z = 1..9.

% Each number appears exactly once in each column
:- sudoku(X1, Y, Z), sudoku(X2, Y, Z), X1 != X2, Y = 1..9, Z = 1..9.

% Each number appears exactly once in each subgrid
:- sudoku(X1, Y1, Z), sudoku(X2, Y2, Z),
   X1 != X2, Y1 != Y2,
   (div(X1-1, 3) * 3 + div(Y1-1, 3)) = (div(X2-1, 3) * 3 + div(Y2-1, 3)),
   Z = 1..9.

% Ensure uniqueness of the solution
:- 2 { sudoku(X, Y, Z) : Z = 1..9 }, X = 1..9, Y = 1..9.

#show sudoku/3.
