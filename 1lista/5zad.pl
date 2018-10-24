częściowy_porządek() :-
    le(X,X),
    (X \= Y, Y \= Z, \+ (le(X,Y), le(Y,Z), \+ le(X,Z))),
    \+ (X \= Y, le(X,Y), le(Y,X)).

% (X \= Y, Y \= Z, le(X,Y), le(Y,Z), le(X,Z)),