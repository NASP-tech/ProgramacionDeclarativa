%EJERCICIO1

d(X, X, 1):- atom(X), not(number(X)), !.
d(X, C, 0):- atom(X), not(number(X)), number(C), !.
d(X, C*X, C):-  atom(X), not(number(X)), number(C), !.
d(X, log(X), 1/X):-  atom(X), not(number(X)), !.
d(X, A^X, A^X*log(A)):- atom(X), not(number(X)),number(A), !.
d(X, X^N, N*(X^(N1))):- atom(X), not(number(X)), number(N), is(N1, -(N, 1)), !.
d(X, C*Fx, C*DFx):-number(C), d(X, Fx, DFx),!.

d(X,  X^(1/N), 1/(N*((X)^(N1/N)))):-  atom(X), not(number(X)), number(N), is(N1, -(N, 1)), !.
d(X, X^(1/N), 1/(N*(((X)^Ne)))):- atom(X), not(number(X)), number(N), is(N1, -(N, 1) ), =(Ne, /(N1, N)), !.

d(X, Fx+Gx, DFx+DGx):- d(X, Fx, DFx), d(X, Gx, DGx), !.
d(X, Fx-Gx, DFx-DGx):- d(X, Fx, DFx), d(X, Gx, DGx), !.

d(X, Fx*Gx, DFx*Gx+Fx*DGx):- d(X, Fx, DFx), d(X, Gx, DGx), !.
d(X, Fx/Gx, (DFx*Gx-Fx*DGx)/Gx^2):-  d(X, Fx, DFx), d(X, Gx, DGx), !.

%derivadas trigonometricas inversas
%arccos
d(X, arccos(U), -Du/sqrt(1-(U)^2)):- atom(X), not(number(X)), d(X, U, Du),!.

%arctan
d(X, arctan(U), Du/(1+(U)^2)):- atom(X), not(number(X)), d(X, U, Du),!.

%arccosec
d(X, arccosec(U), -Du/(U*sqrt((U)^2-1))):- atom(X), not(number(X)), d(X, U, Du),!.

%arcsec
d(X, arcsec(U), Du/(U*sqrt((U)^2-1))):- atom(X), not(number(X)), d(X, U, Du),!.

%arccot
d(X, arccot(U), -Du/(1+(U)^2)):- atom(X), not(number(X)), d(X, U, Du),!.
