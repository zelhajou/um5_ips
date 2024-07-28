Create table [dbo].[SSISForLoopExample]
           ([CounterNumber] [int]
           ,[LoopNumber] [varchar](30)
           ,[LastUpdated] Datetime);


Create table [dbo].[SSISForEachLoopEx]
           (
		   [LastName] [varchar](30)
           ,[FirstName] [varchar](30)
           ,[Title] [varchar](30));


Create table [dbo].[SSISSequenceContainerExample]
           (
		   [WeekDay] [varchar](50)
		   ,[LastName] [varchar](50)
           ,[FirstName] [varchar](50)
           ,[Title] [varchar](50));

Drop Table [dbo].[SSISIncremLoad];
Create table [dbo].[SSISIncremLoad]
           (
		   [id] [varchar](50)
		   ,[LastName] [varchar](50)
           ,[FirstName] [varchar](50)
           ,[Title] [varchar](50));


Create table [dbo].[SSISIncremLookup]
           (
		   [id] [varchar](50)
		   ,[LastName] [varchar](50)
           ,[FirstName] [varchar](50)
           ,[Title] [varchar](50));

select * from [dbo].[SSISIncremLookup];
select * from [dbo].[SSISIncremLoad];

Alter table [dbo].[SSISIncremLoad] add isdeleted int;

--select * from [dbo].[SSISIncremLoad] Where isdeleted is null;

update [dbo].[SSISIncremLookup] set Title='CUSTOMER SERVICE REPRESENTATIVE' where id =1;

delete from [dbo].[SSISIncremLookup] where id = 6;



