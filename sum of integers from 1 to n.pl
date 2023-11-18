sum_integers(1,1).
sum_integers(N,Sum) :-
    N > 1,
    N1 is N - 1,
    sum_integers(N1,Sum1),
    Sum is N + Sum1.
