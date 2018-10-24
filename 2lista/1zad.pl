srodkowy(X, [X]).
srodkowy(X, L) :-
    append([_ | L1], [_], L),
    srodkowy(X, L1).
