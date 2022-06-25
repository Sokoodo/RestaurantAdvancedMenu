ingredient(tomato).
ingredient(onion).
ingredient(chicken_meat).
ingredient(egg).
ingredient(bread).
ingredient(flour). 
ingredient(pork_meat).
ingredient(cheese).
ingredient(mushroom).
ingredient(pasta).
 
beverage(water).
beverage(wine).
beverage(cola).

meal(pizza_margherita).
meal(cheeseburger).
meal(pizza_boscaiola).
meal(pizza_cipolla).
meal(carbonara).

category(meat).
category(vegetables).
category(dairy).
category(low_calories).
category(gluten).
category(other_animal_derivate).

made_with(pizza_margherita, cheese).
made_with(pizza_margherita, flour).
made_with(pizza_margherita, tomato).
made_with(cheeseburger, cheese).
made_with(cheeseburger, pork_meat).
made_with(cheeseburger, bread).
made_with(cheeseburger, salad).
made_with(pizza_boscaiola, flour).
made_with(pizza_boscaiola, mushroom).
made_with(pizza_boscaiola, pork_meat).
made_with(pizza_boscaiola, cheese).
made_with(pizza_cipolla, flour).
made_with(pizza_cipolla, onion).
made_with(carbonara, pasta).
made_with(carbonara, cheese).
made_with(carbonara, pork_meat).
made_with(carbonara, egg).


contains(meat, pork_meat).
contains(meat, chicken_meat).
contains(vegetables, onion).
contains(vegetables, tomato).
contains(vegetables, mushroom).
contains(dairy, cheese).
contains(low_calories, onion).
contains(low_calories, tomato).
contains(low_calories, mushroom).
contains(low_calories, flour).
contains(low_calories, bread).
contains(low_calories, chicken_meat).
contains(gluten, pasta).
contains(gluten, flour).
contains(gluten, bread).
contains(other_animal_derivate, egg).

guest(vegetarian).
guest(carnivore).
guest(calorie_conscious).
guest(gluten_free).
guest(lactose_free).

eatable_by(carnivore, meat).
eatable_by(carnivore, vegetables).
eatable_by(carnivore, dairy).
eatable_by(carnivore, low_calories).
eatable_by(carnivore, gluten).
eatable_by(vegetarian, vegetables).
eatable_by(vegetarian, dairy).
eatable_by(vegetarian, low_calories).
eatable_by(vegetarian, gluten).
eatable_by(calorie_conscious, low_calories).

restaurant_menu([pizza_margherita|cheeseburger|pizza_boscaiola|pizza_cipolla|carbonara]).


list_member(X,[pizza_margherita|cheeseburger|pizza_boscaiola|pizza_cipolla|carbonara]).
list_member(X,[_|TAIL]) :- list_member(X,TAIL).

gluten_free(X) :-
	made_with(X, Y),
	contains(Z, Y),
	Z \== gluten,
	meal(X),
	write(restaurant_menu+'is gluten free').

/* _ = anonymus character */
/* cube :-
	write('Write a number: '),
	read(Number),
    write(Number+"Ciao").
	TO READ FROM CONSOLE