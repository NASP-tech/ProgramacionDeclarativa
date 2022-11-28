% Don Chilo, Doña Canuta, Don Mario, la Niña Lencha y Doña Marina viven
% en un edificio de cinco plantas. Todos ellos viven en distintos pisos.
% Don Chilo no vive en el quinto piso y Doña Canuta no vive en el
% primero. Don Mario no vive en el piso superior ni en el inferior, y no
% está en un piso adyacente al de Doña Marina ni al de Doña Canuta. La
% Niña Lencha vive en algún piso por encima de Doña Canuta. ¿Quién
% vive en cada piso?

edificio_apartamentos(Edificio):-
	Edificio = [_, _, _, _, _],

% Don Chilo no vive en el quinto piso:
	asignar([chilo, X], Edificio),
	=\=(X, 5),

% Doña Canuta no vive en el primero:
	asignar([canuta, Y], Edificio),
	=\=(Y, 1),

% El piso donde vive Doña Marina:
	asignar([marina, Z], Edificio),

% Don Mario no vive en el piso superior ni
% en el inferior,
% y no está en un piso adyacente al de Doña Marina
% ni al de Doña Canuta:
	asignar([mario, W], Edificio),
	=\=(W, 5),
	=\=(W, 1),
	(
	    <(W, -(Y, 1)) ;
	    >(W, +(Y, 1))
	),
	(
	    <(W, -(Z, 1)) ;
	    >(W, +(Z, 1))
	),

% La Ña Lencha vive en algún piso por encima de
% Doña Canuta:
	asignar([lencha, V], Edificio),
	>(V, Y).

asignar([X, Y], [[X, Y], _, _, _, _]):- is(Y, 1).
asignar([X, Y], [_, [X, Y], _, _, _]):- is(Y, 2).
asignar([X, Y], [_, _, [X, Y], _, _]):- is(Y, 3).
asignar([X, Y], [_, _, _, [X, Y], _]):- is(Y, 4).
asignar([X, Y], [_, _, _, _, [X, Y]]):- is(Y, 5).



edificio_apartamentos2(Edificio):-
	Edificio = [_, _, _, _, _],

% Don Chilo no vive en el quinto piso:
	asignar2(chilo, Edificio),
	nth1(Chilo, Edificio, chilo),
	not(=:=(Chilo, 5)),

% Doña Canuta no vive en el primero:
	asignar2(canuta, Edificio),
	nth1(Canuta, Edificio, canuta),
	%=(Edificio, [Can|_]),
	not(=:=(Canuta, 1)),

% El piso donde vive Doña Marina:
	asignar2(marina, Edificio),

% Don Mario no vive en el piso superior ni
% en el inferior,
% y no está en un piso adyacente al de Doña Marina
% ni al de Doña Canuta:
	asignar2(mario, Edificio),
	nth1(Mario, Edificio, mario),
	%=(Edificio, [Mo|_]),
	not(=:=(Mario, 5)),
	not(=:=(Mario, 1)),
	nth1(Marina, Edificio, marina),
	not(succ(Mario, Marina)),
	not(succ(Marina, Mario)),
	not(succ(Mario, Canuta)),
	not(succ(Canuta, Mario)),

% La Niña Lencha vive en algún piso por encima de
% Doña Canuta:
	asignar2(lencha, Edificio),
	nth1(Lencha, Edificio, lencha),
	>(Lencha, Canuta).

asignar2(X, [X, _, _, _, _]).
asignar2(X, [_, X, _, _, _]).
asignar2(X, [_, _, X, _, _]).
asignar2(X, [_, _, _, X, _]).
asignar2(X, [_, _, _, _, X]).












