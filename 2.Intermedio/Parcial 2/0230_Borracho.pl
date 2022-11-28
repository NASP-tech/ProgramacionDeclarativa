butacas(S):-
	=(S,[[1,_],[2,_],[3,_],[4,_],[5,_],[6,_],[7,_],[8,_]]),
	is(Bolo, 4),
	asignar([Bolo, bolo], S),

	asignar([X, rosita], S),
	(   <(X, -(Bolo, 1)) ; >(X, +(Bolo, 1))),
	asignar([Y, ramon], S),
	(   <(Y, -(Bolo, 1)) ; >(Y, +(Bolo, 1))),
	(   =:=(Y, -(X, 1)) ; =:=(Y, +(X, 1))),
	asignar([Z, tona], S),
	(   <(Z, -(Bolo, 1)) ; >(Z, +(Bolo, 1))),
	asignar([W, juanito], S),
	(   <(W, -(Bolo, 1)) ; >(W, +(Bolo, 1))),
	(   =:=(W, -(Z, 1)) ; =:=(W, +(Z, 1))),
	asignar([V, anita], S),
	(   <(V, -(Bolo, 1)) ; >(V, +(Bolo, 1))),
	(   =:=(V, -(Z, 1)) ; =:=(V, +(Z, 1))),
	asignar([_, mario], S),
	nl, nl, writeln(S).

asignar([1, Cliente], [[1, Cliente],_,_,_,_,_,_,_]).
asignar([2, Cliente], [_,[2, Cliente],_,_,_,_,_,_]).
asignar([3, Cliente], [_,_,[3, Cliente],_,_,_,_,_]).
asignar([4, Cliente], [_,_,_,[4, Cliente],_,_,_,_]).
asignar([5, Cliente], [_,_,_,_,[5, Cliente],_,_,_]).
asignar([6, Cliente], [_,_,_,_,_,[6, Cliente],_,_]).
asignar([7, Cliente], [_,_,_,_,_,_,[7, Cliente],_]).
asignar([8, Cliente], [_,_,_,_,_,_,_,[8, Cliente]]).


butacas2(S):-
	=(S,[[1,_],[2,_],[3,_],[4,_],[5,_],[6,_],[7,_],[8,_]]),
	is(Bolo, 4),
	asignar([Bolo, bolo], S),

	asignar([Rosita, rosita], S),
	not(succ(Rosita, Bolo)),
	not(succ(Bolo, Rosita)),

	asignar([Ramon, ramon], S),
	not(succ(Ramon, Bolo)),
	not(succ(Bolo, Ramon)),

	(   succ(Rosita, Ramon) ; succ(Ramon, Rosita)),

	asignar([Tona, tona], S),
	not(succ(Tona, Bolo)),
	not(succ(Bolo, Tona)),

	asignar([Juanito, juanito], S),
	not(succ(Juanito, Bolo)),
	not(succ(Bolo, Juanito)),
	(   succ(Juanito, Tona) ; succ(Tona, Juanito)),

	asignar([Anita, anita], S),
	not(succ(Anita, Bolo)),
	not(succ(Bolo, Anita)),
	(   succ(Anita, Tona) ; succ(Tona, Anita)),

	asignar([_, mario], S),
	nl, nl, writeln(S).
