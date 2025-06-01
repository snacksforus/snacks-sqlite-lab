create table if not exists Snack (
    Id integer primary key,
    Name nvarchar(40)
);

create table if not exists Ingredient (
    Id integer primary key,
    Name nvarchar(40)
);

create table if not exists SnackIngredient (
    SnackId integer,
    IngredientId integer
);
