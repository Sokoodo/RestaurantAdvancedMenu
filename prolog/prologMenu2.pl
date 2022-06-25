vegetarian(cheese).
vegetarian(egg).
vegan(flour).
vegan(tomato).
vegan(pasta).
carnivore(pork_meat).

vegetarian(X) :- vegan(X).

type_food(vegetarian).
type_food(vegan).

category_food(gluten).
category_food(dairy).
category_food(low_calories).

ingredient_is(vegetarian, egg).
ingredient_is(vegetarian, cheese).
ingredient_is(vegan, flour).
ingredient_is(vegan, tomato).

beverage(water).
beverage(wine).
beverage(cola).

meal(pizza_margherita).
meal(carbonara).

/*
meal_type(vegetarian).
meal_type(vegan).*/

made_with(pizza_margherita, cheese).
made_with(pizza_margherita, flour).
made_with(pizza_margherita, tomato).
made_with(carbonara, cheese).
made_with(carbonara, pork_meat).
made_with(carbonara, pasta).
made_with(carbonara, egg).

guest(carnivore).
guest(vegetarian).
guest(vegan).

is_vegetarian(Meal) :-
    made_with(Meal, X),
    ingredient_is(vegetarian, X);
    ingredient_is(vegan, X),
    meal(Meal),
    write(X).
    
    

client_is(TypeGuest) :-
    write(TypeGuest).