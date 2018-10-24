is_prime(1).
is_prime(2).
is_prime(X) :-
    X > 2,
    X mod 2 =\= 0,
    Max is sqrt(X),
    check(X,3,Max).

check(X,N,Max) :-
    N > Max.

check(X,N,Max) :-
    X mod N =\= 0,
    M is N + 1,
    check(X,M,Max).



prime(LO,HI,N) :-
    M is LO,
    is_prime(M), N is M.

prime(LO,HI,N) :-
    M is LO + 1,
    M < HI,
    prime(M,HI,N).