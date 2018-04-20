
s(Num,L,[]) :- 
  Num is 0, !,
  append([],[],L) 
  ;
  mkList(Num,P),!,
  select(H, P, _),
  NewNum is Num - H,
  s(NewNum, NextList, []),
  sum_list(NextList,T),
  0 is Num - H - T,
  append([H],NextList,L).
  
mkList(0,[]).
mkList(Num,L) :- X is Num - 1, mkList(X,P), append([Num],P,L).
