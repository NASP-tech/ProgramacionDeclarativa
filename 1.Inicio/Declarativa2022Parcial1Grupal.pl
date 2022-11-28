%Parcial 1 Grupal Programacion Declarativa 2022
%Ing. Guillermo Cortes y Jaime Serrano
%Grupo:
% -> Herson Alexander Reyes Rivas 00216519
% -> Alberto Enrique de Leon Quinonez 00087919
% -> Dylan Moises Melendez Linares 00087018
% -> Natalia Alexandra Solorzano Paz 00120319

% Ejercicio 2

contador_elemento([],_,0):- !.

contador_elemento([X|Col],X,Cont):- 
    contador_elemento(Col,X,Cont1),
    is(Cont,+(Cont1,1)),!.

contador_elemento([_|Col],X,Cont):- 
    contador_elemento(Col,X,Cont1),
    is(Cont,Cont1).

% Ejercicio 1

calc(0,_,_,_,_):- !.

calc(A,C,B,D,E):-
    sumardigitos(A,B,C,D,E).

sumardigitos(N,M,D,P,I):-
    number(N),
    sumar(N,0,M,0,D,0,P,0,I).

sumar(0,M,M,D,D,P,P,I,I):- !.

sumar(N,V,M,AuxD,D,AuxP,P,AuxI,I):-
    >(N,0),
    is(C,//(N,10)),
    is(Res, mod(N,10)),
    =:=(mod(Res,2),0),
    is(AuxP1, +(AuxP, 1)),
    is(V1, +(V,Res)),
    is(AuxD1, +(AuxD, 1)),
    sumar(C,V1,M,AuxD1,D,AuxP1,P,AuxI,I), !.

sumar(N,V,M,AuxD,D,AuxP,P,AuxI,I):-
    >(N,0),
    is(C,//(N,10)),
    is(Res, mod(N,10)),
    not(=:=(mod(Res,2),0)),
    is(AuxI1, +(AuxI, 1)),
    is(V1, +(V,Res)),
    is(AuxD1, +(AuxD, 1)),
    sumar(C,V1,M,AuxD1,D,AuxP,P,AuxI1,I), !.