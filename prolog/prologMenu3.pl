vegetarian(pecorino_cheese).
vegetarian(mozzarella_cheese).
vegetarian(egg).
vegetarian(X) :- vegan(X).
vegan(rocket).
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
carnivore(bacon).
carnivore(beef).
carnivore(X) :- vegetarian(X).

has_lactose(pecorino_cheese).
has_lactose(mozzarella_cheese).
has_gluten(pasta).
has_gluten(flour).
has_gluten(breadcrumbs).

has_low_calories(rocket).
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

non_lactose(I) :- 
    carnivore(I),
    not(has_lactose(I)).

non_gluten(I) :- 
    carnivore(I),
    not(has_gluten(I)).

non_low_calories(I) :- 
    carnivore(I),
    not(has_low_calories(I)).

meal(pizza_margherita).
meal(carbonara).
meal(salad).
meal(beef_steak).
meal(pasta_arrabbiata).
meal(risotto_funghi).
meal(mixed_fried_food).

ingredient(pizza_margherita, mozzarella_cheese).
ingredient(pizza_margherita, flour).
ingredient(pizza_margherita, tomato).
ingredient(carbonara, pasta).
ingredient(carbonara, pecorino_cheese).
ingredient(carbonara, bacon).
ingredient(carbonara, egg).
ingredient(salad, tomato).
ingredient(salad, onion).
ingredient(salad, lettuce).
ingredient(beef_steak, beef).
ingredient(beef_steak, tomato).
ingredient(beef_steak, rocket).
ingredient(pasta_arrabbiata, pasta).
ingredient(pasta_arrabbiata, tomato).
ingredient(pasta_arrabbiata, garlic).
ingredient(pasta_arrabbiata, hot_pepper).
ingredient(risotto_funghi, rice).
ingredient(risotto_funghi, mushroom).
ingredient(risotto_funghi, onion).
ingredient(risotto_funghi, parsley).
ingredient(mixed_fried_food, potato).
ingredient(mixed_fried_food, breadcrumbs).
ingredient(mixed_fried_food, onion).


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

menu(X) :- repeat,
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
    write('Are you calorie-conscious'),nl,
    write('1. Yes'),nl,
    write('2. No'),nl,nl,
    write('Enter your choice number below:'),nl,
    read(Calorie_conscious), Calorie_conscious>0, Calorie_conscious =<2,
    write('Your choice is = '), write(Calorie_conscious),
    
    
    /*nl,nl,
    write(Type),nl,
    write(Lactose_intolerant),nl,
    write(Gluten_intolerant),nl,
    write(Calorie_conscious),nl,*/
    
    /*show_menu(Choice), Choice=6,*/ 
    pippo(Type,Lactose_intolerant,Gluten_intolerant,Calorie_conscious, X),
    !.


/* get_menu(Type,Lactose_intolerant,Gluten_intolerant,Calorie_conscious) :- */
get_menu(1,2,2,2) :-
    nl,
    write('You are:'),nl,
    write('- carnivore'),nl,
    write('- non lactose-intolerant'),nl,
    write('- non gluten-intolerant'),nl,
    write('- non calorie-conscious'),nl.

get_menu(1,1,2,2) :-
    nl,
    write('You are:'),nl,
    write('- carnivore'),nl,
    write('- non lactose-intolerant'),nl,
    write('- non gluten-intolerant'),nl,
    write('- non calorie-conscious'),nl.

pippo(Type,Lactose_intolerant,Gluten_intolerant,Calorie_conscious, X) :-
    nl,
      Type=:=1->  
    	nl,write('You are carnivore'),
    	nl,write(Lactose_intolerant),
    	nl,write(Gluten_intolerant),
    	nl,write(Calorie_conscious),
    	nl,meal(X)
    ;
    Type=:=2->  write('You are vegetarian');
    Type=:=3->  write('You are vegan').
    
type(Type, Meal) :-
    Type=:=1->
    	meal(Meal),
    	vegetarian_menu(Meal);
    Type=:=2->
    	meal(Meal),
    	vegan_menu(Meal);
    Type=:=3->
   		meal(Meal),
    	carnivore_menu(Meal).

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
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    