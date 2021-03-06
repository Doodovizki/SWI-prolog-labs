sub_posl([],_):-!.
sub_posl(_,[]):-fail,!.
sub_posl([H|Sub_list],[H|List]):-sub_posl(Sub_list,List),!.
sub_posl(Sub_list,[_|List]):-sub_posl(Sub_list,List).

sub_set([],[]).
sub_set([H|Sub_set],[H|Set]):-sub_set(Sub_set,Set).
sub_set(Sub_set,[H|Set]):-sub_set(Sub_set,Set).

in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sprava_next(A,B,[C]):-fail.
sprava_next(A,B,[A|[B|Tail]]).
sprava_next(A,B,[_|List]):-sprava_next(A,B,List).

sleva_next(A,B,[C]):-fail.
sleva_next(A,B,[B|[A|Tail]]).
sleva_next(A,B,[_|List]):-sleva_next(A,B,List).

next_to(A,B,List):-sprava_next(A,B,List).
next_to(A,B,List):-sleva_next(A,B,List).

el_no(List,Num,El):-el_no(List,Num,1,El).
el_no([H|_],Num,Num,H):-!.
el_no([_|Tail],Num,Ind,El):-Ind1 is Ind+1,el_no(Tail,Num,Ind1,El).

pr_ein:- Houses=[_,_,_,_,_],

		in_list(Houses,[red,english,_,_,_]),
		in_list(Houses,[_,spanish,_,dog,_]),
		in_list(Houses,[green,_,coffee,_,_]),
		in_list(Houses,[_,ukrain,tea,_,_]),
		sprava_next([green,_,_,_,_],[white,_,_,_,_],Houses),
		in_list(Houses,[_,_,_,ulitka,old_gold]),
		in_list(Houses,[yellow,_,_,_,kool]),
		el_no(Houses,3,[_,_,milk,_,_]),
		el_no(Houses,1,[_,norway,_,_,_]),
		next_to([_,_,_,_,chester],[_,_,_,fox,_],Houses),
		next_to([_,_,_,_,kool],[_,_,_,horse,_],Houses),
		in_list(Houses,[_,_,orange,_,lucky]),
		in_list(Houses,[_,japan,_,_,parlament]),
		next_to([_,norway,_,_,_],[blue,_,_,_,_],Houses),


		in_list(Houses,[_,WHO1,water,_,_]),
		in_list(Houses,[_,WHO2,_,zebra,_]),
		write(Houses),
		write(WHO1),nl,write(WHO2).

pr_corona:- Corona=[_,_,_,_],
            Coronas=[],
           in_list(Corona,[_,italy,_,pohoroni]),
            in_list(Corona,[_,france,_,svadba]),
            in_list(Corona,[_,america,1,_]),
            in_list(Corona,[progger,_,_,conf]),
            in_list(Corona,[chinusha,_,45,_]),
            in_list(Corona,[_,kitai,_,otdih]),
            in_list(Corona,[_,france,15,_]),
            in_list(Corona,[bankir,_,6,_]),

            (   in_list(Corona,[blogger,italy,_,_]);
                in_list(Corona,[blogger,france,_,_]);
                 in_list(Corona,[blogger,america,_,_])),

            (   in_list(Corona,[chinusha,italy,_,_]);
                in_list(Corona,[chinusha,france,_,_]);
                 in_list(Corona,[chinusha,america,_,_])),

            write(Corona).


write_place_people(A,B):-write(A),write(": "),
    in_list(B,[A,WORK1,PLACE1,NUMB1]),write(WORK1),write(", "),
    write(PLACE1),write(", "),write(NUMB1),nl,!.

% Ïîñòàâèë îòñå÷åíèå, ïîòîìó ÷òî ñïèñêè â ñïèñêå ïðîñòî ïåðåìåùàþòñÿ íà
% ðàçíûå ïîçèöèè, íî ýëåìåíòû â ýòèõ ñïèñêàõ îäíè è òå æå;
pr_log:-Seek=[_,_,_,_],
    in_list(Seek,[_,funeral,lake_Koma,_]),
    in_list(Seek,[_,marry,nicca,_]),
    in_list(Seek,[_,_,california,1]),
    in_list(Seek,[programmer,conference,_,_]),
    in_list(Seek,[_,rest,china,_]),
    (in_list(Seek,[programmer,_,china,_]);in_list(Seek,[banker,_,china,_])),
    in_list(Seek,[official,_,_,45]),
    in_list(Seek,[_,_,nicca,15]),
    in_list(Seek,[banker,_,_,6]),
    in_list(Seek,[bloger,_,_,_]),

    write(Seek),nl,nl,
    write_place_people(programmer,Seek),
    write_place_people(banker,Seek),
    write_place_people(bloger,Seek),
    write_place_people(official,Seek).


