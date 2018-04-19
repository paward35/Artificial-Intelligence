numeral(0).
numeral(s(X)) :- numeral(X).
numeral(X+Y) :- numeral(X), numeral(Y).
numeral(-X) :- numeral(X).
numeral(X-Y) :- numeral(X), numeral(Y).

add(0,X,X).
add(s(X),Y,s(Z)) :- add(X,Y,Z).

minus(0, 0).
minus(s(p(X)), Z) :- minus(X,Z).
minus(p(s(X)), Z) :- minus(X,Z).
minus(s(X), p(Z)) :- minus(X,Z).
minus(p(X), s(Z)) :- minus(X,Z).

%add2(X,-0,Z) :- add2(X,0, Z).
%add2(-0,Y,Z) :- add2(0,Y, Z).
eval(0,0).
eval(s(X),p(K)) :- eval(X,K). 
eval(p(X),s(K)) :- eval(X,K). 

subtracts(-X,Y,Z) :- add2(X,Y,Z).
subtracts(X,-Y,Z) :- add2(X,Y,Z).
subtracts(X,Y,Z) :- eval(Y,K), add2(X,K,Z).




add2(X,-p(0),Z) :- add2(X,s(0), Z).
add2(-p(0),Y,Z) :- add2(s(0),Y, Z).
add2(X,-s(0),Z) :- add2(X,p(0), Z).
add2(-s(0),Y,Z) :- add2(p(0),Y, Z).

add2(X,-p(Y),Z) :- add2(X,s(-Y), Z).
add2(-p(X),Y,Z) :- add2(s(-X),Y, Z).
add2(X,-s(Y),Z) :- add2(X,p(-Y), Z).
add2(-s(X),Y,Z) :- add2(p(-X),Y, Z).

add2(-X, Y, Z) :- eval(X,K). 


add2(0,p(s(X)),Z) :- add2(X,0, Z).
add2(0,p(X),p(Z)) :- add2(0,X, Z).

add2(s(X), p(Y), Z) :- add2(X,Y,Z).
add2(p(X), s(Y), Z) :- add2(X,Y,Z).

add2(p(s(X)),Y,Z) :- add2(X,Y, Z).
add2(X,p(s(Y)),Z) :- add2(X,Y, Z).
add2(s(p(X)),Y,Z) :- add2(X,Y, Z).
add2(X,s(p(Y)),Z) :- add2(X,Y, Z).

add2(0,0,0).
add2(0, s(X), s(Z)) :- add2(X,0,Z).
add2(X,Y+K,Z) :- add2(Y,K,L), add2(L,X,Z).
add2(Y+K,X,Z) :- add2(Y,K,L), add2(L,X,Z).
add2(s(Y), X, s(Z)) :- add2(Y,X,Z).
add2(Y, s(X), s(Z)) :- add2(Y,X,Z).


add2(X,p(Y),p(Z)) :- add2(X,Y, Z).
add2(p(X), Y,p(Z)) :- add2(X,Y, Z).