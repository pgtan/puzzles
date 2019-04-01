%%% calkinwilf.pl --- Compute a node in a Calkin-Wilf tree  -*- mode: prolog -*-

:- use_module(library(clpfd)).

%%%%%% stolen from stackexchange
binary_number(Bs0, N) :-
        reverse(Bs0, Bs),
        binary_number_(Bs, 0, 0, N),!.
binary_number_([], _, N, N).
binary_number_([B|Bs], I0, N0, N) :-
        B in 0..1,
        N1 #= N0 + (2^I0)*B,
        I1 #= I0 + 1,
        binary_number_(Bs, I1, N1, N).
%%%%%%

cw(N,D,P) :-
    var(P) -> cwf(N,D,P);
    binary_number(Ps,P),
    reverse(Ps,Prvs),
    cw_(N,D,Prvs),!.

cwf(N,D,P) :-
    cw_(N,D,Prvs),
    reverse(Ps,Prvs),
    binary_number(Ps,P),!.

cw_(1,1,[1]).
cw_(N,D,[1|Ps]) :-
    N #> 0,
    D #> 0,
    N + D #> 2,
    N1 #= N - D,
    cw_(N1,D,Ps).
cw_(N,D,[0|Ps]) :-
    N #> 0,
    D #> 0,
    N + D #> 2,
    D1 #= D - N,
    cw_(N,D1,Ps).

%%% calkinwilf.pl ends here
