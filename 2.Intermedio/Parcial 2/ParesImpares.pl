par_impar(Pares, Impares):-
    open('lista_numeros.txt', read, Numeros),
    recorrer(Numeros, L),
    close(Numeros),

    contar(L,0,0, Pares, Impares),
    open('total_cont.txt', write, Cantidad),
    write(Cantidad, '.'),
    write(Cantidad, Impares),
    writeln(Cantidad, '.'),
    close(Cantidad),!.

recorrer(ListaNum, L):-
    read(ListaNum, Valores),
    (\==(Valores, end_of_file),
     recorrer(ListaNum, L2),
     =(L,[Valores|L2]);
    ==(Valores, end_of_file),
    ==(L|[])),!.

contar(L,Cont1, Cont2, Pares, Impares):-
    sum(L,Cont1, Cont2, Pares, Impares).

sum([], Cont1, Cont2, Pares, Impares):-
    is(Pares, Cont1),
    is(Impares, Cont2).


sum([Cabeza|Cola],Cont1, Cont2, Pares, Impares):-
    0 is Cabeza mod 2,
    is(Par, +(Cont1, 1)),
    sum(Cola, Par, Cont2, Pares, Impares).

sum([Cabeza|Cola], Cont1, Cont2, Pares, Impares):-
    1 is Cabeza mod 2,
    is(Impar, +(Cont2, 1)),
    sum(Cola, Cont1, Impar, Pares, Impares).
