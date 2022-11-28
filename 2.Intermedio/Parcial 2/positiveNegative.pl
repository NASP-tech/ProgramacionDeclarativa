% Programación Declarativa 02-2022
% Ing. Guillermo Cortes y Instructor Jaime Serrano
% Actividad de Discusión 3
% Natalia Alexandra Solórzano Paz 00120319 Seccion 02


% EJERCICIO 2
% 2. Elabore una regla en Prolog que se encargue de leer un archivo que
% contenga números enteros, que cuenta la cantidad de números positivos y
% negativos encontrados.Luego, imprima en pantalla la cantidad de números
% positivos y negativos, y además guarde dichas cantidades en un nuevo
% archivo llamado total_cont.txt


positiveNegative:-
    checkFile(Positive, Negative),
    write('Quantity of Positive Numbers: '), writeln(Positive),
    write('Quantity of Negative Numbers: '), writeln(Negative).

checkFile(Positive, Negative):-
    open('listOfNumbers.txt', read, Numbers),
    verify(Numbers, Positive, Negative),
    close(Numbers).

verify(File, Positive, Negative):-
    read(File, Numbers),
    confirm(File, Numbers, Positive, Negative).

confirm(File, Numbers, Positive, Negative):-
    \==(Numbers, end_of_file),
    (Numbers > 0),
    verify(File, PositiveCount, Negative),
    is(Positive, +(PositiveCount, 1)),
    open('total_cont.txt', write, PositiveList),
    % Le sume 1 porque si no muestra un dato menor, ya que inicia en 0
    write(PositiveList, +(PositiveCount,1)),
    close(PositiveList),!.


confirm(File, Numbers, Positive, Negative):-
    \==(Numbers, end_of_file),
    (Numbers < 0),
    verify(File, Positive, NegativeCount),
    is(Negative, +(NegativeCount, 1)),
    open('total_cont.txt', write, NegativeList),
    % Le sume 1 porque si no muestra un dato menor, ya que inicia en 0
    write(NegativeList, +(NegativeCount,1)),
    close(NegativeList),!.

confirm(_,N,0,0):-
    ==(N, end_of_file).

