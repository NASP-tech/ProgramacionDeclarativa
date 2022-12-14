%Discusi?n Grupal Programaci?n Declarativa 2022
%Ing. Guillermo Cortes y Jaime Serrano
%Grupo:
% -> Herson Alexander Reyes Rivas 00216519
% -> Alberto Enrique de Le?n Qui?onez 00087919
% -> Dylan Moises Melendez Linares 00087018
% -> Natalia Alexandra Sol?rzano Paz 00120319

% EJERCICIO 1
% Pepito se escap? del colegio y se fue con sus amigos al centro
% comercial. Estando all? se da cuenta de que sus pap?s tambi?n han ido
% de compras. Elabore una base de conocimiento que le ayude a Pepito a
% no encontrarse con sus pap?s en ning?n lugar del centro comercial. Es
% decir, la base de conocimiento debe conocer los locales y decirle a
% Pepito en qu? lugares del centro comercial podr? estar sin ser visto.
% En muchas ocasiones su pap? y su mam? deciden separarse e ir a locales
% distintos para terminar las compras m?s r?pido. Elabore una cl?usula
% de aridad tres a la que se le indique por medio de los dos primeros
% argumentos en cu?l local est? su mam? y en cu?l est? su pap?. En el
% tercer argumento de la cl?usula se devuelven los locales en los que
% Pepito puede estar. Registre en la base de conocimientos locales como:
% Foodcourt, Zapater?a Lee Shoes, gradas el?ctricas, Super Selectos,
% Ferretar?a Freund, Cin?polis, La Never?a, Torogoz, Dollar City, etc.

% Base de conocimiento:
local(foodcourt).
local(zapateria_lee_shoes).
local(gradas_electricas).
local(super_selectos).
local(ferreteria_freund).
local(cinepolis).
local(la_neveria).
local(torogoz).
local(dollar_city).

% Validaci?n de nombre no valido
puede_estar(X,Y,_):-
    (not(local(X));not(local(Y))),
    writeln('Nombre de local no valido.'),
    !.

% Verificaci?n que el lugar seleccionado no sea el mismo al de la respuesta
puede_estar(X,Y,Z):-
    ((local(X)),(local(Y))),
    local(Z),
    not(==(X,Z)),
    not(==(Y,Z)).

% EJERCICIO 2
% El enemigo de mi enemigo, es mi amigo. La historia de la
% humanidad est? plagada de guerras. Reyes, presidentes, conquistadores
% y estrategas de las batallas han debido conseguir, cuando es
% necesario, aliados para vencer a su oponente. Elabore la cl?usula de
% Horn aliado/3 en la que los primeros dos argumentos son los oponentes,
% y el tercer argumento es el aliado que necesita el primer oponente.
% Obviamente, el objeto del tercer argumento debe ser enemigo del
% segundo. Para mostrar un posible aliado, este no necesariamente debe
% estar en paz con el primero, es decir, tambi?n pueden ser enemigos.


% Base de conocimiento:
enemigo(rusia,ucrania).
enemigo(ucrania,rusia).
enemigo(rusia,japon).
enemigo(japon,rusia).
enemigo(rusia,usa).
enemigo(usa,rusia).
enemigo(usa,china).
enemigo(china,usa).
enemigo(usa,venezuela).
enemigo(venezuela,usa).

% Validaci?n para cuando no se encuentra un enemigo
aliado(_,Y,_):-
    not(enemigo(Y,_)),
    writeln('No es posible encontrar un aliado'),
    !.

% Verificaci?n para que X y Y no sean iguales y que el enemigo no se
% repita
aliado(X,Y,Z):-
    \==(X,Y),
    enemigo(Y,Z),
    not(==(X,Z)).

% Validar y que no de false, cuando se termine
aliado(X,_,Z):-!.

% EJERCICIO 3
% Elabore una cl?usula de aridad 2 que reciba un n?mero
% entero en el primer argumento y en el segundo indique la suma de los
% digitos que contiene el n?mero proporcionado. Por ejemplo, si se
% consulta: ?- sumardigitos(837, X), entonces Prolog responde: X = 18.

% Clausula para definir los n?meros a sumar
sumardigitos(N,M):-
    number(N),
    sumar(N,0,M).

% Verificar para cuando no se cumple y termina
sumar(0,M,M):- !.

% Funci?n recursiva, que valida que el n?mero no sea menor a 0
% Se va reduciendo entre 10, y se guarda el residuo
% Luego se van sumando los resultados y se llama a la funci?n recursiva
sumar(N,V,M):-
    >(N,0),
    is(C,//(N,10)),
    is(Res, mod(N,10)),
    is(V1, +(V,Res)),
    sumar(C,V1,M).
