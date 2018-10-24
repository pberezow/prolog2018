
scanner(Stream,W4):-read_line_to_codes(Stream,Codes),
                   read_file(Stream,Y,Codes),
		   rozerwij(Y,[],W),
		   rozerwijj(W,[],W2),
		   rozerwijjj(W2,[],W3),
                   tokenizacja(W3,[],W4).

read_file(_,_,C):-
    C = 'end_of_file',!.
read_file(Stream,[X|L],C) :-
    atom_chars(X,C),
    read_line_to_codes(Stream,Codes),
    read_file(Stream,L,Codes).


rozerwij([],Wyn,Wyn):-!.
rozerwij([S|Y],W,Wyn):-
    split_string(S,' ','',L),
    append(W,L,W2),
    rozerwij(Y,W2,Wyn).

rozerwijj([],Wyn,Wyn):-!.
rozerwijj([S|Y],W,Wyn):-
  % SEP = [';','+','-','*','/' ,'(',')','<','>','=<','>=',':=','=','/='],
  % member(Sep, SEP),
    string_concat(S1,Sep,S)
    % rozerwijj(S1, [], W1),
    % append(W,W1,W2),
    % append(W2,[Sep],W3),
    % rozerwijj(Y,W3,Wyn).
      -> (
        append(W,[S1],W2),
        append(W2,[Sep],W3),
        rozerwijj(Y,W3,Wyn)
      ); (
        append(W,[S],W2),
        rozerwijj(Y,W2,Wyn)
      ).
rozerwijj([S|Y],W,Wyn) :-
  append(W,[S],W2),
  rozerwijj(Y,W2,Wyn).


rozerwijjj([],Wyn,Wyn):-!.
rozerwijjj([S|Y],W,Wyn):-
   atom_string(T,S),
   append(W,[T],W2),
   rozerwijjj(Y,W2,Wyn).


tokenizacja([],Wyn,Wyn):-!.
tokenizacja([S|Y],W,Wyn):-
    KEY = [read,write,if,then,else,fi,while,do,od,and,or,mod],
    SEP = [';','+','-','*','/' ,'(',')','<','>','=<','>=',':=','=','/='],
 (

        member(S,KEY) ->
      (
        S2 =.. [key,S],
        append(W,[S2],W2),
        tokenizacja(Y,W2,Wyn)
      );(
          member(S,SEP)->
        (
          S2 =.. [sep,S],
          append(W,[S2],W2),
          tokenizacja(Y,W2,Wyn)
        );
          (
	    atom_number(S,S1),
	    integer(S1),
	    S1 >= 0 ->
          (
            S2 =.. [int,S1],
            append(W,[S2],W2),
            tokenizacja(Y,W2,Wyn)
	  );(
	      (
		atom_string(S,St),
                string_upper(St,Comp),
                St=Comp
	      ) ->
              (
                S2 =.. [id,S],
                append(W,[S2],W2),
                tokenizacja(Y,W2,Wyn)
	      ); (
		append(W,[S],W2),
                tokenizacja(Y,W2,Wyn)
	      )
	    )
	 )
       )
  ).






















