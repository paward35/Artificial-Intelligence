arc([N,CN],[M,CM],Seed) :- M is N*Seed, CM is CN + 1.
arc([N,CN],[M,CM],Seed) :- M is N*Seed + 1, CM is CN + 2.

goal([N | _] ,Target) :- 0 is N mod Target.

h([N,C],Hvalue,Target) :- goal([N,C],Target), !, Hvalue is 0
;
Hvalue is 1/N.


search([[Node, Cost]|_], _, Target, Node) :- goal([Node, Cost], Target).
search([Node|FRest], Seed, Target, Found) :- 
setof(X,arc(Node,X, Seed), FNode),
addToFrontier(FNode,FRest,FNew, Target),
search(FNew, Seed, Target, Found).

addToFrontier([], Frontier, Frontier, _).
addToFrontier(Node, [], Node, _).

addToFrontier([NFirst | NRest], [FFirst | FRest], FNew, Target) :- less_than(NFirst, FFirst, Target), !, 
addToFrontier([NFirst, FFirst | NRest], FRest, FNew, Target)
;
addToFrontier([FFirst, NFirst| NRest], FRest, FNew, Target).

less_than([Node1,Cost1],[Node2,Cost2],Target) :-
h([Node1,Cost1],Hvalue1,Target), h([Node2,Cost2],Hvalue2,Target),
F1 is Cost1+Hvalue1, F2 is Cost2+Hvalue2,
F1 =< F2.

a_star(Start,Seed,Target,Found) :- search([[Start, 0]], Seed, Target, Found).