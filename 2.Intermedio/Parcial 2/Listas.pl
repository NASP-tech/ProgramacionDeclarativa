% Desplegar los elementos de una lista:

%?- desplegar([a, b, c, d]).

desplegar([]):- !.

desplegar([Cab|Col]):-
    writeln(Cab),
    desplegar(Col).


% Desplegar los elementos de una lista en
% forma inversa:

%?- desplegar2([a, b, c, d]).

desplegar2([]):- !.

desplegar2([Cab|Col]):-
    desplegar2(Col),
    writeln(Cab).


% Llenar una lista con los valores de 1 a N:

llenar1aN(0, []):- !.

llenar1aN(N, [N|Laux]):-
    %>(N, 0),
    is(N2, -(N, 1)),
    llenar1aN(N2, Laux).
    %=(L, [N|Laux]).

% Llenar la lista al reves de la anterior:

llenar1aNreves(0, L, L):- !.

llenar1aNreves(N, Laux, L):-
    %>(N, 0),
    is(N2, -(N, 1)),
    llenar1aNreves(N2, [N|Laux], L).
    %=(L, [N|Laux]).
