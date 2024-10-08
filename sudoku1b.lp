% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...

% Define subgrids (for 4x4 grid)
subgrid(X,Y,1) :- X = 1..2,Y = 1..2.
subgrid(X,Y,2) :- X = 1..2,Y = 3..4.
subgrid(X,Y,3) :- X = 3..4,Y = 1..2.
subgrid(X,Y,4) :- X = 3..4,Y = 3..4.

subgrid(X, Y, G) :- initial(X, Y, _), subgrid(X, Y, G).

#show subgrid/3.