pr_ein1:-Event=[_,_,_,_],
    in_list(Event,[funeral,italy,_,_]),
    in_list(Event,[wedding,france,_,_]),
    in_list(Event,[_,france,_,15]),
    in_list(Event,[rest,china,_,_]),
    in_list(Event,[conference,_,programmer,_]),
    in_list(Event,[_,usa,_,1]),
    in_list(Event,[_,_,official,45]),
    in_list(Event,[_,_,banker,6]),
    in_list(Event,[_,_,blogger,_]),
    not(in_list(Event,[_,china,blogger,_])),
    not(in_list(Event,[_,china,official,_])),

    in_list(Event,[funeral,F1,F2,F3]),
    in_list(Event,[wedding,S1,S2,S3]),
    in_list(Event,[rest,T1,T2,T3]),
    in_list(Event,[conference,Frth1,Frth2,Frth3]),

    write("funeral "),write(F1),write(" "),write(F2),write(" "),write(F3),nl,
    write("wedding "),write(S1),write(" "),write(S2),write(" "),write(S3),nl,
    write("rest "),write(T1),write(" "),write(T2),write(" "),write(T3),nl,
    write("conference "),write(Frth1),write(" "),write(Frth2),write(" "),write(Frth3).

pr_task2:-Friend=[_,_,_],
    in_list(Friend,[belokur,B]),
    in_list(Friend,[chernov,C]),
    in_list(Friend,[rizhov,R]),
    in_list(Friend,[_,blond]),
    in_list(Friend,[_,brunet]),
    in_list(Friend,[_,rizhiy]),
    not(in_list(Friend,[belokur,blond])),
    not(in_list(Friend,[chernov,brunet])),
    not(in_list(Friend,[rizhov,rizhiy])),
    not(in_list(Friend,[belokur,brunet])),

    %in_list(Friend,[belokur,B]),
    %in_list(Friend,[chernov,C]),
    %in_list(Friend,[rizhov,R]),

    write(Friend),
    write("Belokurov"),write(B),nl,
    write("Chernov"),write(C),nl,
    write("Rizhov"),write(R).

pr_task3:- Friend=[_,_,_],
    in_list(Friend,[anya,_,_]),
    in_list(Friend,[natasha,_,green]),
    in_list(Friend,[valya,_,_]),
    in_list(Friend,[_,white,_]),
    in_list(Friend,[_,green,_]),
    in_list(Friend,[_,blue,_]),
    in_list(Friend,[_,_,white]),
    in_list(Friend,[_,_,green]),
    in_list(Friend,[_,_,blue]),
    not(in_list(Friend,[valya,white,_])),
    not(in_list(Friend,[valya,_,white])),
    in_list(Friend,[anya,X,X]),
    in_list(Friend,[anya,D1,S1]),
    in_list(Friend,[valya,D2,S2]),
    in_list(Friend,[natasha,D3,S3]),

    write("Anna dress"),write(D1),write(" shoes"),write(S1),nl,
    write("Valya dress"),write(D2),write(" shoes"),write(S2),nl,
    write("Natasha dress"),write(D3),write(" shoes"),write(S3),!.


pr_task4:- Worker=[_,_,_],
    in_list(Worker,[_,slesar,0,young]),
    in_list(Worker,[_,tokar,_,_]),
    in_list(Worker,[_,svar,_,_]),
    in_list(Worker,[borisov,_,1,_]),
    in_list(Worker,[ivanov,_,_,_]),
    in_list(Worker,[semenov,_,_,_]),
    in_list(Worker,[_,_,_,young]),
    in_list(Worker,[_,_,_,middle]),
    in_list(Worker,[_,_,_,old]),
    in_list(Worker,[borisov,_,1,_]),
    in_list(Worker,[_,_,0,_]),
    in_list(Worker,[_,_,1,_]),
    not(in_list(Worker,[semenov,_,_,young])),
    not(in_list(Worker,[_,tokar,_,old])),
    not(in_list(Worker,[semenov,tokar,_,_])),

    in_list(Worker,[X,slesar,_,_]),
    in_list(Worker,[Y,tokar,_,_]),
    in_list(Worker,[Z,svar,_,_]),

    write("Slesar -"),write(X),nl,
    write("Tokar -"),write(Y),nl,
    write("Svarshik -"),write(Z),nl.

