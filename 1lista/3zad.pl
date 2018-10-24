above(ball, bicycle).
above(bicycle, pencil).
above(camera, butterfly).
left_of(butterfly, fish).
left_of(hourglass, butterfly).
left_of(pencil, hourglass).

left_of_rec(X,Y) :-
    left_of(X,Y).
left_of_rec(X,Y) :-
    left_of(X,Z),
    left_of_rec(Z,Y).

above_rec(X,Y) :-
    above(X,Y).
above_rec(X,Y) :-
    above(X,Z),
    above_rec(Z,Y).
right_of(X,Y) :-
    left_of_rec(Y,X).
below(X,Y) :-
    above_rec(Y,X).

higher(X,Y) :-
    above_rec(X,Y).
higher(X,Y) :-
    above_rec(X,Z),
    (left_of_rec(Y,Z); left_of_rec(Z,Y)).
higher(X,Y) :-
    above(X,Z), above(Y,L),
    higher(Z,L).