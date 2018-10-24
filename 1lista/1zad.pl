jest_matką(X) :- 
    matka(X, Y).
jest_ojcem(X) :- 
    ojciec(X, Y).
jest_synem(X) :- 
    mężczyzna(X), 
    rodzic(Y, X).
siostra(X, Y) :- 
    rodzic(Z, X), 
    rodzic(Z, Y), 
    kobieta(X),
    X \= Y.
dziadek(X, Y) :- 
    ojciec(X, Z), 
    rodzic(Z, Y).
rodzeństwo(X, Y) :- 
    rodzic(Z, X), 
    rodzic(Z, Y),
    X \= Y.