pr_task6:- Talants=[_,_,_,_],
    in_list(Talants,[voronov,_]),
    in_list(Talants,[pavlov,_]),
    in_list(Talants,[levizkiy,_]),
    in_list(Talants,[saharov,_]),
    in_list(Talants,[_,dancer]),
    in_list(Talants,[_,artist]),
    in_list(Talants,[_,singer]),
    in_list(Talants,[_,writer]),
    not(in_list(Talants,[voronov,singer])),
    not(in_list(Talants,[levizkiy,singer])),
    not(in_list(Talants,[pavlov,artist])),
    not(in_list(Talants,[pavlov,writer])),
    not(in_list(Talants,[voronov,writer])),
    not(in_list(Talants,[saharov,writer])),
    in_list(Talants,[levizkiy,writer]) -> not(in_list(Talants,[voronov,artist])),
    write(Talants).


pr_task7:-Spmen=[_,_,_],
    in_list(Spmen,[1,_,_,kricket]),
    in_list(Spmen,[2,_,_,_]),
    in_list(Spmen,[3,_,_,_]),

    in_list(Spmen,[_,simon,jew,_]),
    in_list(Spmen,[_,mikile,_,basket]),
    in_list(Spmen,[_,richard,_,_]),

    in_list(Spmen,[_,_,austral,_]),
    in_list(Spmen,[_,_,american,_]),
    in_list(Spmen,[_,_,_,tennis]),

    not(in_list(Spmen,[3,mikile,american,_])),
    not(in_list(Spmen,[3,simon,_,tennis])),
    not(in_list(Spmen,[1,_,_,tennis])),
    not(in_list(Spmen,[1,_,american,_])),

    in_list(Spmen,[_,WHO1,austral,_]),
    in_list(Spmen,[_,richard,_,WHO2]),
    write(Spmen),nl,
    write(WHO1),nl,write(WHO2),!.

pr_task5:-Glass=[_,_,_,_],
    in_list(Glass,[bottle,_]),
    in_list(Glass,[stakan,_]),
    in_list(Glass,[kuvs,_]),
    in_list(Glass,[banka,_]),
    in_list(Glass,[_,limonade]),
    in_list(Glass,[_,milk]),
    in_list(Glass,[_,water]),
    in_list(Glass,[_,kvas]),
    not(in_list(Glass,[banka,limonade])),
    not(in_list(Glass,[banka,water])),
    not(in_list(Glass,[bottle,milk])),
    not(in_list(Glass,[bottle,water])),
    next_to([_,limonade],[kuvs,_],Glass),
    next_to([_,limonade],[_,kvas],Glass),
    next_to([stakan,_],[banka,_],Glass),
    next_to([stakan,_],[_,milk],Glass),

    in_list(Glass,[bottle,X1]),
    in_list(Glass,[stakan,X2]),
    in_list(Glass,[kuvs,X3]),
    in_list(Glass,[banka,X4]),

    write("Bottle "),write(X1),nl,
    write("Stakan "),write(X2),nl,
    write("Kuvshin "),write(X3),nl,
    write("Banka "),write(X4),nl,!.


pr_task8:- Person=[_,_,_],
    in_list(Person,[alador,_,_]),
    in_list(Person,[beloy,_,_]),
    in_list(Person,[balash,_,_]),
    in_list(Person,[_,budapesht,_]),
    in_list(Person,[_,bekeshchab,_]),
    in_list(Person,[_,asoda,_]),
    in_list(Person,[_,_,pharmacist]),
    in_list(Person,[_,_,agronom]),
    in_list(Person,[_,_,accountant]),
    not(in_list(Person,[balash,_,pharmacist])),
    not(in_list(Person,[balash,budapesht,_])),
    (   (
        (not(in_list(Person,[alador,budapesht,_]))),
        (not(in_list(Person,[alador,bekeshchab,_]))),
        (not(in_list(Person,[beloy,budapesht,accounter]))),
        (not(in_list(Person,[alador,_,accounter]))),
        (not(in_list(Person,[beloy,bekeshchab,accounter])))
    );
    (
        (not(in_list(Person,[alador,budapesht,_]))),
        (not(in_list(Person,[alador,bekeshchab,_]))),
        (not(in_list(Person,[balash,budapesht,accounter]))),
        (not(in_list(Person,[alador,_,accounter]))),
        (not(in_list(Person,[balash,bekeshchab,accounter])))
    )   ),

    write(Person),!.
