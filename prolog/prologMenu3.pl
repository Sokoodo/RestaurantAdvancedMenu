
vegetarian(cheese).
vegetarian(egg).
vegetarian(X) :- vegan(X).
vegan(flour).
vegan(tomato).
vegan(pasta).
vegan(onion).
vegan(lettuce).

carnivore(pork_meat).
carnivore(X) :- vegetarian(X).

ingredient(pizza_margherita, cheese).
ingredient(pizza_margherita, flour).
ingredient(pizza_margherita, tomato).
ingredient(carbonara, cheese).
ingredient(carbonara, pork_meat).
ingredient(carbonara, pasta).
ingredient(carbonara, egg).
ingredient(salad, tomato).
ingredient(salad, onion).
ingredient(salad, lettuce).

non_vegetarian_menu(Meal) :- 
    ingredient(Meal, Ing), 
    not(vegetarian(Ing)).
vegetarian_menu(Meal) :- 
    not(non_vegetarian_menu(Meal)).

non_vegan_menu(Meal) :- 
    ingredient(Meal, Ing), 
    not(vegan(Ing)),
    write(Ing).
vegan_menu(Meal) :- 
    not(non_vegan_menu(Meal)).

menu(M, X) :-
    distinct(ingredient(X,Y)),
    distinct(write(X)),
    vegan(Y).
    
/*
super_vegan(Menu) :- 
    vegan_menu(M),
    ingredient(M,I), vegan(I).*/


