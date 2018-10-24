max_sum([], _, S, S).
max_sum([X | L], Sglob, S1, S) :-
    Sglob1 is Sglob + X,
    Sum is S1 + X,
    S2 is max(S1, Sum),
    X >= S2,
    max_sum(L, Sglob1, X, S).
max_sum([X | L], Sglob, S1, S) :-
    Sglob1 is Sglob + X,
    Sum is S1 + X,
    S2 is max(S1, Sum),
    X < S2,
    S2 = S1,
    max_sum(L, Sglob1, S2, S).
max_sum([X | L], Sglob, S1, S) :-
    Sglob1 is Sglob + X,
    Sum is S1 + X,
    S2 is max(S1, Sum),
    X < S2,
    S2 = Sum,
    (Sum =< Sglob1 -> max_sum(L, Sglob1, S2, S); (
        X < S1 -> max_sum(L, Sglob1, S1, S); max_sum(L, Sglob1, X, S))).
max_sum(L, S) :-
    max_sum(L, 0, 0, S).