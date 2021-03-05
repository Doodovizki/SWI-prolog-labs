max(X,Y,X):- X>Y,!.
max(_,Y,Y).
max(X,Y,U,X):- X>Y, U>Y, !.
max(_,Y,U,Y):- Y>U,!.
max(_,_,U,U).
max(X,Y,U,Z):- max(X,Y,C), max(U,C,Z).

fact(0,1).
fact(N,X):-N1 is N-1, fact(N1,X1), X is X1*N.
fact1(N,X):-fact1(0,1,N,X).
fact1(N,X,N,X):-!.
fact1(I,F,N,X):-I1 is I+1, F1 is F*I1, fact(I1,F1,N,X).

fib_up(1,1):-!.
fib_up(2,1):-!.
fib_up(N,X):-N1 is N-1,N2 is N-2,fib_up(N2,X2),fib_up(N1,X1),X is X1+X2.

fib_down(N,X):-fib_down(N,1,1,X).
fib_down(1,F2,_,F2):-!.
fib_down(N,F1,F2,X):-N1 is N-1,NF2 is F1 + F2,fib_down(N1,F2,NF2,X).

sumd(N,X):- N1 is N div 10, sumd(N1,X1), X is X1+N mod 10.
sumd(X,X).
sum(N,S):-sum(N,0,S).
sum(0,S,S):-!.
sum(A,Sum,S):- Am is A mod 10, Ad is A div 10,Sum1 is Sum + Am, sum(Ad,Sum1,S).

min_dig_up(0,N,N):-!.
min_dig_up(X,N):-min_dig_up(X,9,N).
min_dig_up(X,N1,N):-X1 is X div 10, min_dig_up(X1,N2),N2 is X mod 10, (N2<N1-> N is N2; N is N).

mult_dig_up(0,_):-!.
mult_dig_up(X,N):-X1 is X div 10, mult_dig_up(X1,N1),N1 is X mod 10, N1 mod 5 \=0, N is N*N1.

nod(A, B, Denominator):-
  nod(A, B, A, Denominator).

nod(A, B, Iterator, Iterator):-0 is A mod Iterator, 0 is B mod Iterator, !.
nod(A, B, Iterator, Denominator):-NextIterator is Iterator - 1,nod(A, B, NextIterator, Denominator).
