-- zad 1
select sum(SalesAmount) as sum, OrderDateKey
from FactInternetSales
group by OrderDateKey order by OrderDateKey;


with SumByDate as (select sum(SalesAmount) as sum, OrderDateKey
from FactInternetSales
group by OrderDateKey)

select sum(SumByDate.sum) over(order by OrderDateKey rows between 2 preceding and current row) as sum, OrderDateKey
from SumByDate

-- zad 2

select month(OrderDate)           as month_of_year,
       coalesce(sum(pvt.[0]), 0)  as [0],
       coalesce(sum(pvt.[1]), 0)  as [1],
       coalesce(sum(pvt.[2]), 0)  as [2],
       coalesce(sum(pvt.[3]), 0)  as [3],
       coalesce(sum(pvt.[4]), 0)  as [4],
       coalesce(sum(pvt.[5]), 0)  as [5],
       coalesce(sum(pvt.[6]), 0)  as [6],
       coalesce(sum(pvt.[7]), 0)  as [7],
       coalesce(sum(pvt.[8]), 0)  as [8],
       coalesce(sum(pvt.[9]), 0)  as [9],
       coalesce(sum(pvt.[10]), 0) as [10]
from FactInternetSales pivot
         (
         sum(SalesAmount)
         for SalesTerritoryKey in
        ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10])
         ) as pvt
where year(OrderDate) = 2011
group by month(OrderDate)
order by month_of_year;


-- zad 3
select *
from (select null as 'OrganizationKey', null as 'DepartmentGroupKey', sum(Amount) as amount
	from FactFinance
	union
	select OrganizationKey, null as 'DepartmentGroupKey', sum(Amount) as amount
	from FactFinance
	group by OrganizationKey
	union
	select OrganizationKey, DepartmentGroupKey, sum(Amount) as amount
	from FactFinance
	group by OrganizationKey, DepartmentGroupKey) tab
order by OrganizationKey, DepartmentGroupKey


-- zad 4
select *
from (select null as 'OrganizationKey', null as 'DepartmentGroupKey', sum(Amount) as amount
	from FactFinance
	union
	select OrganizationKey, null as 'DepartmentGroupKey', sum(Amount) as amount
	from FactFinance
	group by OrganizationKey
	union
	select OrganizationKey, DepartmentGroupKey, sum(Amount) as amount
	from FactFinance
	group by OrganizationKey, DepartmentGroupKey
	union
	select null as 'OrganizationKey', DepartmentGroupKey, sum(Amount) as amount
	from FactFinance
	group by DepartmentGroupKey
	) tab
order by OrganizationKey, DepartmentGroupKey


-- zad 5

with sales as (select sum(Amount) as amount, OrganizationKey
               from FactFinance
               where year(date) = 2012
               group by OrganizationKey)
select percent_rank() over ( order by amount) as percentile, do.OrganizationName, do.OrganizationKey
from sales
         inner join DimOrganization do on do.OrganizationKey = sales.OrganizationKey
order by percentile;

-- zad 6

with sales as (select sum(Amount) as amount, stdev(Amount) as stdev, OrganizationKey
               from FactFinance
               where year(date) = 2012
               group by OrganizationKey)
select percent_rank() over ( order by amount) as percentile, do.OrganizationName, do.OrganizationKey, sales.stdev
from sales
         inner join DimOrganization do on do.OrganizationKey = sales.OrganizationKey
order by percentile;