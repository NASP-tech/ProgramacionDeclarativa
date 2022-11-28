% Los primeros casos triviales:

% Derivada de una constante respecto a X
d(X, C, 0):-
    number(C), !.

% Para probarlo d(x, 5, R).

%Derivada de x respecto a x
d(X, X, 1):- !.

% Derivada de funcion x a la N
d(X, X^N, N*X^E):-
    number(N),
    is(E, -(N,1)),!.

% De una constante C por X

d(X, K*X, K):- number(K),!.


%De una constante C por X elevado a N

d(X, C*X^Num, R*X^E):-
    number(Num),
    number(C),
    is(R, *(C,Num)),
    is(E, -(Num,1)),!.


% Logaritmo natural de X

d(X,  ln(X), 1/X):-!.

% Derivada elevada a X
d(X, A^X, A^X*log(A)):-
    number(A),!.
% Para probarlo es d(x, 5^x, R).

% Derivada de un C por una funcion
d(X, Constante * Fx, Constante*DFx):-
    number(Constante),
    d(X, Fx, DFx),!.


% Derivada de a suma de dos funcion
d(X, Fx + Gx, DFx + DGx):-
    d(X, Fx, DFx),
    d(X, Gx, DGx),!.

% Para probarlo d(x, 5*x^3+x^7, R).
% Para usar mas terminos d(x, 5*x^3+x^7+2*x, R).


% Derivada de a resta de dos funcion
d(X, Fx - Gx, DFx - DGx):-
    d(X, Fx, DFx),
    d(X, Gx, DGx),!.

% Derivada del producto de dos funcion
d(X, Fx * Gx, DFx * Gx + Fx * DGx):-
    d(X, Fx, DFx),
    d(X, Gx, DGx),!.





% Derivada de funcion x a la N
de(X, X^N, N*X^E):-
    var(X),
    number(N),
    is(E, -(N,1)),!.

% Para probarlo de(Y, Y^3, R), is(Y, 2), is(Resp, R).





