wariancja(L, D) :-
    length(L, Dlugosc),
    sum_list(L, Suma),
    Srednia is Suma / Dlugosc,
    wariancja(L, Srednia, Dlugosc, 0, D).
wariancja([], _, Dlugosc, Sumy, D) :-
    D is Sumy / Dlugosc.
wariancja([X | L], Srednia, Dlugosc, Sumy, D) :-
    Y is X - Srednia,
    Kw is Y * Y,
    Sumy1 is Sumy + Kw,
    wariancja(L, Srednia, Dlugosc, Sumy1, D).




% srednia(L, X) :-
%     sum_list(L, Sum),
%     length(L, Len),
%     X is Sum / Len.

% sumy([], _, Wynik,  X) :-
%     X is Wynik.
% sumy([E | L], Srednia, Wynik, X) :-
%     Y is E - Srednia,
%     K is Y * Y,
%     Wynik1 is Wynik + K,
%     sumy(L, Srednia, Wynik1, X1),
%     X is X1.

% sumy(L, X) :-
%     srednia(L, Srednia),
%     sumy(L, Srednia, 0, X).
    
    

% wariancja(L, D) :-
%     sumy(L, Sumy),
%     length(L, Dlugosc),
%     D is Sumy / Dlugosc.
