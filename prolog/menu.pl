vegetarian(pecorino_cheese).
vegetarian(mozzarella_cheese).
vegetarian(mascarpone_cheese).
vegetarian(egg).
vegetarian(cookie).
vegetarian(butter).
vegetarian(milk).
vegetarian(X) :- vegan(X).

vegan(rocket_salad).
vegan(flour).
vegan(tomato).
vegan(pasta).
vegan(onion).
vegan(lettuce).
vegan(hot_pepper).
vegan(garlic).
vegan(mushroom).
vegan(rice).
vegan(parsley).
vegan(potato).
vegan(breadcrumbs).
vegan(aubergine).
vegan(zucchini).
vegan(sugar).
vegan(coffee).
vegan(apple).
vegan(lemon).
vegan(banana).
vegan(grape).
vegan(kiwi).

carnivore(bacon).
carnivore(beef).
carnivore(pepperoni).
carnivore(ham).
carnivore(X) :- vegetarian(X).

has_lactose(pecorino_cheese).
has_lactose(mozzarella_cheese).
has_lactose(mascarpone_cheese).
has_lactose(butter).
has_lactose(milk).

has_gluten(pasta).
has_gluten(flour).
has_gluten(breadcrumbs).
has_gluten(cookie).

has_low_calories(rocket_salad).
has_low_calories(flour).
has_low_calories(tomato).
has_low_calories(pasta).
has_low_calories(onion).
has_low_calories(lettuce).
has_low_calories(hot_pepper).
has_low_calories(garlic).
has_low_calories(mushroom).
has_low_calories(rice).
has_low_calories(parsley).
has_low_calories(potato).
has_low_calories(breadcrumbs).
has_low_calories(aubergine).
has_low_calories(zucchini).
has_low_calories(coffee).
has_low_calories(apple).
has_low_calories(lemon).
has_low_calories(banana).
has_low_calories(grape).
has_low_calories(kiwi).

non_lactose(I) :- 
    carnivore(I),
    not(has_lactose(I)).

non_gluten(I) :- 
    carnivore(I),
    not(has_gluten(I)).

non_low_calories(I) :- 
    carnivore(I),
    has_low_calories(I).


/* First dishes */
meal(pasta_carbonara).
meal(pasta_arrabbiata).
meal(mushroom_risotto).

/* Main dishes */
meal(pizza_margherita).
meal(pepperoni_pizza).
meal(pizza_boscaiola).
meal(beef_steak).

/* Side dishes */
meal(mixed_salad).
meal(grilled_vegetables).
meal(mixed_fried_food).

/* Desserts */
meal(tiramisu).
meal(apple_pie).
meal(mixed_fruit).

ingredient(pasta_carbonara, pasta).
ingredient(pasta_carbonara, pecorino_cheese).
ingredient(pasta_carbonara, bacon).
ingredient(pasta_carbonara, egg).
ingredient(pasta_arrabbiata, pasta).
ingredient(pasta_arrabbiata, tomato).
ingredient(pasta_arrabbiata, garlic).
ingredient(pasta_arrabbiata, hot_pepper).
ingredient(mushroom_risotto, rice).
ingredient(mushroom_risotto, mushroom).
ingredient(mushroom_risotto, onion).
ingredient(mushroom_risotto, parsley).

ingredient(pizza_margherita, mozzarella_cheese).
ingredient(pizza_margherita, flour).
ingredient(pizza_margherita, tomato).
ingredient(pepperoni_pizza, mozzarella_cheese).
ingredient(pepperoni_pizza, flour).
ingredient(pepperoni_pizza, tomato).
ingredient(pepperoni_pizza, pepperoni).
ingredient(pizza_boscaiola, mozzarella_cheese).
ingredient(pizza_boscaiola, flour).
ingredient(pizza_boscaiola, mushroom).
ingredient(pizza_boscaiola, ham).
ingredient(beef_steak, beef).
ingredient(beef_steak, tomato).
ingredient(beef_steak, rocket_salad).

ingredient(mixed_salad, tomato).
ingredient(mixed_salad, onion).
ingredient(mixed_salad, lettuce).
ingredient(grilled_vegetables, aubergine).
ingredient(grilled_vegetables, zucchini).
ingredient(grilled_vegetables, tomato).
ingredient(grilled_vegetables, onion).
ingredient(mixed_fried_food, potato).
ingredient(mixed_fried_food, breadcrumbs).
ingredient(mixed_fried_food, onion).
ingredient(mixed_fried_food, mozzarella_cheese).

