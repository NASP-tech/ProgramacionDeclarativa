% Programaci?n Declarativa 02-2022
% Natalia Alexandra Sol?rzano Paz 00120319
% Discusion Evaluada 2
% Jaime Orlando Serrano Rivas
% 1. Cinco amigos estaban desesperados por ir a celebrar el fin de ex?menes
% en Tunco. Acordaron que, despu?s del ?ltimo examen, saldr?an volando a
% la playa, sin esperar a nadie que se tardara. El d?a del ?ltimo
% examen, el primero en terminarlo fue Chico, Paco sali? despu?s de
% Pancho, Chepe no fue al paseo y Jos? sali? inmediatamente antes de
% Paco. ?En qu? orden terminaron el examen?

%Tenemos a Chico, Paco, Pancho, Chepe, Jose
% Chico, Pancho, Jos?, Paco
% Chepe no fue


fin_E([1,E],[[1,E],_,_,_,_]).
fin_E([2,E],[_,[2,E],_,_,_]).
fin_E([3,E],[_,_,[3,E],_,_]).
fin_E([4,E],[_,_,_,[4,E],_]).
fin_E([5,E],[_,_,_,_,[5,E]]).

orden_E(Parcial):-
    =(Parcial,[[1,_],[2,_],[3,_],[4,_],[5,_]]),
      fin_E([E1,chico],Parcial),
      fin_E([E2,pancho],Parcial),
      (
          succ(E1,E2);
          succ(E2,E1)
      ),
      fin_E([E3,jose],Parcial),
      (
          succ(E2,E3);
          succ(E3,E2)
      ),

      fin_E([E4,paco],Parcial),
      (
          succ(E3,E4);
          succ(E4,E3)
      ),

      fin_E([E5,chepe],Parcial),
      (
          succ(E4,E5);
          succ(E5,E4)
      ),!.

% Para probarlo -> orden_E(Parcial).


% 2. Elabore un programa en Prolog que invierta un ?rbol binario, es decir,
% todos los hijos izquierdos pasan a ser hijos derechos, y viceversa.

arbol_invertido([], 0):-!.
arbol_invertido([Izq, Raiz, Der], [DerInv, Raiz, IzqInv]) :-
    arbol_invertido(Izq, IzqInv),
    arbol_invertido(Der, DerInv).
