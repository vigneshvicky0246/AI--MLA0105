% Facts
location(city1, state1).
location(city2, state2).
location(city3, state3).

stays(john, city1).
stays(mary, city2).
stays(bob, city3).
stays(lisa, city1).

% Rules for display
display_persons_states_cities :-
    write('List of persons, states, and cities:'), nl,
    stays(Person, City),
    location(City, State),
    write(Person), write(' stays in '), write(City), write(', '), write(State), nl,
    fail. % to force backtracking and find all solutions

display_person_state(Person) :-
    stays(Person, City),
    location(City, State),
    write(Person), write(' stays in '), write(State), nl.
