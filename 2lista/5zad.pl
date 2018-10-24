ciag(Pierwszy, Ostatni, L, Wynik) :-
    Pierwszy > Ostatni,
    append([], L, Wynik), !.
ciag(Pierwszy, Ostatni, L, Wynik) :- %tworzy liste [Pierwszy, Pierwszy, Pierwszy+1, Pierwszy+1, ..., Ostatni, Ostatni]
    append(L, [Pierwszy, Pierwszy], L1),
    Nastepny is Pierwszy + 1,
    ciag(Nastepny, Ostatni, L1, Wynik1),
    append([], Wynik1, Wynik).

permutacje(Pierwszy, Ostatni, Wynik) :- %tworzy liste permutacji listy [1,1,2,2,3,3,...,N,N]
    ciag(Pierwszy, Ostatni, [], W),
    findall(X, permutation(W, X), Lista),
    sort(Lista, Wynik).

sprawdzenie_krotnosci(Liczba, Lista) :- %sprawdzenie czy miedzy dwoma wystapieniami liczby Liczba wystepuje parzysta liczba elementow 
    append(X, [Liczba | _], Lista),
    append(X, Lista1, Lista),
    append([Liczba | Y], [Liczba | _], Lista1),
    parzyste(Y).

parzyste(Lista) :- %sprawdzenie czy Lista ma parzysta liczbe elementow
    length(Lista, Int),
    Int2 is Int / 2,
    integer(Int2).

kolejnosc(Liczba, Max, _) :-
    Liczba > Max.
kolejnosc(Liczba, Max, Lista) :- %sprawdzenie czy przed liczba Liczba nie wystepuja wieksze liczby.
    append(L, [Liczba | _], Lista),
    forall(member(X, L), X < Liczba),
    Liczba1 is Liczba + 1,
    kolejnosc(Liczba1, Max, Lista).
kolejnosc(Max, Lista) :-
    kolejnosc(1, Max, Lista).
    

lista(N, X) :-
    permutacje(1, N, Lista),
    findall(L, 
        (member(L, Lista), 
        findall(Z,
            (between(1,N,Z),
            sprawdzenie_krotnosci(Z, L)),
            Wynik1),
        length(Wynik1, N)),
        Wynik2),
    findall(L1, (member(L1, Wynik2), kolejnosc(N, L1)), Wynik),
    !,
    member(X, Wynik).
    