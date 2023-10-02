% Define the edges in the graph
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(d, h).
edge(e, i).
edge(e, j).
edge(f, k).

% breadth_first_search(Start, Goal, Paths)
% Finds all unique paths from Start to Goal using BFS.
breadth_first_search(Start, Goal, UniquePaths) :-
    bfs([[Start]], Goal, [], Paths),
    remove_duplicates(Paths, UniquePaths).

% bfs(QueueList, Goal, CurrentPath, AllPaths)
% Implements BFS using a queue to collect all paths.
bfs([], _, AllPaths, AllPaths).
bfs([[Goal | Path] | RestPaths], Goal, CurrentPath, AllPaths) :-
    reverse([Goal | Path], FullPath),
    bfs(RestPaths, Goal, [FullPath | CurrentPath], AllPaths).
bfs([Path | Paths], Goal, CurrentPath, AllPaths) :-
    extend(Path, NewPaths),
    append(Paths, NewPaths, UpdatedQueue),
    bfs(UpdatedQueue, Goal, CurrentPath, AllPaths).

% extend(Path, NewPaths)
% Extends a path with its unvisited neighbors.
extend([Node | Path], NewPaths) :-
    findall([NewNode, Node | Path], (edge(Node, NewNode), not(member(NewNode, [Node | Path]))), NewPaths).
extend(_, []).

% append(List1, List2, Result)
% Appends two lists.
append([], L, L).
append([H | T], L, [H | Result]) :-
    append(T, L, Result).

% remove_duplicates(ListWithDuplicates, ListWithoutDuplicates)
% Removes duplicate elements from a list.
remove_duplicates([], []).
remove_duplicates([H | T], UniqueList) :-
    member(H, T),
    !,
    remove_duplicates(T, UniqueList).
remove_duplicates([H | T], [H | UniqueList]) :-
    remove_duplicates(T, UniqueList).
