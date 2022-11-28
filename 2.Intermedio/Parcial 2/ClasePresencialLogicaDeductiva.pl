clave_secreta(Clave):-
    =(Clave, [D1, D2, D3, D4, D5]),
    digito(D5),
    digito(D3),
    plus(D5, D3, 14),
    digito(D4),
    digito(D2),
    succ(D4, D2),
    digito(D1),
    =:=(D1, -(*(D2, 2), 1)),
    plus(D2, D3, 10),
    sum_list(Clave, Suma),
    =:=(Suma, 30).



digito(0).
digito(1).
digito(2).
digito(3).
digito(4).
digito(5).
digito(6).
digito(7).
digito(8).
digito(9).

%bolito
butacas(S):-
    is(Bolito, 4)
    =(S, [[1,_], [2,_], [3,_], [4,bolito], [5,_], [6,_], [7,_], [8,_]]),
    asignar([Rosita, rosita], S),
    not(succ(Rosita, Bolito)),
    not(succ(Bolito, Rosita)),
    asignar([Ramon, ramon], S),
    not(succ(Ramon, Bolito)),
    not(succ(Bolito, Ramon)),
    (   succ(Rosita, Ramon);succ(Ramon, Rosita) ),
    asignar([Tona, tona],S),
    asignar([Juanito, juanito],S),
    not(succ(Juanito, Bolito)),
    not(succ(Bolito, Juanito)),
    asignar([Anita, anita],S),
    not(succ(Anita, Bolito)),
    not(succ(Bolito, Anita)),
    (   succ(Anita, Tona),
        succ(Tona, Juanito)
    ;
        succ(Juanito, Tona),
        succ(Tona, Anita)
    ),
    not(succ(Tona, Bolito)),
    not(succ(Bolito, Tona)),
    asignar([Mario, mario],S),
    writeln(S).

asignar( [1, Cliente], [[1,Cliente],_,_,_,_,_,_,_]).

asignar( [2, Cliente], [_,[2,Cliente],_,_,_,_,_,_]).

asignar( [3, Cliente], [_,_,[3,Cliente],_,_,_,_,_]).

asignar( [4, Cliente], [_,_,_,[4,Cliente],_,_,_,_]).

asignar( [5, Cliente], [_,_,_,_,[5,Cliente],_,_,_]).

asignar( [6, Cliente], [_,_,_,_,_,[6,Cliente],_,_]).

asignar( [7, Cliente], [_,_,_,_,_,_,[7,Cliente],_]).

asignar( [8, Cliente], [_,_,_,_,_,_,_,[8,Cliente]]).




edificio(L):-
    =(L, [_,_,_,_,_]),
    asignarP(chilo, L),
    nth1(Chilo, L, chilo),
    =\=(Chilo, 5),
    asignarP(canuta, L),
    nth1(Canuta, L, canuta),
    =\=(Canuta, 1),
    asignarP(mario, L),
    nth1(Mario, L, mario),
    =\=(Mario, 1),
    =\=(Mario, 5),
    asignarP(marina, L),
    nth1(Marina, L, marina),
    not(succ(Mario,Marina)),
    not(succ(Mario,Canuta)),
    not(succ(Marina,Mario)),
    not(succ(Canuta,Mario)),
    asignarP(lencha, L),
    nth1(Lencha, L, lencha),
    >(Lencha, Canuta).


asignarP(X, [X,_,_,_,_]).
asignarP(X, [_,X,_,_,_]).
asignarP(X, [_,_,X,_,_]).
asignarP(X, [_,_,_,X,_]).
asignarP(X, [_,_,_,_,X]).








