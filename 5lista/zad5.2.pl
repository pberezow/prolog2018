
match([H|_],0,H) :-
    !.
match([_|T],N,H) :-
    N > 0,
    N1 is N-1,
    match(T,N1,H).

board(L):- length(L,Len),rysujl(0,Len),rysujhelp(0,Len,L).

rysujhelp(Counter,Counter,_):-!.
rysujhelp(Counter,Counterr,LW):-
                    Counterr mod 2 =:= 0 ->
                    (
                      rysuj(Counter,0,Counterr,LW),
                      rysuj(Counter,0,Counterr,LW),
		      rysujl(0,Counterr),
		      Counter2 is Counter + 1,
                      rysujhelpp(Counter2,Counterr,LW)
		    );
                    (
                      rysujcz(Counter,0,Counterr,LW),
                      rysujcz(Counter,0,Counterr,LW),
                      rysujl(0,Counterr),
		      Counter2 is Counter + 1,
                      rysujhelpp(Counter2,Counterr,LW)
		    ).

rysujhelpp(Counter,Counter,_):-!.
rysujhelpp(Counter,Counterr,LW):-
                    \+ (Counterr mod 2 =:= 0) ->
		    (
                      rysuj(Counter,0,Counterr,LW),
                      rysuj(Counter,0,Counterr,LW),
		      rysujl(0,Counterr),
		      Counter2 is Counter + 1,
                      rysujhelp(Counter2,Counterr,LW)
		    );
                    (
                      rysujcz(Counter,0,Counterr,LW),
                      rysujcz(Counter,0,Counterr,LW),
                      rysujl(0,Counterr),
		      Counter2 is Counter + 1,
                      rysujhelp(Counter2,Counterr,LW)
		    ).


rysuj(_,Counterr,Counterr,_):-write('|'),nl,!.
rysuj(X,Counter,Counterr,LW):-
		   (
                    Counter mod 2 =:= 0 ->
		    (
                        match(LW,(Counter),H),
                        \+ (Counterr-H =:= X) ->
		          write('|     ');
                          write('| ### ')
		    );
                    (
                        match(LW,(Counter),H),
                        \+ (Counterr-H =:= X) ->
		          write('|:::::');
                          write('|:###:')
		    )
                   ),
		   Counter2 is Counter + 1,
                   rysuj(X,Counter2,Counterr,LW).

rysujcz(_,Counterr,Counterr,_):-write('|'),nl,!.
rysujcz(X,Counter,Counterr,LW):-
		   (
                    \+ (Counter mod 2 =:= 0) ->
		    (
                        match(LW,(Counter),H),
                        \+ (Counterr-H =:= X) ->
		          write('|     ');
                          write('| ### ')
		    );
                    (
                        match(LW,(Counter),H),
                        \+ (Counterr-H=:= X) ->
		          write('|:::::');
                          write('|:###:')
		    )
                   ),
		   Counter2 is Counter + 1,
                   rysujcz(X,Counter2,Counterr,LW).

rysujl(Counterr,Counterr):-write('+'),nl,!.
rysujl(Counter,Counterr):-
		   write('+-----'),
		   Counter2 is Counter + 1,
                   rysujl(Counter2,Counterr).















































