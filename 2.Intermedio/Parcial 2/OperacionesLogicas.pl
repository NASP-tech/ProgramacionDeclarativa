% Base de hechos:

conoce(pepito, pedro).
conoce(pedro, rita).
conoce(maria, enrique).
conoce(maria, susana).
conoce(rita, manuel).
conoce(manuel, joaquin).
conoce(manuel, pedro). % Este provoca un ciclo infinito.
%conoce(manuel, juana). % Este provoca un ciclo infinito.
conoce(jorge, luisa).
conoce(eduardo, rocio).
%conoce(alejandra, manuel). % Este provoca un ciclo infinito.
conoce(rubidia, julio).
conoce(maria, jaime).
conoce(luisa, patricia).
conoce(luisa, ricardo).
conoce(enrique, etelvina).
conoce(maria, jorge).
conoce(manuel, alejandra).
conoce(rocio, felipe).
conoce(juana, burbuja).
conoce(rocio, rita).
conoce(jorge, rita).
%conoce(juana, burbuja).
conoce(rita, etelvina).
conoce(eduardo, felipe).
conoce(manuel, juana).
%conoce(manuel, pedro). %Aqui no provoca ciclo infinito.
conoce(rita, jorge).
conoce(ricardo, luisa).
conoce(rita, luisa).
conoce(jorge, pedro).
conoce(pedro, jaime).
conoce(susana, maria).
conoce(maria, pedro).
conoce(pedro, eduardo).
conoce(eduardo, raul).
conoce(raul, jaime).
conoce(pedro, juan).
conoce(juan, pablo).
conoce(pablo, joaquin).

/* ***************************************** */
% Esta versión de la regla da problemas:
desea_conocer(X, Y):-
    conoce(X, Y),
    writeln(Y), !.

desea_conocer(X, Y):-
    conoce(X, Z),
    desea_conocer(Z, Y),
    writeln(Z).

/* ***************************************** */
% Esta versión de la regla ya no da problemas:
desea_conocer_v2(X, Y):-
    abolish(eslabon, 1),
    assert(eslabon(X)),
    desea_conocer_v2_rec(X, Y).

desea_conocer_v2_rec(X, Y):-
    conoce(X, Y),
    assert(eslabon(Y)), !.

desea_conocer_v2_rec(X, _):-
    conoce(X, Z),
    eslabon(Z),
    fail.

desea_conocer_v2_rec(X, Y):-
    conoce(X, Z),
    not(eslabon(Z)),
    assert(eslabon(Z)),
    desea_conocer_v2_rec(Z, Y), !.


% Con operador o-lógico utilizado en la regla:
/*desea_conocer_v2_rec(X, Y):-
    conoce(X, Z),
    (
        eslabon(Z), fail;
        not(eslabon(Z)), assert(eslabon(Z)), desea_conocer_v2_rec(Z, Y)
    ).*/









