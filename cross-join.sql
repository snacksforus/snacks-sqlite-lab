delete from Snack;
delete from Person;

insert into Person (Id, FirstName, LastName)
values
    (1, 'Harriet', 'Hiker'),
    (2, 'Jane', 'Jogger');

insert into Snack (Id, Name)
values
    (1, 'Banana'),
    (2, 'Complete Cookie'),
    (3, 'Snickers');

select Person.FirstName, Person.LastName, Snack.Name
from Person
cross join Snack;