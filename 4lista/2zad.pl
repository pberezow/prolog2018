na_lewo(Lewy, Prawy, [Lewy, Prawy | _]).
na_lewo(Lewy, Prawy, [_ | T]) :-
    na_lewo(Lewy, Prawy, T).

obok(X, Y, Domy) :-
    na_lewo(X, Y, Domy).
obok(X, Y, Domy) :-
    na_lewo(Y, X, Domy).



rybki(Kto) :-
    %dom(numer, kolor, mieszkaniec, zwierzeta, pije, pali)
    Domy = [dom(1,_,_,_,_,_),dom(2,_,_,_,_,_),dom(3,_,_,_,_,_),dom(4,_,_,_,_,_),dom(5,_,_,_,_,_)],
    member(dom(1,_,norweg,_,_,_), Domy),
    member(dom(_,czerwony,anglik,_,_,_), Domy),
    na_lewo(dom(_,zielony,_,_,_,_), dom(_,bialy,_,_,_,_), Domy),
    member(dom(_,_,dunczyk,_,herbata,_), Domy),
    obok(dom(_,_,_,koty,_,_), dom(_,_,_,_,_,light), Domy),
    member(dom(_,zolty,_,_,_,cygaro), Domy),
    member(dom(_,_,niemiec,_,_,fajka), Domy),
    member(dom(3,_,_,_,mleko,_), Domy),
    obok(dom(_,_,_,_,_,light), dom(_,_,_,_,woda,_), Domy),
    member(dom(_,_,_,ptaki,_,bez_filtra), Domy),
    member(dom(_,_,szwed,psy,_,_), Domy),
    obok(dom(_,niebieski,_,_,_,_), dom(_,_,norweg,_,_,_), Domy),
    obok(dom(_,zolty,_,_,_,_), dom(_,_,_,konie,_,_), Domy),
    member(dom(_,_,_,_,piwo,mentol), Domy),
    member(dom(_,zielony,_,_,kawa,_), Domy),
    member(dom(_,_,Kto,rybki,_,_), Domy).