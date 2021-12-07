SELECT 
		[ID]
      ,[Name] AS 'Competitor Name'
      --,[Sex]
	  ,CASE WHEN SEX = 'M' THEN 'Male' ELSE 'Female' END AS [Sex]
      --,[Age]
	  ,CASE WHEN [Age] < 18 THEN 'Under 18'
			WHEN [Age] BETWEEN 18 AND 25 THEN 'Age Between 18 and 25'
			WHEN [Age] BETWEEN 25 AND 30 THEN 'Age Between 25 and 30'
			WHEN [Age] > 30 THEN 'Age Above 30'
		END AS [Age Grouping]
      ,[Height]
      ,[Weight]
      ,[NOC] AS 'Nation Code'
      ,[Games]
	  ,LEFT(Games, CHARINDEX(' ', Games) -1) AS [Year] -- Split Year into seperate column
	  ,RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) -1) AS [Season]
      --,[City]
      ,[Sport]
      ,[Event]
      --,[Medal]
	  ,CASE WHEN Medal = 'NA' THEN 'Not Registered' 
			WHEN Medal = 'Gold' THEN 'Gold'
			WHEN MEDAL = 'Silver' THEN 'Silver'
			WHEN MEDAL = 'Bronze' THEN 'Bronze'
			END AS [Medal]
  FROM [olympic_games].[dbo].[athletes_event_results]
  WHERE RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) -1) = 'Summer'
