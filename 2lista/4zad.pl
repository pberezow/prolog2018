ma(a, aa).
ma(b, bb).
ma(c, cc).
ma(d, dd).

daje(1, a, aa, b).
daje(4, b, aa, c).
daje(7, c, aa, a).
daje(5, b, bb, a).
daje(4, c, cc, a).
daje(2, d, dd, b).

ma(Kiedy, _, _) :-
    Kiedy < 0,
    !,
    fail.
ma(0, Kto, Co) :-
    ma(Kto, Co),
    !.
ma(Kiedy, Kto, Co) :-
    integer(Kiedy),
    daje(Kiedy, Kto, Co, _),
    !,
    fail.
ma(Kiedy, Kto, Co) :-
    integer(Kiedy),
    daje(Kiedy, _, Co, Kto),
    !.
ma(Kiedy, Kto, Co) :-
    integer(Kiedy),
    Kiedy2 is Kiedy - 1,
    ma(Kiedy2, Kto, Co).