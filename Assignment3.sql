Create Table #State
(
ID INT PRIMARY KEY,
[State] NVARCHAR(30)
);

INSERT INTO #State (ID, [State])
VALUES
	(1, 'Maine'),
	(2, 'Vermont'),
	(3, 'Massachusetts'),
	(4, 'New York'),
	(5, 'Pennsylvania')

Create Table #City
(
	ID INT PRIMARY KEY,
	StateID INT,
	City NVARCHAR(50),
	CONSTRAINT FK_State_City FOREIGN KEY (StateID)
		REFERENCES	#State (ID)
);
INSERT INTO #City (ID, StateID, City)
VALUES
	(1, 1, 'Portland'),
	(2, 1, 'Bangor'),
	(3, 1, 'Augusta'),
	(4, 2, 'Stowe'),
	(5, 2, 'Littleton'),
	(6, 2, 'Berlin'),
	(7, 3, 'Worcester'),
	(8, 3, 'Boston'),
	(9, 3, 'Springfield'),
	(10, 4, 'New York'),
	(11, 4, 'Buffalo'),
	(12, 4, 'Albany'),
	(13, 5, 'Lancaster'),
	(14, 5, 'Philadelphia'),
	(15, 5, 'Pittsburgh');

Create Table #tableThree
(
	ID INT Primary KEY,
	CityName NVARCHAR(50),
	StateName NVARCHAR(30)
);
INSERT INTO #tableThree (ID, CityName, StateName)
	Select c.ID, c.City, s.[State]
	From #City c
	Inner Join #State s
		ON c.StateID = s.ID

UPDATE #tableThree
Set StateName = 'Wisconsin'
WHERE ID = 6 or ID = 13;

--dont know whats desired of me for question 5

ALTER TABLE #tableThree
ADD [Date] Datetime DEFAULT 01-01-1998

INSERT INTO #tableThree (ID, CityName, StateName)
VALUES
(23, 'Nekoosa', 'Wisconsin', 06-01-2018);