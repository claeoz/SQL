Create Procedure TruncateName
as
Begin
	Select top 10 [Name], SUBSTRING([Name], 2, 2) from Production.[Product];
End;

Create Procedure TacofyName
as
Begin
	Select top 10 [Name], REPLACE([Name], 'b', 'tacos') from Production.[Product];
End;

Create Procedure CheckDateDifferance
as
Begin
	select top 10 RateChangeDate, Datediff(Day, RateChangeDate, GETDATE()) from HumanResources.EmployeePayHistory
End;

Create Procedure RoundPayRate
as
Begin
	select top 10 Floor(Rate) from HumanResources.EmployeePayHistory;
End;

Create Procedure CheckForHumanRightsViolations
as
Begin
	Select top 10 ISNULL(Rate, 98991.00)
	from HumanResources.EmployeePayHistory
	where Rate is null;
End;

Create Procedure TheStoredProcedureToEndAllStoredProcedures
	@ID int
as
Begin
	If @ID = 1
		Execute TruncateName
	If @ID = 2 
		Execute TacofyName
	If @ID = 3 
		Execute CheckDateDifferance
	If @ID = 4 
		Execute RoundPayRate
	If @ID = 5
		Execute CheckForHumanRightsViolations
End;