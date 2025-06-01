delete from Snack;
delete from Ingredient;
delete from SnackIngredient;

insert into Snack (Id, Name)
values
    (1, 'Banana'),
    (2, 'Complete Cookie'),
    (3, 'Snickers');

insert into Ingredient (Id, Name)
values
    (1, 'Chocolate Chips'),
    (2, 'Corn Syrup'),
    (3, 'Milk Chocolate'),
    (4, 'Peanuts'),
    (5, 'Protein Blend'),
    (6, 'Wheat Flour');

insert into SnackIngredient (SnackId, IngredientId)
values
    (2, 1),
    (2, 5),
    (2, 6),
    (3, 2),
    (3, 3),
    (3, 4);

-- Inner join to find ingredients for all snacks that have at least one ingredient.
select snack.name, Ingredient.Name
from snack
    inner join SnackIngredient on snack.id = SnackIngredient.SnackId
    inner join Ingredient on SnackIngredient.IngredientId = Ingredient.Id;
