animals([snail, jaguar, zebra]).
nationalities([english, japanese, spanish]).
colours([red,blue,green]).

s([Col1,Nat1,Pet1, Col2,Nat2,Pet2, Col3,Nat3,Pet3]) :- animals(A), colours(C), nationalities(N),
  member(Pet1, A),
  member(Col1 , C),
  member(Nat1 , N),
  delete(A, Pet1, A2),
  delete(C, Col1, C2),
  delete(N, Nat1, N2),
  member(Pet2, A2),
  member(Col2 , C2),
  member(Nat2 , N2),
  delete(A2, Pet2, A3),
  delete(C2, Col2, C3),
  delete(N2, Nat2, N3),
  member(Pet3, A3),
  member(Col3 , C3),
  member(Nat3 , N3).