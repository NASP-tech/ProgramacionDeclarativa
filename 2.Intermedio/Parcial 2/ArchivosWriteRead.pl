seis_amigos(Medio):-
    =(Medio, [Auto, Avion, Tren]),
    =(Auto, [_,_]),
    =(Avion, [_,_]),
    =(Tren, [_,_]),

    transporte(alejandro, MedioAle, Medio),
    \==(MedioAle, auto),
    transporte(benito, MedioBen, Medio),
    \==(MedioBen, avion),
    ==(MedioAle, MedioBen),

    transporte(andres, avion, Medio),
    transporte(carlos, MedioCar, Medio),
    \==(MedioCar, avion),
    transporte(dario,MedioDar, Medio),
    \==(MedioDar, MedioCar),

    transporte(tomas, _, Medio), !.


transporte(Amigo, auto, [[Amigo,_], _, _]).
transporte(Amigo, auto, [[_,Amigo],_,_]).

transporte(Amigo, avion, [_,[Amigo,_],_]).
transporte(Amigo, avion, [_,[_, Amigo],_]).

transporte(Amigo, tren, [_,_,[Amigo, _]]).
transporte(Amigo, tren, [_,_,[_, Amigo]]).



abrir_y_cerrar:-
    open('miarchivo.txt', write, Archivo),
    close(Archivo).

leer_archivo:-
    open('nombre.txt', read, Datos),
    write('El nombre almacenado es: '),
    read(Datos, Var),
    write(Var),
    close(Datos).

grabar_en_archivos:-
    write('Introduzca su nombre: '),
    read(Var),
    open('nombre.txt', write, Datos),
    write(Datos, Var),
    close(Datos).

grabar_en_archivo2:-
    writeln('Introduzca el nombre del archivo en disco: '),
    read(Nombre),
    writeln('Introduzca el nombre del flujo: '),
    read(NombreFlujo),
    writeln('Introduzca su nombre: '),
    read(Var),
    open(Nombre, write, NombreFlujo),
    writeln(NombreFlujo, Var),
    close(NombreFlujo).

leerDeArchivoNoVacio:-
    open('lista_numeros.txt', read, ListaNumeros),
    lectura(ListaNumeros),
    close(ListaNumeros).

lectura(Flujo):-
    read(Flujo, Valor),
    probar(Valor, Flujo).

probar(Valor, _):-
    ==(Valor, end_of_file),
    write('Se agotaron los datos'), nl,
    !.

probar(Valor, Flujo):-
    \==(Valor, end_of_file),
    write(Valor), n1,
    lectura(Flujo).

grabarLista(L):-
    write('Digite el nombre del archivo destino: '),
    read(Nombre),
    open(Nombre, write, ListaNum),
    meterNumeros(ListaNum, L),
    close(ListaNum).

meterNumeros(_, []).

meterNumeros(Flujo, [Cab|Col]):-
    write(Flujo, Cab),
    write(Flujo, '.'),
    write(Flujo, '\n'),
    meterNujmeros(Flujo, Col).

