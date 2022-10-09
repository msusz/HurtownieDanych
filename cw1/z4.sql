--Proszę stworzyć tabelę która pokaże kwotę każdego zamówienia w jednej kolumnie wraz z id 
--zamówienia w drugiej, oraz średniej kwocie zamówienia dla każdego miesiąca
--(w tym przypadku Common Table Expressions mogą okazać się szczególnie przydatne)

WITH temp AS (
SELECT od.order_id, sum(p.price*od.quantity) order_amount, month(o.date) as mnt, o.date
	FROM [1].[dbo].[order_details] od
	JOIN [1].[dbo].[pizzas] p on p.pizza_id = od.pizza_id
	JOIN [1].[dbo].[orders] o on o.order_id = od.order_id
	GROUP BY od.order_id, o.date
),

monthly_averages AS (
SELECT mnt, avg(order_amount) average_month_amount
	FROM temp
	GROUP BY mnt
)

SELECT t.order_id, t.order_amount, ma.average_month_amount, t.date
	FROM temp t 
	JOIN monthly_averages ma on t.mnt = ma.mnt