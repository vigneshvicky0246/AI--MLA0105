% Facts
is_child(X) :- boy(X).
is_child(X) :- girl(X).

gets(X, Y) :- child(X), (doll(Y) ; train(Y) ; lump_of_coal(Y)).

no_doll(X) :- boy(X).

no_lump_of_coal(X) :- child(X), good(X).

boy(jack).
girl(loise).
