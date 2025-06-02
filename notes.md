# Notes

## Joins

An inner join combines columns from tables where the join condition matches.

```sqlite
select snack.name, Ingredient.Name
from snack
    inner join SnackIngredient on snack.id = SnackIngredient.SnackId
    inner join Ingredient on SnackIngredient.IngredientId = Ingredient.Id;
```

A left join combines columns from two tables A and B where the join condition is true.
It includes all rows from table A, if there is no corresponding row from table B the
columns from table B are NULL.

```sqlite
select Snack.Name, Ingredient.Name
from Snack
left join SnackIngredient on Snack.Id = SnackIngredient.SnackId
left join Ingredient on SnackIngredient.IngredientId = Ingredient.Id;
```

A right join combines columns from two tables A and B where the join condition is true.
It includes all rows from table B, if there is no ocrresponding row from table A the
columns from table A are NULL.

```sqlite
select Snack.name, Ingredient.Name
from Snack
right join SnackIngredient on snack.Id = SnackIngredient.SnackId
right join Ingredient on SnackIngredient.IngredientId = Ingredient.Id;
```

A cross join does a cartisian product of two tables.

```sqlite
select Person.FirstName, Person.LastName, Snack.Name
from Person
cross join Snack;
```

A full outer join combines a left joing and a right join.

```sqlite
select Snack.Name, Ingredient.Name
from Snack
full outer join SnackIngredient on Snack.id = SnackIngredient.SnackId
full outer join Ingredient on SnackIngredient.IngredientId = Ingredient.Id;
```