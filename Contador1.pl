contar(N):-
    cont(1, N).

cont(Cont, N):-
    % Ya no se necesita igualar
    =:=(Cont, N),
    % Usar ! para evitar que siga corriendo y que de false, porque es recursiva
    writeln(Cont), !.

cont(Cont, N):-
    <(Cont, N),
    writeln(Cont),
    is(ContAux, +(Cont, 1)),
    cont(ContAux, N).

% Contar de N a 1:

contrev(Cont):-
    % Ya no se necesita igualar
    =:=(Cont, 1),
    % Usar ! para evitar que siga corriendo y que de false, porque es recursiva
    writeln(Cont), !.

contrev(Cont):-
    >(Cont, 1),
    writeln(Cont),
    is(contAux, -(Cont, 1)),
    contrev(contAux).


fact(0, 1) :-!.
fact(1, 1) :-!.
fact(N, Fact):-
    >(N, 1),
    is(Nant, -(N, 1)),
    fact(Nant, FactAnt),
    % que no devuelva cierto o falso, si no que el valor
    is(Fact, *(N, FactAnt)).












