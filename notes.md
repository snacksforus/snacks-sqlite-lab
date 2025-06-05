# Notes

## Pragmas

Consider setting the following pragmas:

- `journal_mode = WAL`: transactions use a write-ahead log instead of rollback journal
   Readers do not block writers and writers do not block readers.
   See [Write-Ahead Logging](https://www.sqlite.org/wal.html) for advantages and disadvantages.
- `synchronous = NORMAL`: database synchronizes less frequently, but is still when using
   a write-ahead log 
- `cache_size = -1000000`: set the suggested maximum size of disk pages to about 1GB
- `foreign_keys = true`: enforce foreign key constraint
- `busy_timeout = 5000`: adjusts how long the database will wait before raising a `SQLITE_BUSY`
   error.  Consider 5000 (5 seconds) to 15000 (15 seconds).

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

## Transactions

Consider using `BEGIN IMMEDIATE` transactions.  This will cause a lock to immediately be placed
on the database.  The default behavior of `BEGIN` is to upgrade the transaction and place a lock
when the transaction actually writes to the database.  The default behavior can allow another
process to place a lock on the database while the first process is in the middle of a `BEGIN`
transaction.