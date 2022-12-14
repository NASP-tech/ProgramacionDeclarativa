% Programación Declarativa 02-2022
% Ing. Guillermo Cortes y Instructor Jaime Serrano
% Actividad de Discusión 3
% Natalia Alexandra Solórzano Paz 00120319 Seccion 02

% EJERCICIO 1
% 1. Elabore un programa en Prolog para encontrar la derivada de la
% función seno hiperbólico: 𝐬𝐢𝐧𝐡(𝑭𝒙). Tener en cuenta que el
% argumento de la función (Fx) es una función polinómica, es decir, de
% la forma:𝐹(𝑥) = 𝑎0 ± 𝑎1𝑥± 𝑎2𝑥%2 ± ⋯  𝑎𝑛𝑥𝑛
% , por lo que deberá realizar todas
% las reglas necesarias para cubrir la derivada.


% y=senhf(X) => y'=f'(X)*coshf(X)

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

d(X, A*X, A):- number(A),!.


%De una constante C por X elevado a N

d(X, C*X^Int, R*X^E):-
    number(Int),
    number(C),
    is(R, *(C,Int)),
    is(E, -(Int,1)),!.


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


derivadaSinh(X, sinh(Fx), DFx*cosh(Fx)):-
    d(X, Fx, DFx),!.

% Para probar derivadaSinh(x, sinh(x^5), R).
% La x o variable debe estar en minuscula, porque si no lo toma como
% variable.

% EJERCICIO 2
% 2. Elabore una regla en Prolog que se encargue de leer un archivo que
% contenga números enteros, que cuenta la cantidad de números positivos y
% negativos encontrados.Luego, imprima en pantalla la cantidad de números
% positivos y negativos, y además guarde dichas cantidades en un nuevo
% archivo llamado total_cont.txt


positiveNegative:-
    checkFile(Positive, Negative),
    write('Quantity of Positive Numbers: '), writeln(Positive),
    write('Quantity of Negative Numbers: '), writeln(Negative),
    open('total_cont.txt', write, PositiveList),
    write(PositiveList, 'La cantidad de positivos es: '),
    writeln(PositiveList, Positive),
    write(PositiveList, 'La cantidad de negativos es: '),
    writeln(PositiveList, Negative),
    close(PositiveList).

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
    is(Positive, +(PositiveCount, 1)),!.


confirm(File, Numbers, Positive, Negative):-
    \==(Numbers, end_of_file),
    (Numbers < 0),
    verify(File, Positive, NegativeCount),
    is(Negative, +(NegativeCount, 1)),!.

confirm(_,N,0,0):-
    ==(N, end_of_file).



% Para probarlo
% positiveNegative.



