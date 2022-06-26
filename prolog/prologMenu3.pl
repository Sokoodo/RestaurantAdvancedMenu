
vegetarian(pecorino_cheese).
vegetarian(egg).
vegetarian(X) :- vegan(X).
vegan(flour).
vegan(tomato).
vegan(pasta).
vegan(onion).
vegan(lettuce).

carnivore(bacon).
carnivore(X) :- vegetarian(X).

has_lactose(pecorino_cheese).

has_gluten(pasta).

meal(pizza_margherita).
meal(carbonara).
meal(salad).

ingredient(pizza_margherita, cheese).
ingredient(pizza_margherita, flour).
ingredient(pizza_margherita, tomato).
ingredient(carbonara, pasta).
ingredient(carbonara, pecorino_cheese).
ingredient(carbonara, bacon).
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

carnivore_menu(Meal) :-
    distinct(
        ingredient(Meal, Ing),
        carnivore(Ing)
        ),
    write(Meal).

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


/*davide(Person,X) :-
    write("ciao"),
    meal(X).*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    