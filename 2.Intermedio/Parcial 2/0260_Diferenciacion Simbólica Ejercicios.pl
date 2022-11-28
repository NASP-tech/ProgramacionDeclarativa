% Manejando la variable independiente como un t�rmino:

d(x, C, 0):- number(C), !.

d(x, x, 1):- !.

d(x, x^N, N*x^E):- number(N), is(E, -(N, 1)), !.

% Derivada de una constante por x:
d(x, C * x, C):- number(C), !.

% Derivada del logaritmo natural de x:
d(x, log(x), 1 / x):- !.

% Derivada de una constante elevada a la x:
d(x, A^x, A^x * log(A)):- number(A), !.



% Casos que ya requieren de recursi�n:

% Derivada de una constante por una funci�n:
d(x, C * Fx, C * DFx):- number(C), d(x, Fx, DFx), !.

% Derivada de la suma de dos funciones:
d(x, Fx + Gx, DFx + DGx):- d(x, Fx, DFx), d(x, Gx, DGx), !.

% Derivada de la resta de dos funciones:
d(x, Fx - Gx, DFx - DGx):- d(x, Fx, DFx), d(x, Gx, DGx), !.


% Manejando la variable independiente como una variable cartesiana
% con prop�sitos de evaluaci�n posterior de la expresi�n resultante:
de(X, C, 0):- var(X), number(C), !.

de(X, X, 1):- var(X), !.

de(X, X^N, N*X^E):- var(X), number(N), is(E, -(N, 1)), !.

% Ejemplo: ?- de(Y, Y^3, R), is(Y, 5), is(Resp, R).