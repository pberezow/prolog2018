arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osiagalny(X, X).
osiagalny(X, Y) :-
    szukaj(X, Y, [X]).

szukaj(X, Y, L) :-
    arc(X, Z),
    \+ member(Z, L),
    (Y=Z;
    szukaj(Z, Y, [Z | L])).