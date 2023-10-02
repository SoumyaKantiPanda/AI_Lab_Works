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

% dfs(Start, Goal, Path)
% Finds a path from Start to Goal using DFS.
dfs(Start, Goal, Path) :-
    dfs_recursive(Start, Goal, [Start], Path).

% dfs_recursive(CurrentNode, Goal, VisitedNodes, Path)
% Recursive DFS implementation.
dfs_recursive(CurrentNode, Goal, VisitedNodes, [Goal | VisitedNodes]) :-
    edge(CurrentNode, Goal).
dfs_recursive(CurrentNode, Goal, VisitedNodes, Path) :-
    edge(CurrentNode, NextNode),
    not(member(NextNode, VisitedNodes)),
    dfs_recursive(NextNode, Goal, [NextNode | VisitedNodes], Path).

% reverse(Path, ReversedPath)
% Reverses a list.
reverse([], []).
reverse([H | T], Reversed) :-
    reverse(T, RevT),
    append(RevT, [H], Reversed).
