clave_secreta(Clave):-
	=(Clave, [D1, D2, D3, D4, D5]),
	digito(D5),
	digito(D3),
	plus(D5, D3, 14), %=:=(+(D5, D3), 14),
	digito(D4),
	digito(D2),
	succ(D2, D4), %=:=(D4, +(D2, 1)),
	digito(D1),
	=:=(D1, -(*(2, D2), 1)),
	plus(D2, D3, 10), %=:=(+(D2, D3), 10),
	sum_list(Clave, Suma),
	=:=(Suma, 30). %=:=(D1 + D2 + D3 + D4 + D5, 30).

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





