p('fit','exercise','fit', 0.99 ). 
p('fit','exercise','unfit', 0.01). 
p('unfit','exercise','fit', 0.2). 
p('unfit','exercise','unfit', 0.8).

p('fit','relax','fit', 0.7). 
p('fit','relax','unfit', 0.3). 
p('unfit','relax','fit',0). 
p('unfit','relax','unfit',1). 

r('fit','exercise','fit',8). 
r('fit','exercise','unfit',8). 
r('unfit','exercise','fit',0). 
r('unfit','exercise','unfit',0).

r('fit','relax','fit',10). 
r('fit','relax','unfit',10). 
r('unfit','relax','fit',5). 
r('unfit','relax','unfit',5). 

q0(State, 'exercise', Reward) :- 
  r(State,'exercise','fit', Reward).
  
  q0(State, 'relax', Reward) :- 
    r(State,'relax','fit', Reward).
    
vn(State, N, Y, Reward) :- 
  NewN is N - 1, 
  qn1(State,'exercise',NewN, Y, Reward1),
  qn1(State,'relax',NewN, Y, Reward2),
  Reward is  max(Reward1,Reward2).

  qn1(_, _, -1, _, _) :- false.

qn1(State, Action, 0, _, Reward) :- 
  q0(State,Action,Reward).
  
qn1(State, Action, N, Y, Reward) :- 
  q0(State,Action,RewardS0),
  vn('fit', N, Y, RF),
  vn('unfit', N, Y, RUF),
  p(State,Action,'fit',PF),
  p(State,Action,'unfit',PUF),
  Reward is RewardS0 + Y*( PF*RF + PUF*RUF ).

qn(State, _, N, Y, Reward) :- 
  qn1(State,'exercise',N, Y, Reward1),
  qn1(State,'relax',N, Y, Reward2),
  append([['exercise',Reward1]],[['relax',Reward2]],Reward).
  





