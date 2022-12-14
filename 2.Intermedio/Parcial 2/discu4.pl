% Problema 1) Calculo de Altura de un Arbol Binario

altura_arbol([],0):- !.

altura_arbol([arbIzq,_,arbDer],H):-
    altura_arbol(arbIzq, HI),
    altura_arbol(arbDer, HD),
    is(H,+(1,max,(HI,HD))).


% Para probarlo
% altura_arbol([[[[],1,[]],2,[[],3[]]],4,[[[],5,[]],6,[[],7,[]]]],H).


% Problema 2) Realice la suma de las llaves de los nodos de un BT

suma_llaves([],0):- !.

suma_llaves([SubIzq,Nodo,SubDer],Sum):-
    suma_llaves(SubIzq,SumI),
    suma_llaves(SubDer,SumD),
    is(Sum,+(+(Nodo,SumI),SumD)),!.



% Problema 3) Cuente la cantidad de nodos en un BT

contar_nodos([],0):- !.
contar_nodos([subIzq,_,subDer],contador):-
    contar_nodos(subIzq,CI),
    contar_nodos(subDer,CD),
    id(contador,+(1,+(CI,CD))).


% Problema 4) Contar la cantidad de nodos que se visitan hasta encontrar
% el valor que se desea buscar. Considere el hecho de que la llave puede
% no encontrarse en el ?rbol.


contar_visitas([],_,'Llave no encontrada'):-!.
contar_visitas([_,nodo,_],nodo,1):-!.

contar_visitas([subIzq,nodo,_],dato,cont):-
    <(dato, nodo),
    contar_visitas(subIzq, dato, contIzq),
    (
        number(contIzq),is(cont,+(1,contIzq)),!
        ;
        not(number(contIzq)), =(cont,contIzq)
    ).

contar_visitas([_,nodo,subDer],dato,cont):-
    <(dato, nodo),
    contar_visitas(subDer, dato, contDer),
    (
        number(contDer),is(cont,+(1,contDer)),!
        ;
        not(number(contDer)), =(cont,contDer)
    ).



% Problema 5)
% Tres senoras de apellidos Blanco, Rubio y Castano, se conocen en una
% reunion. Poco despues de hacer las presentaciones, una de ellas hace
% notar: "Es muy curioso que nuestros apellidos sean Blanco, Rubio y
% Castano, y que nos hayamos reunido aqui tres personas con esos mismos
% colores de cabello". "Si que lo es - dijo la dama de pelo rubio-, pero
% habra observado que nadie tienen el color de pelo que corresponde a su
% apellido." "Es verdad!" - exclamo la senora de apellido Blanco. Si la
% ultima dama no tiene el pelo castano, De que color es el cabello de
% las tres senoras?
%
%Blanco no es blanco ni castallo - entonces Rubio
%Rubio o blanco o castallo - entonces castano
%Castano - ni castano ni rubio - entonces blanco

color_cabello(blanco).
color_cabello(rubio).
color_cabello(castano).

colorCabello(S):-
    =(S,[SraBlanco,SraRubio,SraCastano]),
    color_cabello(SraBlanco),
    \==(SraBlanco,blanco),
    \==(SraBlanco,castano),
    color_cabello(SraRubio),
    \==(SraRubio,rubio),
    \==(SraRubio,SraBlanco),
    color_cabello(SraCastano),
    \==(SraCastano,castano),
    \==(SraCastano,SraRubio),
    \==(SraCastano,SraBlanco),!.


% colorCabello(S).


% Problema 6)
% En una hilera de cuatro casas, los V?squez viven al lado de los Moreno
% pero no al lado de los Gonz?les. Si los Gonz?les no viven al lado de
% los Flores, En qu? orden est?n las casas de las cuatro familias?, Hay
% m?s de una posibilidad?


asignar_casa([1,X],[[1,X],_,_,_]).
asignar_casa([2,X],[_,[2,X],_,_]).
asignar_casa([3,X],[_,_,[3,X],_]).
asignar_casa([4,X],[_,_,_,[4,X]]).

cuatro_casas(Hilera):-
    =(Hilera,[[1,_],[2,_],[3,_],[4,_]]),
    asignar_casa([V,vasquez],Hilera),
    asignar_casa([M,moreno],Hilera),
    (
        succ(M,V);
        succ(V,M)
    ),
    asignar_casa([G,gonzalez],Hilera),
    (
        >(V,+(G,1));
        <(V,-(G,1))
    ),
    asignar_casa([F,flores],Hilera),
    (
        >(G,+(F,1));
        <(G,-(F,1))
    ).

% cuatro_casas(Hilera).
