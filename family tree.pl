man(mikhail).
man(petr).
man(igor).
man(maksim).
man(nikolai).
man(ruslan).
man(sergei).
man(vladimir).
man(gleb).

woman(anna).
woman(maria).
woman(fatima).
woman(galina).
woman(viktoria).
woman(valeria).
woman(tatyana).

parent(mikhail,petr).
parent(mikhail,galina).
parent(mikhail,vladimir).

parent(anna,petr).
parent(anna,galina).
parent(anna,vladimir).

parent(petr,maksim).
parent(petr,igor).
parent(petr,nikolai).

parent(maria,maksim).
parent(maria,igor).
parent(maria,nikolai).

parent(nikolai,ruslan).
parent(fatima,ruslan).

parent(vladimir,valeria).
parent(viktoria,valeria).

parent(gleb,tatyana).
parent(valeria,tatyana).

men():-man(X),write(X),nl,fail.
children(X):-parent(X,Y),write(Y),nl,fail.

mother(X,Y):-parent(X,Y),woman(X).

mother(X):-mother(Y,X),write(Y).

daughter(X,Y):-woman(X),parent(Y,X).

daughters(X):- daughter(Y,X),write(Y).

brother(X,Y):-parent(A,X),man(X),parent(A,Y),woman(A),X\=Y.

brothers(X):-brother(Y,X),write(Y),nl,fail.

wife(X,Y):-parent(Y,Z),mother(X,Z).

b_s(X,Y):-mother(A,X),mother(A,Y),woman(Y),X\=Y.
b_s(X,Y):-mother(A,X),mother(A,Y),woman(X),X\=Y.

b_s(X):-b_s(Y,X),write(Y),nl,fail.

grand_pa(X,Y):-parent(A,Y),parent(X,A),man(X).

grand_pas(X):-grand_pa(Y,X),write(Y),nl,fail.

grand_da(X,Y):-woman(X),parent(Z,X),parent(Y,Z).

grand_dats(X):-grand_da(Y,X),write(Y),nl,fail.

grand_pa_and_son(X,Y):-parent(A,Y),parent(X,A),man(X),man(Y).
grand_pa_and_son(X,Y):-parent(Z,X),parent(Y,Z),man(X),man(Y).

grand_ma_and_da(X,Y):-parent(A,Y),parent(X,A),woman(X),woman(Y).
grand_ma_and_da(X,Y):-parent(Z,X),parent(Y,Z),woman(X),woman(Y).

uncle(X,Y):-parent(Z,Y),b_s(Z,X),man(X).
uncles(X):-uncle(Y,X),write(Y),nl,fail.

nephey(X,Y):-parent(Z,Y),b_s(X,Z),man(Y).
nepheys(X):-nephey(Y,X),write(Y),nl,fail.

