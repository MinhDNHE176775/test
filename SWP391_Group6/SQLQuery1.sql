/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [accid]
      ,[username]
      ,[password]
      ,[roleid]
      ,[email]
      ,[status]
  FROM [HappyProgramingEditV3].[dbo].[Account]

  USE HappyProgramingEditV3

  SELECT * FROM [dbo].[Mentor] m JOIN [dbo].[Mentor_Skill] ms ON m.id = ms.mentorid
  JOIN [dbo].[CV] c ON m.id = c.menid