:- dynamic fact/1.

fact(a).
fact(b).

rule(r1, [a], c).
rule(r2, [b], d).
rule(r3, [c,d], e).

forward_chain(X) :-
    fact(X).

forward_chain(X) :-
    rule(_, Premises, X),
    check_premises(Premises),
    asserta(fact(X)).

check_premises([]).

check_premises([Premise|Rest]) :-
    fact(Premise),
    check_premises(Rest).

ask(X) :-
    forward_chain(X),
    write(X), nl.

ask_not(X) :-
    \+forward_chain(X),
    write(X), nl.
