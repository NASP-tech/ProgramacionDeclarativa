contador_elemento([],_,0):- !.

contador_elemento([Cab|Col],X,Cont):- 
    contador_elemento(Col,X,Cont1),
    ==(Cab,X),
    is(Cont,+(Cont1,1)),!.

contador_elemento([Cab|Col],X,Cont):- 
    contador_elemento(Col,X,Cont1),
    \==(Cab,X),
    is(Cont,Cont1).