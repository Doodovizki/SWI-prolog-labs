read_list(0,[]):-!.
read_list(N,[Head|Tail]):-read(Head),N1 is N-1, read_list(N1,Tail).

write_list([]):-!.
write_list([Head|Tail]):-write(Head),nl,write_list(Tail).

sum_list_down(List,Sum):-sum_list_down(List,0,Sum).
sum_list_down([],Sum,Sum):-!.
sum_list_down([H|T],S,Sum):- S1 is S+H,sum_list_down(T,S1,Sum).

pr4_2:-write("kolvo:"),nl,read(N),read_list(N,List),sum_list_down(List,Sum),write(Sum).

sum_list_up([],0).
sum_list_up([H|T],Sum):- sum_list_up(T,S1),Sum is H+S1.

list_el_numb([H|_],H,Number,Number):-!.
list_el_numb([_|Tail],Elem,I,Number):- I1 is I+1, list_el_numb(Tail,Elem,I1,Number).
list_el_numb(List,Elem,Number):- list_el_numb(List,Elem,0,Number).

pr4_4:-write("kolvo"),read(N),write("list"),read_list(N,List),write("elem"),read(Elem),list_el_numb(List,Elem,Number),write("Number="),write(Number).
pr4_4:-write("nope").

in_list([El|_],El).
in_list([_|Tail],El):-in_list(Tail,El).

extract:-write("lengh of list"),read(N),write("list:"),read_list(N,[H|T]),write("number of element"),read(X),extract([H|T],X,0).
extract([H|T],Num,C):-
turn([],B,B):-!.
turn([H|T],A,B):-turn(T,[H|A],B).
