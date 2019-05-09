# Notes



type([inventa, kia, toyota]).
city([pecs, budapest, gyor, szeged]).
sales(pecs, kia, 20180502, sally, 500000).
sales(budapest, toyota, 20180502, sally, 500000).
sales(pecs, toyota, 20180502, sally, 500000).
sales(gyor, inventa, 20180502, sally, 100000).


:-dynamic sales/5.

displayMenu :- writeln("**********************************\n--------- FIREBIRD -----------\n**********************************\n").

selectCity(City) :- city(X), writeln(X), writeln("Select city"), read(City).

buying(City, Type, Date, Customer, Price) :- type(Types), writeln(Types), writeln("Select Type of Car:"), read(Type), writeln("Enter Date(YYYYMMDD)"), read(Date), writeln("Enter your name: "), read(Customer), writeln("Enter price:"), read(Price), assert(sales(City, Type, Date, Customer, Price)).

start :- displayMenu, selectCity(City), buying(City, Type, Date, Customer, Price).


%STATISTICS

% Returns total revenue of sales by type of car
typeSales(Type, S) :- bagof(Price, City^Date^Customer^sales(City, Type, Date, Customer, Price), SL), sum(SL, S).

% Returns type of car sold according to number of cars sold
numberSales(Type, N) :- bagof(Price, City^Date^Customer^Price^sales(City, Type, Date, Customer, Price), SL), length(SL, N), assert(typeQuatity(Type, N)).

% Returns decreasing list of
sortbytype(Output) :- findall([X,Y],typeQuatity(X,Y),List),
sort(2, @>, List, OrderedList),
Output = OrderedList.

mostSales(City, S) :- bagof(Price, Type^Date^Customer^sales(City, Type
                                                           , Date, Customer, Price), SL), sum(SL, S), writeln(S).



% Returns type, sales by year
byYear(Year, S, Type) :- bagof(Price, City^Date^Customer^(sales(City, Type, Date, Customer, Price), Year is Date // 10000), SL), sum(SL, S), assert(typeRevenue(Type, S)).

% Returns decreasing list of
sortbytypeyear(Output) :- findall([X,Y],typeRevenue(X,Y),List),
sort(2, @>, List, OrderedList),
Output = OrderedList.

% Returns total revenue of sales by city
citySalesRevenue(City, S) :- bagof(Price, Type^Date^Customer^sales(City, Type, Date, Customer, Price), SL), sum(SL, S).

% Returns number of cars sold
citySalesNumber(City, N) :- bagof(Price, Type^Date^Customer^sales(City, Type, Date, Customer, Price), SL), length(SL, N).

citySalesByYear(Year, S, City) :- bagof(Price, Type^Date^Customer^(sales(City, Type, Date, Customer, Price), Year is Date // 10000), SL), sum(SL, S), assert(cityRevenue(City, S)).

sortbycityyear(Output) :- findall([X,Y],cityRevenue(X,Y),List),
sort(2, @>, List, OrderedList),
Output = OrderedList.

sum([], 0).
sum([H|T], S) :- sum(T, S1), S is S1 + H.


%Movie Data
movie_data(avengers, pecsCC, 10, 0).
movie_data(avengers, budapestCC, 20, 0).
movie_data(avengers, gyorCC, 20, 0).
movie_data(avengers, szegedCC, 10, 0).
movie_data(it, pecsCC, 10, 0).
movie_data(it, budapestCC, 20, 0).
movie_data(it, szegedCC, 15, 0).

%All the movies available
movie([avengers, it]).

:- dynamic movie_data/4.

%Replace existing fact
replace_existing_fact(OldFact, NewFact) :- call(OldFact), retract(OldFact), assert(NewFact).

header :- writeln("------------ CINEMA CITY -----------"), writeln("Pick a movie: ").

pickTheatre(Theatre) :- writeln("Pick a theatre"), read(Theatre).

pickSeats(Seats) :- writeln("How many seats do you need?"), read(X).

% Start the ticket buyer
start :- header, movie(Movies), writeln(Movies), read(Selected_Movie), findall(Theatres, movie_data(Selected_Movie, Theatres, _, _), ListTheatres), writeln(ListTheatres), pickTheatre(Theatre), pickSeats(Seats), Cost is Seats * 1000, writef("You owe %w Ft.\n", [Cost]), movie_data(Selected_Movie, Theatre,X, Y), Z is Y + Seats, replace_existing_fact(movie_data(Selected_Movie, Theatre, X, Y), movie_data(Selected_Movie, Theatre, X, Z)), writeln("Would you like to buy more tickets?(y or n)"), read(Decision), (Decision == y -> start; Decision == n -> writeln("Thank you for shopping with us"); write('\nInvalid Input!!!\n'),fail).

%Find which theatre recieved most guests
theatreGuests(Theatre, G) :- bagof(Seats, Movie^Capacity^movie_data(Movie, Theatre, Capacity, Seats), SL), sum(SL, G).

%wHCIH movie was seen the most
movieGuests(Movie, G) :- bagof(Seats, Theatre^Capacity^movie_data(Movie, Theatre, Capacity, Seats), SL), sum(SL, G).

%hoW MANY guests visited all together
allGuests(G) :- bagof(Seats, Theatre^Movie^Capacity^movie_data(Movie, Theatre, Capacity, Seats), SL), sum(SL, G).

%Gives Income of each theatre
theatreIncome(Theatre, G) :- bagof(Seats, Movie^Capacity^movie_data(Movie, Theatre, Capacity, Seats), SL), sum(SL, X), G is 1000 * X, assert(income(Theatre, G)).

% Sorts income of theatre in decreasing order.
sortTheatreIncome(Output) :- findall([X,Y],income(X,Y),List),
sort(2, @>, List, OrderedList),
Output = OrderedList.


sum([], 0).
sum([H|T], S) :- sum(T, S1), S is S1 + H.


