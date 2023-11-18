:- dynamic(on_tree/1).
:- dynamic(have_banana/0).
:- dynamic(climbed/0).

init :-
    asserta(on_tree(at_base)),
    retractall(have_banana),
    retractall(climbed).

climb :-
    on_tree(at_base),
    write('Climbing up the tree'),
    retract(on_tree(at_base)),
    asserta(on_tree(at_top)),
    asserta(climbed).

climb :-
    on_tree(at_top),
    write('Already at the top'),
    false.

pick_banana :-
    on_tree(at_top),
    \+ have_banana,
    write('Picking the banana'),
    asserta(have_banana).

pick_banana :-
    \+ on_tree(at_top),
    write('Need to climb the tree first'),
    false.

pick_banana :-
    have_banana,
    write('Already have the banana'),
    false.

eat_banana :-
    have_banana,
    retractall(have_banana),
    write('Eating the banana').

eat_banana :-
    \+ have_banana,
    write('No banana to eat'),
    false.
