filozof(Left, Right, Name) :-
    format('~w mysli~n', [Name]),
    format('~w stara sie podniesc prawy widelec~n', [Name]),
    mutex_lock(Right),
    format('~w stara sie podniesc lewy widelec~n', [Name]),
    mutex_lock(Left),
    format('~w je~n', [Name]),
    format('~w odklada prawy widelec~n', [Name]),
    mutex_unlock(Right),
    format('~w odklada lewy widelec~n', [Name]),
    mutex_unlock(Left),
    filozof(Left, Right, Name).

filozofowie :-
    mutex_create(Fork1),
    mutex_create(Fork2),
    mutex_create(Fork3),
    mutex_create(Fork4),
    mutex_create(Fork5),
    thread_create(filozof(Fork1, Fork2, '[1]'), TID1),
    thread_create(filozof(Fork2, Fork3, ' [2]'), TID2),
    thread_create(filozof(Fork3, Fork4, '  [3]'), TID3),
    thread_create(filozof(Fork4, Fork5, '   [4]'), TID4),
    thread_create(filozof(Fork5, Fork1, '    [5]'), TID5).
