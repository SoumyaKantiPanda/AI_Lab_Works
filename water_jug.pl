% state(Jug4, Jug3)
% initial state: both jugs are empty
initial_state(state(0, 0)).

% final state: 4-gallon jug has 2 gallons of water
final_state(state(2, _)).

% fill the 4-gallon jug from the faucet
move(state(_, J3), fill4, state(4, J3)) :-
    write('Fill the 4-gallon jug from the faucet'), nl.

% fill the 3-gallon jug from the faucet
move(state(J4, _), fill3, state(J4, 3)) :-
    write('Fill the 3-gallon jug from the faucet'), nl.

% empty the 4-gallon jug on the ground
move(state(_, J3), empty4, state(0, J3)) :-
    write('Empty the 4-gallon jug on the ground'), nl.

% empty the 3-gallon jug on the ground
move(state(J4, _), empty3, state(J4, 0)) :-
    write('Empty the 3-gallon jug on the ground'), nl.

% pour water from the 4-gallon jug to fill the 3-gallon jug
move(state(J4, J3), pour43, state(0, T)) :-
    T is J4 + J3,
    T =< 3,
    write('Pour water from the 4-gallon jug to fill the 3-gallon jug'), nl.
move(state(J4, J3), pour43, state(K, 3)) :-
    T is J4 + J3,
    T > 3,
    K is T - 3,
    write('Pour water from the 4-gallon jug to fill the 3-gallon jug'), nl.

% pour water from the 3-gallon jug to fill the 4-gallon jug
move(state(J4, J3), pour34, state(T, 0)) :-
    T is J4 + J3,
    T =< 4,
    write('Pour water from the 3-gallon jug to fill the 4-gallon jug'), nl.
move(state(J4, J3), pour34, state(4, K)) :-
    T is J4 + J3,
    T > 4,
    K is T - 4,
    write('Pour water from the 3-gallon jug to fill the 4-gallon jug'), nl.

% recursive call to solve the problem
solve_dfs(State, _, []) :-
    final_state(State),
    write('Final state: '), write(State), nl.
solve_dfs(State1, History, [Move|Moves]) :-
    move(State1, Move, State2),
    \+ member(State2, History),
    write('State: '), write(State2), nl,
    solve_dfs(State2, [State2|History], Moves).

% find the solution
solution(Moves) :-
    initial_state(State),
    solve_dfs(State, [State], Moves).
