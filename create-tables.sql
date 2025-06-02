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

create table if not exists Person (
    Id integer primary key,
    FirstName nvarchar(40),
    LastName nvarchar(40)
);