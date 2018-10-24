:- use_module(library(sgml)).
:- use_module(library(xpath)).
:- use_module(library(url)).
:- use_module(library(http/http_open)).

serwery(NazwaPliku, ListaSerwerow) :-
    load_html(NazwaPliku, DOM, []),
    findall(Url, xpath(DOM, //a(@href), Url), Lista),
    % setof(X, Y^Z^(member(Y, Lista), is_absolute_url(Y), parse_url(Y, Z), member(host(X), Z)), ListaSerwerow).
    setof(X, Y^Z^W^(member(Y, Lista), global_url(Y, localhost, Z), parse_url(Z, W), member(host(X), W)), ListaSerwerow).