ingredient(tiramisu, mascarpone_cheese).
ingredient(tiramisu, egg).
ingredient(tiramisu, sugar).
ingredient(tiramisu, coffee).
ingredient(tiramisu, cookie).
ingredient(apple_pie, apple).
ingredient(apple_pie, lemon).
ingredient(apple_pie, sugar).
ingredient(apple_pie, butter).
ingredient(apple_pie, milk).
ingredient(apple_pie, flour).
ingredient(mixed_fruit, apple).
ingredient(mixed_fruit, banana).
ingredient(mixed_fruit, grape).
ingredient(mixed_fruit, kiwi).


non_vegetarian_menu(Meal) :- 
    ingredient(Meal, Ing), 
    not(vegetarian(Ing)).
vegetarian_menu(Meal) :- 
    not(non_vegetarian_menu(Meal)).

non_vegan_menu(Meal) :- 
    ingredient(Meal, Ing), 
    not(vegan(Ing)).

vegan_menu(Meal) :- 
    not(non_vegan_menu(Meal)).

non_carnivore_menu(Meal) :-
    ingredient(Meal, Ing),
    not(carnivore(Ing)).
carnivore_menu(Meal) :-
    not(non_carnivore_menu(Meal)).

non_lactose_menu(Meal) :-
    ingredient(Meal, Ing),
    not(non_lactose(Ing)).
lactose_menu(Meal) :-
    not(non_lactose_menu(Meal)).

non_gluten_menu(Meal) :-
    ingredient(Meal, Ing),
    not(non_gluten(Ing)).
gluten_menu(Meal) :-
    not(non_gluten_menu(Meal)).

non_low_calories_menu(Meal) :-
	ingredient(Meal, Ing),
    not(non_low_calories(Ing)).
low_calories_menu(Meal) :-
    not(non_low_calories_menu(Meal)).
    
type(Type, Meal) :-
    Type=:=1->
   		meal(Meal),
    	carnivore_menu(Meal);
    Type=:=2->
    	meal(Meal),
    	vegetarian_menu(Meal);
    Type=:=3->
    	meal(Meal),
    	vegan_menu(Meal).

lactose_free(Type, Meal, Lactose_intolerant) :-
    Lactose_intolerant=:=1->
    	meal(Meal),
    	type(Type, Meal),
		lactose_menu(Meal);
    meal(Meal),
    type(Type, Meal).

gluten_free(Type, Meal, Gluten_intolerant) :-
    Gluten_intolerant=:=1->
    	meal(Meal),
    	type(Type, Meal),
		gluten_menu(Meal);
    meal(Meal),
    type(Type, Meal).

low_calories(Type, Meal, Low_calories) :-
    Low_calories=:=1->
    	meal(Meal),
    	type(Type, Meal),
		low_calories_menu(Meal);
    meal(Meal),
    type(Type, Meal).

final_menu(Type,Meal,Lactose_intolerant,Gluten_intolerant,Low_calories) :-
	lactose_free(Type,Meal,Lactose_intolerant),
    gluten_free(Type,Meal,Gluten_intolerant),
    low_calories(Type, Meal, Low_calories).
    
menu(Meal) :-
    nl,
    write('WELCOME TO THE KEBI RESTAURANT!'),nl,nl,
    write('Please help us show which dishes are most suitable for you by providing information about your usual diet :)'),
    nl, nl,
    write('What kind of menu would you like to see?'),nl,
    write('1. Carnivore'),nl,
    write('2. Vegetarian'),nl,
    write('3. Vegan'),nl,nl,
    write('Enter your choice number below:'),nl,
    read(Type), Type>0, Type =<3,
    write('Your choice is = '), write(Type),
    nl,
    
    nl,
    write('Are you lactose-intolerant?'),nl,
    write('1. Yes'),nl,
    write('2. No'),nl,nl,
    write('Enter your choice number below:'),nl,
    read(Lactose_intolerant), Lactose_intolerant>0, Lactose_intolerant =<2,
    write('Your choice is = '), write(Lactose_intolerant),
    nl,
    
    nl,
    write('Are you gluten-intolerant?'),nl,
    write('1. Yes'),nl,
    write('2. No'),nl,nl,
    write('Enter your choice number below:'),nl,
    read(Gluten_intolerant), Gluten_intolerant>0, Gluten_intolerant =<2,
    write('Your choice is = '), write(Gluten_intolerant),
    nl,
    
    nl,
    write('Do you want to eat low-calorie dishes?'),nl,
    write('1. Yes'),nl,
    write('2. No'),nl,nl,
    write('Enter your choice number below:'),nl,
    read(Low_calories), Low_calories>0, Low_calories =<2,
    write('Your choice is = '), write(Low_calories),
    nl,
    
    nl,
    write('Based on the preferences you provided, this is the list of dishes that meet your needs:'),nl,nl,
    final_menu(Type,Meal,Lactose_intolerant,Gluten_intolerant,Low_calories).