% smu.pl --- Solution to a Knights and Knaves problem -*- mode: prolog -*-

/*
I saw a pair on the island of knights and knaves. I asked, ``Is either of you
a knight?'' One fellow replied and from his answer I knew what sort person he
was and also what sort the other person was. What did I find out?
*/

:- use_module(library(clpb)).	% Boolean constraints

% Knight = 1, Knave = 0

smu(A,B) :-
    sat(+(A =:= A + B,A =\= A + B)),
    sat(card([1],[A+B,A+(~B)])),
    sat(card([1,2],[A,B])).

% run swipl -q -s smu.pl -g 'smu(A,B),writeln(["A",A," B",B]),halt.'

/** <examples>
?- smu(A,B).
*/
