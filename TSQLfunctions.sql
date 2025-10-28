Select top 10 [Name], SUBSTRING([Name], 2, 2) from Production.[Product];
--this can be usefull for peculiar truncation when the strings 
--follow a particular pattern

Select top 10 [Name], REPLACE([Name], 'b', 'tacos') from Production.[Product];
--can be used to reformat a date or a string to be more complient with 
--the language you're working with

select top 10 RateChangeDate, Datediff(Day, RateChangeDate, GETDATE()) from HumanResources.EmployeePayHistory
--this one is kind of a double but datediff is usefull for comparing dates
--while get date is a convenient tool to get the current date to build your 
--logic off of

select top 10 Floor(Rate) from HumanResources.EmployeePayHistory;
--allow to tidy up and make a more clean display by rounding down

Select top 10 ISNULL(Rate, 98991.00)
from HumanResources.EmployeePayHistory
where Rate is null;
--it allows you to substitute for calculation on the instance of null