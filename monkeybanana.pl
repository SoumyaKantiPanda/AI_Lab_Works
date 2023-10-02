:- discontiguous is_at/2.
:- discontiguous is_at/3.

is_at(monkey, door).
is_at(box, window).
is_at(banana, middle).
hungry(monkey).

grasp(monkey, banana):-
    hungry(monkey), climb(monkey, box),
    is_at(banana, middle), write("Monkey grabs banana"), nl.

climb(monkey, box):-
    is_at(monkey, box, middle),
    write("Monkey climbs the box."), nl.

is_at(monkey, box, middle):-
    push(monkey, box, middle),
    write("Monkey and box are both at the middle."), nl.

push(monkey, box, middle):-
    is_at(box, window), is_at(monkey, window),
    write("Monkey pushes the box to the middle of room."), nl.

is_at(monkey, window):-
    walk_to(monkey, window), write("Monkey is at the window."), nl.

walk_to(monkey, window):-
    is_at(monkey, L), L\=window, write("Monkey walks to the window."), nl.
