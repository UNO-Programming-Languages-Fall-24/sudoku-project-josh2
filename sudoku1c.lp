% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Define size and range
size(4).
value(1..4).

% Generate possible values for each cell (1 to 4) in a 4x4 grid
1 { sudoku(X, Y, Z) : value(Z) } = 1 :- size(Size), X = 1..Size, Y = 1..Size.

% Row constraints: Each number must appear exactly once in each row
:- sudoku(X, Y1, Z), sudoku(X, Y2, Z), Y1 != Y2.

% Column constraints: Each number must appear exactly once in each column
:- sudoku(X1, Y, Z), sudoku(X2, Y, Z), X1 != X2.

% Subgrid constraints: Each number must appear exactly once in each 2x2 subgrid
:- sudoku(X1, Y1, Z), sudoku(X2, Y2, Z),
   (X1-1)/2 == (X2-1)/2,
   (Y1-1)/2 == (Y2-1)/2,
   (X1, Y1) != (X2, Y2).

% Respect the initial values provided
initial(X, Y, Z) :- sudoku(X, Y, Z).

% Ensure the initial values are respected
:- initial(X, Y, Z), not sudoku(X, Y, Z).

% Show the solution
#show sudoku/3.