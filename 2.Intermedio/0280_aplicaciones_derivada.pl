% Manejando la variable independiente como un término:

d(x, C, 0):- number(C), !.

d(x, x, 1):- !.

d(x, x^N, N*x^E):- number(N), is(E, -(N, 1)), !.

% Derivada de una constante por x:
d(x, C * x, C):- number(C), !.

% Derivada del logaritmo natural de x:
d(x, log(x), 1 / x):- !.

% Derivada de una constante elevada a la x:
d(x, A^x, A^x * log(A)):- number(A), !.


% Casos que ya requieren de recursión:

% Derivada de una constante por una función:
d(x, C * Fx, C * DFx):- number(C), d(x, Fx, DFx), !.

% Derivada de la suma de dos funciones:
d(x, Fx + Gx, DFx + DGx):- d(x, Fx, DFx), d(x, Gx, DGx), !.

% Derivada de la resta de dos funciones:
d(x, Fx - Gx, DFx - DGx):- d(x, Fx, DFx), d(x, Gx, DGx), !.


% Manejando la variable independiente como una variable cartesiana
% con propósitos de evaluación posterior de la expresión resultante:
de(X, C, 0):- var(X), number(C), !.

de(X, X, 1):- var(X), !.

de(X, X^N, N*X^E):- var(X), number(N), is(E, -(N, 1)), !.

de(X, C * X, C):- var(X), number(C), !.

de(X, log(X), 1 / X):- var(X), !.

de(X, C * Fx, C * DFx):- var(X), number(C), de(X, Fx, DFx), !.

de(X, A^X, A^X * log(A)):- var(X), number(A), !.

de(X, Fx + Gx, DFx + DGx):- var(X), de(X, Fx, DFx), de(X, Gx, DGx), !.

de(X, Fx - Gx, DFx - DGx):- var(X), de(X, Fx, DFx), de(X, Gx, DGx), !.


% Ejemplo: ?- de(Y, Y^3, R), is(Y, 5), is(Resp, R).


% Implementación del método de Newton-Raphson
% para encontrar raíces de funciones:
%
newtonraphson(Fx, Xini, Precision):-
    abolish(evFx/2),
    abolish(evDfx/2),
    obtener_derivada(Fx),
    aproximaciones_sucesivas(Xini, Precision).
    %aproximaciones_sucesivas2(Xini, Precision).

obtener_derivada(Fx):-
    de(X, Fx, DFx),
    asserta((evFx(X, Resp):- is(Resp, Fx))),
    asserta((evDFx(X, Resp) :- is(Resp, DFx))).

aproximaciones_sucesivas(Xant, Epsilon):-
    evFx(Xant, EvFx),
    evDFx(Xant, EvDFx),
    is(Xsig, -(Xant, /(EvFx, EvDFx))),
    <(abs(-(Xsig, Xant)), Epsilon),
    write('Raiz = '), writeln(Xsig),
    !.

aproximaciones_sucesivas(Xant, Epsilon):-
    evFx(Xant, EvFx),
    evDFx(Xant, EvDFx),
    is(Xsig, -(Xant, /(EvFx, EvDFx))),
    >=(abs(-(Xsig, Xant)), Epsilon),
    aproximaciones_sucesivas(Xsig, Epsilon),
    !.

/*
aproximaciones_sucesivas2(Xant, Epsilon):-
    evFx(Xant, EvFx),
    evDFx(Xant, EvDFx),
    is(Xsig, -(Xant, /(EvFx, EvDFx))),
    <(abs(-(Xsig, Xant)), Epsilon),
    assert(apoximacion(Xsig)),
    %write('Raiz = '), writeln(Xsig),
    !.

aproximaciones_sucesivas2(Xant, Epsilon):-
    evFx(Xant, EvFx),
    evDFx(Xant, EvDFx),
    is(Xsig, -(Xant, /(EvFx, EvDFx))),
    >=(abs(-(Xsig, Xant)), Epsilon),
    assert(aproximacion(Xsig)),
    aproximaciones_sucesivas2(Xsig, Epsilon),
    !.
*/


