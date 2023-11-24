% Base case: Fibonacci of 0 is 0.
fibonacci(0, 0).

% Base case: Fibonacci of 1 is 1.
fibonacci(1, 1).

% Recursive case: Fibonacci of N is the sum of Fibonacci of N-1 and N-2.
fibonacci(N, Result) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, Result1),
    fibonacci(N2, Result2),
    Result is Result1 + Result2.
