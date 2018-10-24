merge(IN1, IN2, OUT) :-
    freeze(IN1, (freeze(IN2, (
    IN1 = [A | IN11] ->
    (
        IN2 = [B | IN22] ->
        (
            A =< B ->
            (
                OUT = [A | OUT1],
                merge(IN11, IN2, OUT1)
            ); (
                OUT = [B | OUT1],
                merge(IN1, IN22, OUT1)
            )
        ); (
            OUT = IN1
        )
    ); (
        OUT = IN2
    ))))).

% split(IN, OUT1, OUT2) :-
%     freeze(IN, (
%         IN = [A | IN11] ->
%         (
%             IN11 = [B | IN12] ->
%             (
%                 OUT1 = [A | OUT11],
%                 OUT2 = [B | OUT22],
%                 split(IN12, OUT11, OUT22)
%             ); (
%                 OUT1 = [],
%                 OUT2 = [A]
%             )
%         ); (
%             OUT1 = [],
%             OUT2 = []
%         )
%     )).

split(IN, OUT1, OUT2) :-
    freeze(IN, (
        IN = [A | IN1] -> 
        (
            OUT1 = [A | OUT11],
            split(IN1, OUT2, OUT11)
        ); (
            OUT1 = [],
            OUT2 = []
        )
    )).

merge_sort(IN, OUT) :-
    freeze(IN, (
        IN = [_|X] ->
        (
            freeze(X, (
                X = [_|_] ->
                (
                    split(IN, IN1, IN2),
                    merge_sort(IN1, IN11),
                    merge_sort(IN2, IN22),
                    merge(IN11, IN22, OUT)
                ); (
                    OUT = IN
                )
            ))
        ); (
            OUT = IN
        )
    )).