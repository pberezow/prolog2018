count_perm([], [], X, X).
count_perm([E | L], [E1 | L1], X1, X) :-
    (E = E1 -> X2 is X1; X2 is X1 + 1),
    count_perm(L, L1, X2, X).
count_perm(L, L1, X) :-
    count_perm(L, L1, 0, X).

even_permutation(Xs, Xs).
even_permutation(Xs, Ys) :-
    permutation(Xs, Ys),
    count_perm(Xs, Ys, X),
    X1 is X mod 2,
    X1 = 1.

odd_permutation(Xs, Ys) :-
    permutation(Xs, Ys),
    count_perm(Xs, Ys, X),
    X =\= 0,
    0 is X mod 2.





% X % 2 == 0 -> nieparzysta
% X % 2 == 1 -> parzysta