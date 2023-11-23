% Predicate to convert Celsius to Fahrenheit
celsius_to_fahrenheit(Celsius, Fahrenheit) :-
    Fahrenheit is (Celsius * 9/5) + 32.

% Predicate to check if a temperature is below freezing
below_freezing(Temperature) :-
    Temperature < 0.
