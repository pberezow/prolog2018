dzialanie(A, B, A + B).

dzialanie(A, B, A - B).

dzialanie(A, B, A *B).

dzialanie(A, B, A / B) :-
    B =\= 0.


utworz_wyrazenie([], Wyrazenie, Wyrazenie).

utworz_wyrazenie([H | T], Wyrazenie, Wyrazenie1) :-
    dzialanie(Wyrazenie, H, WyrazenieNowe),
    utworz_wyrazenie(T, WyrazenieNowe, Wyrazenie1).

utworz_wyrazenie([H1, H2 | T], Wyrazenie, Wyrazenie1) :-
    dzialanie(H1, H2, W1),
    utworz_wyrazenie([W1 | T], Wyrazenie, Wyrazenie1).

wyrazenie([H | T], Wartosc, Wyrazenie) :-
    utworz_wyrazenie(T, H, Wyrazenie),
    Wartosc is Wyrazenie.