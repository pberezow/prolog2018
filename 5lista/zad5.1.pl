scanner(Stream, W4) :-
    read_line_to_codes(Stream, Codes),
    read_file(Stream, Y, Codes),
	rozerwij1(Y, [], W),
	rozerwij2(W, [], W2),
	rozerwij3(W2, [], W3),
	tokenizacja(W3, [], W4),
	!.


read_file(_, _, C) :-
    C = 'end_of_file',!.
read_file(Stream, [X|L], C) :-
    atom_chars(X, C),
    read_line_to_codes(Stream, Codes),
    read_file(Stream, L, Codes).


rozerwij1([], Wyn, Wyn) :- !.
rozerwij1([S|Y], W, Wyn) :-
	split_string(S, ' ', '', L),
    append(W, L, W2),
    rozerwij1(Y, W2, Wyn).

wstaw([], _, _) :- !.
wstaw([S1,S2|Y], Sep, W) :-
	append(W, S1, W1),
	append(W1, Sep, W2),
	append(W2, S2, W3),
	!,
	wstaw(Y, Sep, W3).
wstaw([S1|Y], Sep, W) :-
	append(W, S1, W2).

rozerwij2([], Wyn, Wyn) :- !.
rozerwij2([S|Y], W, Wyn) :-
    SEP = [';','+','-','*','/' ,'(',')','<','>','=<','>=',':=','=','/='],
    member(B, SEP),
    % string_concat(S1, B, S),
	split_string(S, B, '', L),
	wstaw(L, B, W0),
    append(W, W0, W1),
    rozerwij2(Y, W1, Wyn).
% rozerwij2([S|Y], W, Wyn) :-
%     string_concat(S1, ';', S),
%     append(W, [S1], W2),
%     append(W2, [;], W3),
%     rozerwij2(Y, W3, Wyn).
rozerwij2([S|Y], W, Wyn) :-
    append(W, [S], W2),
    rozerwij2(Y, W2, Wyn). 


rozerwij3([], Wyn, Wyn) :- !.
rozerwij3([S|Y], W, Wyn) :-
   atom_string(T, S),
   append(W, [T], W2),
   rozerwij3(Y, W2, Wyn).


tokenizacja([], Wyn, Wyn) :- !.
tokenizacja([S|Y], W, Wyn) :-
    KEY = [read,write,if,then,else,fi,while,do,od,and,or,mod],
    member(S, KEY),
    S2 =.. [key,S],
    append(W, [S2], W2),
    tokenizacja(Y, W2, Wyn).
tokenizacja([S|Y], W, Wyn) :-
    SEP = [';','+','-','*','/' ,'(',')','<','>','=<','>=',':=','=','/='],
    member(S, SEP),
    S2 =.. [sep,S],
    append(W, [S2], W2),
    tokenizacja(Y, W2, Wyn).
tokenizacja([S|Y], W, Wyn) :-
    atom_number(S, S1),
    integer(S1),
    S1 >= 0,
    S2 =.. [int,S1],
    append(W, [S2], W2),
    tokenizacja(Y, W2, Wyn).
tokenizacja([S|Y], W, Wyn) :-
    atom_string(S, St),
    string_upper(St, Comp),
    St = Comp,
    S2 =.. [id,S],
    append(W, [S2], W2),
    tokenizacja(Y, W2, Wyn).
tokenizacja([S|Y], W, Wyn) :-
    append(W, [S], W2),
    tokenizacja(Y, W2, Wyn).