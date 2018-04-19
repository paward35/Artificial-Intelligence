s(H, L) :-  
  nth0(Num, H, 2),
  append(U, B, H),
  length(U, Num),
  length(H,Y),
  X is Y  - Num,
  length(B, X),
  select(2,B,V),
  sum_list(V,L),
  delete(U,1,FinalU),
  length(FinalU,L).