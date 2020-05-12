use Practice2019

DROP TABLE IF EXISTS dbo.IL_Master
DROP TABLE IF EXISTS dbo.IL


select 
ROW_NUMBER() over (order by (select null)) as rowNum,
SalesOrderNumber,
OrderQuantity,
UnitPrice,
ExtendedAmount,
ProductStandardCost,
TotalProductCost,
SalesAmount,
TaxAmt,
OrderDate,
DueDate,
ShipDate,
'N' as Status
into Practice2019.dbo.IL_Master
from AdventureWorksDW2017.dbo.FactInternetSales

use Practice2019


sp_help 'il_master'

select * from dbo.IL_Master order by rownum

--alter table dbo.IL_Master add Status char(1)

update  dbo.IL_Master set status = 'N'
update  dbo.IL_Master set status = 'U' where rowNum % 2 = 0
update  dbo.IL_Master set status = 'I' where rowNum % 3 = 0
update  dbo.IL_Master set status = 'D' where rowNum % 50 = 0

select status, count(*) from IL_Master group by status

select * from dbo.IL_Master
select * from dbo.il

select 
rowNum,               
SalesOrderNumber,     
OrderQuantity, 
UnitPrice,             
ExtendedAmount,        
ProductStandardCost,   
TotalProductCost,      
SalesAmount,           
TaxAmt,                
OrderDate,               
DueDate,                 
ShipDate into dbo.IL  from dbo.IL_Master where isnull(status,'') <> 'I'

create clustered index IX_rowNum on dbo.IL (rowNum)

select * from dbo.IL 

sp_help 'il_master'
sp_help 'il'
	
update dbo.IL_Master set status = default
