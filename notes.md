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