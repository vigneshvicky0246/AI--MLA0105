female(lakshmi).
female(siri).
female(githa).
female(sitha).
male(ravi).
male(gopi).
male(ram).

parent(lakshmi, siri).
parent(lakshmi, githa).
parent(lakshmi, sitha).
parent(ravi, siri).
parent(ravi, githa).
parent(ravi, sitha).
parent(siri, gopi).
parent(siri, ram).

mother(M, C) :-
    female(M), parent(M, C).

father(F, C) :-
    male(F), parent(F, C).

grandfather(G, C) :-
    male(G), parent(G, X), parent(X, C).

grandmother(G, C) :-
    female(G), parent(G, X), parent(X, C).

sister(S, P) :-
    female(S), parent(X, S), parent(X, P).

brother(B, P) :-
    male(B), parent(X, B), parent(X, P).
