fruit(apple, red).
fruit(banana, yellow).
fruit(orange, orange).
fruit(grape, purple).
fruit(watermelon, green).

color(Fruit, Color) :-
    fruit(Fruit, Color).
color(Fruit, Color) :-
    fruit(Fruit, Color); not(fruit(Fruit,_)),
    fail.
