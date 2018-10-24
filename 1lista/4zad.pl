maksymalny(X) :-
    \+ le(X,Y).
największy(X) :-
    \+ le(X,Y),
    \+ (le(X,Z); le(Z,X)).
    
minimalny(X) :-
    \+ le(Y,X).
najmniejszy(X) :-
    \+ le(Y,X),
    \+ (le(X,Z); le(Z,Y)).