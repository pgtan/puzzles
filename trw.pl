%%% trw.pl --- Trapping Rain Water -*- mode: prolog -*-

maxl(X,Y,Z) :-
    Z is max(X,Y).

maxminelt(E,ML,MR,G) :-
    G is max(0, min(ML,MR) - E).
 
maxleftlist(Ls,MLs) :-
    scanl(maxl,Ls,0,[_|MLs]).

maxrightlist(Ls,MRs) :-
    reverse(Ls,RLs),
    scanl(maxl,RLs,0,[_|TRs]),
    reverse(TRs,MRs).

trw(Ls,S,Ss) :-
    maxleftlist(Ls,MLs),
    % writeln(MLs),
    maxrightlist(Ls,MRs),
    % writeln(MRs),
    maplist(maxminelt,Ls,MLs,MRs,Ss),
    sum_list(Ss,S).


