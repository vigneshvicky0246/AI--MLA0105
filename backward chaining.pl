% Facts
fact(a).
fact(b).

% Rules
rule(r1, [a], c).
rule(r2, [b], d).
rule(r3, [c, d], e).

% Backward Chaining
backward_chain(X) :-
    goal(X),
    write(X), nl,
    prove(X).

prove(X) :-
    fact(X).

prove(X) :-
    rule(_, Premises, X),
    prove_premises(Premises).

prove_premises([]).

prove_premises([Premise | Rest]) :-
    backward_chain(Premise),
    prove_premises(Rest).

% Goal Query
goal_query(Goal) :-
    write('Query: '), write(Goal), nl,
    backward_chain(Goal).
