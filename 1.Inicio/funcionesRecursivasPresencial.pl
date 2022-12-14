%Realizar la suma de los enteros comprendidos
%en un intervalo [a, b]:

%Utilizando recursión por posposición
sumaEnteros(X,X,R) :-
    is(R,X),
    !.

sumaEnteros(X,Y,R) :-
    >=(Y,X),
    is(Y1, -(Y,1)),
    sumaEnteros(X,Y1,R1),
    is(R, + (R1, Y)).

% Utilizando recursión de cola:
suma_intervalo2(B,B,Acum, Suma):-
    is(Suma, +(B, Acum)),
    !.

suma_intervalo2(A, B, Acum, Suma):-
    <(A,B),
    is(A2, +(A,1)),
    is(Acum2, +(A, Acum)),
    suma_intervalo2(A2, B, Acum2, Suma).

%?- |     suma_intervalo(1,4,0,R).
%Correct to: "suma_intervalo2(1,4,0,R)"?
%Please answer 'y' or 'n'? yes
%R = 10.


%Metamorfosis de la rana
%Consulta a una base cualquiera

fase(huevo).
fase(embrion).
fase(renacuajo).
fase(renacuajo_con_dos_patas).
fase(renacuajo_con_cuatro_patas).
fase(rana_de_cola_corta).
fase(rana_adulta).

se_transforma_en(huevo, embrion).
se_transforma_en(embrion, renacuajo).
se_transforma_en(renacuajo, renacuajo_con_dos_patas).
se_transforma_en(renacuajo_con_dos_patas, renacuajo_con_cuatro_patas).
se_transforma_en(renacuajo_con_cuatro_patas, rana_de_cola_corta).
se_transforma_en(rana_de_cola_corta, rana_adulta).


fases_rana(Fase):-
    %La variable de prolog
    var(Fase),
    writeln("huevo"),
    fases_rana(huevo),
    !.

fases_rana(Fase):-
    not(fase(Fase)),
    writeln("Nombre de fase no valido"),
    !.

fases_rana(Fase):-
    %Variable temporal
    not(se_transforma_en(Fase,_)),
    writeln("Fin de la metamorfosis"),
    !.

fases_rana(Fase):-
    se_transforma_en(Fase, W),
    writeln(W),
    fases_rana(W).


%Suma de valores dentro de un intervalo de [a, b]

%RECOMENDACIONES PARA LA ELABORACION DE CLAUSULAS
%1. hechos, casos triviales, versiones no recursivas
%2. versiones recursivas
%3. dentro de la clausula, menos ocurrencias, o validaciones
%4. si es recursiva, por ultimo colocar la llamada recursiva

%Arboles de recursion SLD
% Representadas por grafos, con nodos raiz, intermedios, y finales
% Deriva todo a partir de las subsecuencias de la raiz
% Va dependiendo de los niveles, las ramas dependen de la raiz
% obj1( cuantas ramas hay que sacar para el segundo nivel,  )
% por la cantidad de aridad y clausulas que tengan el mismo nombre
% El primero determina cuantas ramas llegan al segundo nivel


% cuando un obj es la cabeza de la clausula se baja de nivel, en el
% siguitente nivel se sustituye ese objetivo por el cuerpo de la
% clausula...



%   EJEMPLO
%   Dadas las bases de conocimiento que se muestran realice en cada cada
%   la consulta que se plantea
%
%   1) BC:
%      q(a,d).
%      q(a,b).
%      r(b,c).
%      p(x,y):-
%         q(x,y),
%         r(y,w).
%
%     Consulta:
%     ?-p(M,N).


%Entonces (lectura vertical)
%
%   RAIZ
%   p(M,N)
%      |x/M
%      |y/N
%   q(M,y),r(y,N) *
%   El valor mas bajo va a la izq, y el mas alto a la der
%   ej. q(a,d) y q(a,b) d esta debajo de b
%
%   RAMAS
% * q(M,y)   ,   r(Y,N)
%   |M/a         |M/a
%   |Y/d         |Y/b
%   r(d,N)       r(b,N)
%   fallo :(     |b/b
%                |N/c
%                vacio :)
%                EXITO
%                M = a
%                N = c

% Si hay una tercera rama, se junta con las otras ramas para poder hacer
% los subconjuntos
%
%







