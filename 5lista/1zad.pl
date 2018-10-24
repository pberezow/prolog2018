isKey(X) :-
    KeyList = ["read","write","if","then","else","fi","while","do","od","and","or","mod"],
    member(X, KeyList).

isSep(X) :-
    SepList = [';','+','-','*','/','(',')',',','<','>','=<','>=',':=','=','/='],
    member(X, SepList).
    
isId(X) :-
    string_upper(X, U),
    U = X.

isInt(X) :-
    integer(X).

getChar(Out) :-
    getC("", Out).

getC(X, Out) :-
    get_char(C),
    makeStr(X, C, Out).

makeStr(X, ' ', Out) :- !,
    Out = X.

makeStr(X, '\n', Out) :- !,
    Out = X.

makeStr(X, end_of_file, Out) :- !,
    Out = X.

makeStr(X, C, Out) :-
    !,
    string_concat(X, C, Str),
    getC(Str, Out).


getToken(Str, Token) :-
    isSep(Str),
    Token = sep(Str).

getToken(Str, Token) :-
    isKey(Str),
    Token = key(Str).

getToken(Str, Token) :-
    isId(Str),
    Token = id(Str).

getToken(Str, Token) :-
    isInt(Str),
    Token = int(Str).

getToken(Str, Token) :-
    Token = ''.



scanner(Strumien, Tokeny) :-
    scanner(Strumien, [], Tokeny).

scanner(Strumien, Tokeny, OutTokeny) :-
    getChar(Str),
    getTokeny(Strumien, Str, Tokeny, OutTokeny).

getTokeny(Strumien, "", Tokeny, OutTokeny) :-
    !, 
    OutTokeny = Tokeny.

getTokeny(Strumien, Str, Tokeny, OutTokeny) :-
    getToken(Str, Token),
    append(Tokeny, Token, Tokeny2),
    scanner(Strumien, Tokeny2, OutTokeny).
    