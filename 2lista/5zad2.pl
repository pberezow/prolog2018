perm(N, X) :-
    perm(N, X, 1, []).

perm(N, X, Curr, L) :-
    Curr > N,
    append([], L, X), !.

perm(N, X, Curr, L) :-
    append(L, [Curr], L1),
    Curr1 is Curr + 1,
    perm(N, Y, Curr1, L1),
    append([], Y, X).


lista(N, X) :-
    perm(N, NotUsed),
    lista(N, X, 1, NotUsed, []).

lista(N, X, Curr, NotUsed, L) :-
    Curr > N,
    append([], X, L).

lista(N, X, Curr, NotUsed, L) :-
    member(Number, NotUsed),
    append(L, [Curr, Number], L1),
    Curr1 is Curr + 1,
    select(Number, NotUsed, NotUsed1),
    lista(N, Y, Curr1, NotUsed1, L1),
    append([], Y, X).
    






    % generujemy ciag [1, _, 2, _, ... , N, _].
    % podstawiamy za _ lisowe liczby od 1 do N